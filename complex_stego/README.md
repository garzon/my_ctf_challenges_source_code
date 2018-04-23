警方正在利用某黑客使用过的设备，来追查其行踪，并发现了下面附件中的文件。该黑客利用encrypt.py将其密钥转换成encrypted.png保存，警方利用encrypt.py发现字符串“DiDI{”能被转换成下图（DiDI{.png）的美丽图样。你能帮助警方恢复出该黑客的密钥么？

--------- 注：
最终发布时，附件只含有didi.png, DiDI{.png，encrypt.py，encrypted.png 4个文件    

易思路（solution_decrypt2.py）：    
X(z)实际上这相当于1,z^(-1),z^(-2)...的一个线性组合`常向量(input) * 向量(z)`。给了X(z)，z可以任取的情况下，以`input`的视角来看就是`f(input) = 常向量(z) * 向量(input) = input[0] + 1/z * input[1] + 1/z^2 * input[2] ... = X(z)`，因此在f中，z实际上为参数，实质自变量为input。    

在数学世界中，我们可以选取45个z值z0, z1 .. z44，然后得到45个线性方程组`input[0] + 1/z0 * input[1] + 1/z0^2 * input[2] .. = X(z0)`，`input[0] + 1/z1 * input[1] + 1/z1^2 * input[2] .. = X(z1) ...`    
令`行向量V(z) = [1 1/z 1/z^2 ...]`， 方程组写成矩阵就是 `[V(z0); V(z1); .. ] * 列向量(input) = 列向量([X(z0); X(z1); ...])`， 令`矩阵A=[V(z0); V(z1); .. ]`，`向量x = Vec(input)`，`向量y = [X(z0); X(z1); ...]`，那么就是`Ax=y`，其中A, y已知，那么显然`x=A^(-1) * y` 。    

然而还差一点，这是现实世界，图像中只有256种取值，因此X(z)函数值会有比较大的量化误差，同时还有像素值<0或者>255引起的截断误差。因此，这时z点取值要取合理的点，也就是图像g,b值均>2且<254保证没有截断误差。至于量化误差，可以取最小二乘解来解决。我们取1000个合理点z，得到1000个方程组，也就是1000 * 45的矩阵A，
那么由于量化误差，实际上这时就是`Ax ~= y`，因此我们取A的伪逆pinv(A)，得`x ~= pinv(A) * y`即可。

难思路（solution_decrypt.py）：    
根据函数名z_encrypt、题目名complex、提示（傅里叶变换视频）、搜索引擎或者数学功底，了解到这是一个z变换，encrypted.png为其函数图象，参照https://en.wikipedia.org/wiki/Z-transform#Inverse_Z-transform 中的路径积分公式![reverse formula](https://wikimedia.org/api/rest_v1/media/math/render/svg/957cad6f61b3feec604ba454617acaea7beae9be) 计算即可。在单位圆上面选取1000个点计算数值积分即可。