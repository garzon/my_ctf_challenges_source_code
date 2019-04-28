# [DDCTF2019 MISC] 声纹锁 voice_lock

## Problem description

Please find the `[CHALLENGE_ATTACHMENT]_fingerprint.png` and `[CHALLENGE_CODE]_voice_lock.py`. The format of the flag is `DDCTF{XXXXX_XXXXXXX_XXXX}` where `X` represents a letter in UPPERCASE.

#### Original description in Chinese

Didi办公室新安装了伪·声纹锁，现在你拿到了锁的源代码，你能破解出开门所需要的声音钥匙么？

Flag格式为：`DDCTF{XXXXX_XXXXXXX_XXXX}`，其中X均为大写字母，本题设有提交次数限制100次


## Solution

Please find the python script `[FINAL_SOLUTION]_recover_voice.py`.

`[RECOVERED_WAV]_recovered_better.wav` is the recovered audio from `[CHALLENGE_ATTACHMENT]_fingerprint.png` by using the python script.


### Math Reference

#### STFT
https://en.wikipedia.org/wiki/Short-time_Fourier_transform

#### 方形窗函数的短时距傅里叶变换
https://zh.wikipedia.org/wiki/%E7%9F%AD%E6%99%82%E8%B7%9D%E5%82%85%E7%AB%8B%E8%91%89%E8%AE%8A%E6%8F%9B#%E6%96%B9%E5%BD%A2%E7%AA%97%E5%87%BD%E6%95%B8%E7%9A%84%E7%9F%AD%E6%99%82%E8%B7%9D%E5%82%85%E7%AB%8B%E8%91%89%E8%BD%89%E6%8F%9B

