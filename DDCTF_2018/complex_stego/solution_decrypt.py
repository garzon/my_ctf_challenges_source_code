from PIL import Image
import cmath, math, random, string

maxLen = 45
img_size = 800
abs_cor_size = 1.05
maxValue = 2200.0

def linear_map(v, old_dbound, old_ubound, new_dbound, new_ubound):
	return (v-old_dbound)*1.0/(old_ubound-old_dbound)*(new_ubound-new_dbound) + new_dbound
	
def read_from_img(img):
	def mapping(r, i):
		x = int(round(linear_map(r, -abs_cor_size, abs_cor_size, 0, img_size)))
		y = int(round(linear_map(i, -abs_cor_size, abs_cor_size, img_size, 0)))
		return (x, y)
	def X(z):
		pix_pos = mapping(z.real, z.imag)
		t = img.getpixel(pix_pos)
		return complex(linear_map(t[1], 0, 255, -maxValue, maxValue), linear_map(t[2], 0, 255, -maxValue, maxValue))
	return X
	
def z_decrypt(X):
	real_max_val = 0.0
	decrypted = []
	for n in xrange(maxLen):
		res = 0.0
		dw = 0.001
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
	return res
	
img = Image.open('encrypted.bmp')
X = read_from_img(img)
decrypted = z_decrypt(X)
print len(decrypted), decrypted
print '--------- decrypted! ----------------'