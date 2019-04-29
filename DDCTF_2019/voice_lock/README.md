# [DDCTF2019 MISC] 声纹锁 voice_lock

## Problem description

Please find the `[CHALLENGE_ATTACHMENT]_fingerprint.png` and `[CHALLENGE_CODE]_voice_lock.py`. The format of the flag is `DDCTF{XXXXX_XXXXXXX_XXXX}` where `X` represents a letter in UPPERCASE.

#### Original description in Chinese

Didi办公室新安装了伪·声纹锁，现在你拿到了锁的源代码，你能破解出开门所需要的声音钥匙么？

Flag格式为：`DDCTF{XXXXX_XXXXXXX_XXXX}`，其中X均为大写字母，本题设有提交次数限制100次


## Solution

Please find the python script `[FINAL_SOLUTION]_recover_voice.py`.

`[RECOVERED_WAV]_recovered_better.wav` is the recovered audio from `[CHALLENGE_ATTACHMENT]_fingerprint.png` by using the python script.

其实这题是一个相当简单的题目，可以用一句话说明：给定傅里叶级数的系数计算原函数并采样成音频。原题给出的fingerprint实际上是音频的频谱图（Spectrogram）又称声指纹（Voiceprint）。影响音频质量的主要是采样频率低（香农采样定理），实测生成fingerprint时只要把音频sample rate(源码的sr)=30000时就可以得到较为清晰的原音频。除此以外，通过一些算法也可以弥补音频质量低的问题，比如说考虑到这是人声，可加入低通滤波器（比如<500Hz）来增强低频部分抗混叠，得到的音频也是能够听清所读的字母的。脚本中限制了只计算频率范围在100~800Hz之间，因此能够得到较为清晰的人声。

### Math Reference

#### STFT
https://en.wikipedia.org/wiki/Short-time_Fourier_transform

#### 方形窗函数的短时距傅里叶变换
https://zh.wikipedia.org/wiki/%E7%9F%AD%E6%99%82%E8%B7%9D%E5%82%85%E7%AB%8B%E8%91%89%E8%AE%8A%E6%8F%9B#%E6%96%B9%E5%BD%A2%E7%AA%97%E5%87%BD%E6%95%B8%E7%9A%84%E7%9F%AD%E6%99%82%E8%B7%9D%E5%82%85%E7%AB%8B%E8%91%89%E8%BD%89%E6%8F%9B

