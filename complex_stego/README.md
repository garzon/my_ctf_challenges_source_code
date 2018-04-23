警方正在利用某黑客使用过的设备，来追查其行踪，并发现了下面附件中的文件。该黑客利用encrypt.py将其密钥转换成encrypted.png保存，警方利用encrypt.py发现字符串“DiDI{”能被转换成下图（DiDI{.png）的美丽图样。你能帮助警方恢复出该黑客的密钥么？

--------- 注：
最终发布时，附件只含有DiDI{.png，encrypt.py，encrypted.png三个文件
思路（decrypt.py）：
根据函数名z_encrypt、题目名complex、搜索引擎或者数学功底，了解到这是一个z变换，encrypted.png为其函数图象，参照https://en.wikipedia.org/wiki/Z-transform#Inverse_Z-transform 中的路径积分公式https://wikimedia.org/api/rest_v1/media/math/render/svg/957cad6f61b3feec604ba454617acaea7beae9be 计算即可。