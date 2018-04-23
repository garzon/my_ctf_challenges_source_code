from PIL import Image
import cmath, math, random, string, os

didi = Image.open('didi.png')

maxLen = 45
img_size = 800
abs_cor_size = 1.05
maxValue = 2200.0

def linear_map(v, old_dbound, old_ubound, new_dbound, new_ubound):
	return (v-old_dbound)*1.0/(old_ubound-old_dbound)*(new_ubound-new_dbound) + new_dbound

def z_encrypt(s):
	if len(s) > maxLen:
		raise Exception("length of the input exceeds limit!")
	def X(z):
		res = 0j
		p = 1 + 0j
		try:
			for c in s:
				res += (string.printable.index(c)+1) * p
				p = p / z
				if cmath.isnan(p): return 0j
		except:
			return 0j
		if cmath.isnan(res): return 0j
		return res
	return X
	
def draw_img(X):
	def calc_color(v, red):
		old_v = v
		if v.real > maxValue: v = complex(maxValue, v.imag)
		if v.real < -maxValue: v = complex(-maxValue, v.imag)
		if v.imag > maxValue: v = complex(v.real, maxValue)
		if v.imag < -maxValue: v = complex(v.real, -maxValue)
		r = int(round(linear_map(v.real, -maxValue, maxValue, 0, 255)))
		i = int(round(linear_map(v.imag, -maxValue, maxValue, 0, 255)))
		return (red, r, i)
	def unmapping(x, y):
		return complex(linear_map(x, 0, img_size, -abs_cor_size, abs_cor_size), linear_map(y, 0, img_size, abs_cor_size, -abs_cor_size))
	img = Image.new('RGB', (img_size, img_size))
	for col in xrange(img_size):
		for row in xrange(img_size):
			img.putpixel((col, row), calc_color(X(unmapping(col, row)), didi.getpixel((col, row))[0]))
	return img
	
	
def read_from_img(img):
	def mapping(r, i):
		x = int(round(linear_map(r, -abs_cor_size, abs_cor_size, 0, img_size)))
		y = int(round(linear_map(i, -abs_cor_size, abs_cor_size, img_size, 0)))
		return (x, y)
	def X(z):
		pix_pos = mapping(z.real, z.imag)
		t = img.getpixel(pix_pos)
		img.putpixel(pix_pos, (0, t[1], t[2]))
		return complex(linear_map(t[1], 0, 255, -maxValue, maxValue), linear_map(t[2], 0, 255, -maxValue, maxValue))
	return X
	
def z_decrypt(X):
	real_max_val = 0.0
	decrypted = []
	for n in xrange(maxLen):
		res = 0.0
		dw = 0.01
		w = -math.pi
		while w < math.pi:
			v = X(pow(math.e, 1j * w))
			if v.real > real_max_val: real_max_val = v.real
			if v.imag > real_max_val: real_max_val = v.imag
			res += v * pow(math.e, 1j * w * n) * dw
			w += dw
		decrypted.append(res/math.pi/2)
	print 'realmax', real_max_val
	err = [math.fabs(j.imag) for j in decrypted]
	res = ''.join([string.printable[j-1] if j <= len(string.printable) and j >= 1 else '?' for i in decrypted for j in [int(round(i.real))]]).strip('?')
	print err, sum(err)/len(res)
	return res

counter = 0	
while counter < 10:
	for flag in ['2tR@n5F0rm_', 'ZtR@n5F0rm_', 'ZtR@nSF0rm_', 'ZtR@nSFOrm_', '2tR@nSFOrm_']:
		print '============== encrypting ================='
		flag += ''.join(['0123456789abcdef'[random.randint(0, 15)] for _ in xrange(4)])
		text = 'DDCTF{'+flag+'} '+flag
		X = z_encrypt(text)
		img = draw_img(X)
		os.system("mkdir "+flag)
		fname = flag+'/encrypted.bmp'
		img.save(fname)
		print '--------- encrypted! ----------------'

		img = Image.open(fname)
		X = read_from_img(img)
		decrypted = z_decrypt(X)
		img.save('tmp.png')
		print len(decrypted), decrypted == text, text, decrypted
		if decrypted != text:
			os.system("rmdir /s /q "+flag)
		else:
			print '--------- decrypted! ----------------'
			os.system("copy encrypt.py "+flag)
			os.system("copy didi.png "+flag)
			os.system("copy encrypted_DDCTF{}.png "+flag)
			counter += 1