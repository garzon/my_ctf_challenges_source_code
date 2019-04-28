from PIL import Image
import cmath, math, random, string

text = 'DDCTF{}'
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
	

X = z_encrypt(text)
img = draw_img(X)
img.save('encrypted_DDCTF{}.png')
print '--------- encrypted! ----------------'
