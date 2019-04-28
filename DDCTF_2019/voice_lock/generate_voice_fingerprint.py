#%matplotlib notebook
import cmath
import librosa
import numpy as np
import sys, os
from PIL import Image

from voice_lock import *

def draw_fingerprint(x):
	r = linear_map(np.real(x), -max_lim, max_lim, 0, 255)
	i = linear_map(np.imag(x), -max_lim, max_lim, 0, 255)
	r = np.clip(np.round(r), 0, 255).astype(np.uint8)
	i = np.clip(np.round(i), 0, 255).astype(np.uint8)
	img_arr = np.zeros((*r.shape, 3), dtype=np.uint8)
	img_arr[:, :, 1] = r
	img_arr[:, :, 2] = i
	return img_arr

for flag_name in ['03_DDCTF_VOICE_ENCODED_FREQ']:#, '04_DDCTF_VOICE_ENCODED_TEST', '05_DDCTF_VOICE_ENCODED_CHAL']:#, '01_DDCTF_VOICEENCODED'):
	data, sr = librosa.load(flag_name+'.mp3', sr=sr)
	freqs, C = transform_x(data)
	img_arr = draw_fingerprint(C)
	img = Image.fromarray(img_arr, 'RGB')
	os.mkdir(flag_name)
	img.save(flag_name+'/fingerprint.png')
	img.save('fingerprint.png')
	
	print("executing scripts to check the correctness for {}...".format(flag_name))
	os.system("python3 recover_voice.py")
	os.system("copy recovered.wav {}\\recovered.wav".format(flag_name))
	os.system("python3 voice_lock.py recovered.wav")