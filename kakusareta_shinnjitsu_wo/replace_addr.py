import sys, os, base58, hashlib, random, pwn

pwn.context.arch = 'amd64'

registers = ['rax', 'rbx', 'rcx', 'rdx', 'rdi', 'rsi']
mem_regs = ['qword ptr[rax]', 'qword ptr[rdi]', 'qword ptr[rsi]']
sm_consts = ['0x'+i+j for i in ['1','2'] for j in ['4','8','0','c']]
inst = ['mov', 'push', 'pop', 'add', 'sub','leave','ret','dummy']
cs = [0x90909090, 0xdeadbeef, 0xcafebabe, 0x1ee71337, 0x0]
def random_bytes():
	while True:
		raw = random.randint(1, 0xffffffff)
		if raw not in cs:
			return ''.join(['.byte 0x%02x;' % ord(i) for i in pwn.p32(raw)])
def random_inst(times=1):
	raw = random_bytes() + random_bytes()
	for t in xrange(times):
		asm = random.choice(inst)
		if asm == 'dummy':
			asm = random_bytes()
		if asm in ['push', 'pop', 'mov', 'sub', 'add']:
			asm += ' ' + random.choice(registers+(mem_regs if asm in ['mov','add','sub'] else []))
		if asm[:3] in ['mov', 'sub', 'add']:
			asm += ',' + random.choice(registers+([] if '[' in asm else mem_regs)+sm_consts)
		raw += asm+';'
	raw = pwn.asm(raw)
	print '======='
	print pwn.disasm(raw)
	print '======='
	for i in cs:
		i = pwn.p32(i)
		assert i not in raw
	return raw

def random_data():
	res = '.long 0xdeadda7a;'
	res += ''.join(['.byte 0x%02x;' % ord(j) for j in random_inst(64)])
	return res

def replace_in_file(fname, orig, newv):
	with open(fname, 'rb') as f:
		source = f.read()
	for a, _b in zip(orig, newv):
		stpos = 0
		ipos = stpos+source[stpos:].find(a)
		while ipos != -1+stpos:
			if str(type(_b)) == "<type 'function'>":
				b = _b()
			else:
				b = _b
			thisStr = source[ipos+len(a):]
			jpos = thisStr.index('"')
			thisStr = thisStr[:jpos]
			stpos = ipos+len(a)+len(b)
			source = source[:ipos+len(a)]+b+source[ipos+len(a)+jpos:]
			assert source[stpos] == '"'
			ipos = stpos+source[stpos:].find(a)
	with open(fname, 'wb') as f:
		f.write(source)
		
def xor(a, b):
	raw = [(ord(i) ^ ord(j)) for i, j in zip(a,b)]
	return ''.join([r'\x%02x' % i for i in raw])

if len(sys.argv) == 1: 
	sys.argv.append('1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa')

bitcoin_addr = sys.argv[1]
genesis_block_hash = "000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f".decode('hex')
replace_in_file('kakusareta_shinnjitsu_wo.cpp', ['unsigned char hashes[] = "', 'unsigned char baddr[] = "', '/* dead data here */asm volatile("'], [xor(hashlib.sha256(bitcoin_addr).digest(), genesis_block_hash), bitcoin_addr, random_data])

with open('input.txt', 'wb') as f:
	f.write('efbeadde\n')
	f.write(base58.b58decode_check(bitcoin_addr).encode('hex')+'\n')
	f.write('0100000000000000000000000000000000000000000000000000000000000000000000003ba3edfd7a7b12b27ac72c3e67768f617fc81bc3888a51323a9fb8aa4b1e5e4a29ab5f49ffff001d1dac2b7c\n')

os.system("./compile.sh; ./kakusareta_shinnjitsu_wo.elf < input.txt > flag.txt")
with open('flag.txt', 'rb') as f:
	flag = f.read()
flag = flag[flag.index('The final flag is ')+len('The final flag is '):].split(' ')[0]
os.mkdir(flag)
os.system('cp ./kakusareta_shinnjitsu_wo.elf {}/'.format(flag))
