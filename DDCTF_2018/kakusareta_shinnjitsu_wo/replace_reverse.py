with open('kakusareta_shinnjitsu_wo.S', 'rb') as f:
	source = f.read().replace('.text._ZN7BitcoinC2Ev', '.bss._ZN7BitcoinC2Ev').replace('.rodata', '.data')

with open('kakusareta_shinnjitsu_wo.S', 'wb') as f:
	f.write(source)