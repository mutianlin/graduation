package priv.mutianlin.graduation.test;

import priv.mutianlin.graduation.util.MD5;

public class TestMD5 {

	public static void main(String[] args) {
		String a,b,c,d;
		System.out.println(a=MD5.getMD5("admin"));
		System.out.println(b=MD5.getMD5("MD5的典型应用是对一段Message(字节串)产生fingerprint(指纹），以防止被“篡改”。举个例子，你将一段话写在一个叫 readme.txt文件中，并对这个readme.txt产生一个MD5的值并记录在案，然后你可以传播这个文件给别人，别人如果修改了文件中的任何内容，你对这个文件重新计算MD5时就会发现（两个MD5值不相同）。如果再有一个第三方的认证机构，用MD5还可以防止文件作者的“抵赖”，这就是所谓的数字签名应用。"));
		System.out.println(c=MD5.getMD5("admin"));
		System.out.println(d=MD5.getMD5("MD5的典型应用是对一段Message(字节串)产生fingerprint(指纹），以防止被“篡改”。举个例子，你将一段话写在一个叫 readme.txt文件中，并对这个readme.txt产生一个MD5的值并记录在案，然后你可以传播这个文件给别人，别人如果修改了文件中的任何内容，你对这个文件重新计算MD5时就会发现（两个MD5值不相同）。如果再有一个第三方的认证机构，用MD5还可以防止文件作者的“抵赖”，这就是所谓的数字签名应用。"));
		System.out.println(a.equals(c));
		System.out.println(b.equals(d));
		System.out.println(a.length());
	}

}
