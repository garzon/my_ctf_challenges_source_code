from PIL import Image
import cmath, math, random, string, numpy

maxLen = 45
img_size = 800
abs_cor_size = 1.05
maxValue = 2200.0

def linear_map(v, old_dbound, old_ubound, new_dbound, new_ubound):
	return (v-old_dbound)*1.0/(old_ubound-old_dbound)*(new_ubound-new_dbound) + new_dbound
	
def unmapping(x, y):
	return complex(linear_map(x, 0, img_size, -abs_cor_size, abs_cor_size), linear_map(y, 0, img_size, abs_cor_size, -abs_cor_size))
	
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
	
img = Image.open('encrypted.bmp')
X = read_from_img(img)


valid_points = []
A = []
y = []
while len(valid_points) != 1000:
	point = (random.randint(0, img_size-1), random.randint(0, img_size-1))
	pix = img.getpixel(point)
	if pix[1] > 2 and pix[1] < 254 and pix[2] > 2 and pix[2] < 254:
		valid_points.append(point)
	else:
		continue
	z = unmapping(point[0], point[1])
	y.append(X(z))
	coeffs = []
	p = 1
	for _ in xrange(maxLen):
		coeffs.append(p)
		p = p / z
	A.append(coeffs)
seq = (numpy.linalg.pinv(A)) * numpy.matrix([[i] for i in y])

s = numpy.squeeze(numpy.asarray(seq))
s = [int(round(i.real)) for i in s]
s = ''.join([string.printable[i-1] if i>0 else '' for i in s])
print s
print '--------- decrypted! ----------------'

for p in valid_points:
	img.putpixel(p, (0,0,0))
img.show()