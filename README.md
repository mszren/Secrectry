# Secret
加密解密（BASE64，DES，AES，RSA)  
       ios传统的加密有很多种，如MD5,Base64,AES,DES等等，但是严格意义上来说，Base64和MD5都是缺少加密方式的加密，Base64只是对数据进行了格式的转化，MD5的加密又是不可逆的。所以，在项目中真正一般用来加密数据的方式是有加密方式的加密，也就是有秘钥的加密。
    有加密的方式又可以分为两种：对称加密和非对称加）。这些加密后的数据都是可逆的，能够根据秘钥重新解密。
    对称加密：主要涉及到如AES,3DES等加密。此种加密的秘钥在加密和解密的时候都是相同的。
    非对称加密：主要涉及到如RSA加密（或加签)，此种加密的秘钥是不同的，分为公钥和私钥，在RSA加密时，一般是把公钥放在客户端来加密，私钥上传
用来解密（RSA加签则不同）。

项目中的应用
   在项目的应用中，大多采取对称加密的方式（简单易操作）来加密，如将数据AES加密并Base64转码后上传到服务器，当然了，服务器也可以对数据
加密后通过API调用传给客户端，具体实现方法要根据业务来选择。
    如果觉得还是不够稳妥，可以对称加密和非对称加密混合起来一起使用。也就是对对称加密的秘钥再来一次非对称加密（如RSA），这样可以是你的数据
在后台与客户端传递起来更加的安全可靠！当然了，操作起来也会麻烦一些。

附录：
     应用于iOS的RSA秘钥证书生成起来比较麻烦一点，我们在进行RSA加密时需要获取到公钥的.der证书和私钥的.p12证书，通过openssl通过命令即可完成操作，终端里已经装有openssl，所以直接通过终端即可操作。下面的链接是证书生成指南，不明白的朋友可以看看。
     生成证书网址:http://www.jianshu.com/p/a1bad1e2be55

