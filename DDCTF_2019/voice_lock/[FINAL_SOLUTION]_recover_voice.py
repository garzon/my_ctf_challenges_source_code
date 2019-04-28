import cmath
import librosa
import numpy as np
import sys
#import matplotlib.pyplot as plt
from PIL import Image

from voice_lock import * # include the python script provided in the challenge, to get the predefined parameters

def recover_x(Xs, freqs, window_size=window_size, step_size=step_size):
	seq = np.zeros(Xs.shape[1]*step_size, dtype=np.complex64)
	for w_ind, f in enumerate(freqs[1:-1]):
		if f < 100 or f > 800: continue
		dw = (freqs[w_ind+1]-freqs[w_ind-1])/2
		for T in xrange(Xs.shape[1]):
			for _ in xrange(step_size):
				t = T*step_size+_
				seq[t] += Xs[w_ind, T] * cmath.exp(2j * cmath.pi * f * t / sr) * dw /2/cmath.pi
	return seq.astype(np.float32) # keep real part only

C = image_to_array(Image.open('fingerprint.png'))
freqs = np.logspace(np.log10(20), np.log10(f_ubound), f_bins)
x = recover_x(C, freqs)
librosa.output.write_wav('recovered_better.wav', x, sr)