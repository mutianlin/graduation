package priv.mutianlin.graduation.test;

import priv.mutianlin.graduation.util.MD5;

public class TestMD5 {

	public static void main(String[] args) {
		String a,b,c,d;
		System.out.println(a=MD5.getMD5("admin"));
		System.out.println(b=MD5.getMD5("MD5�ĵ���Ӧ���Ƕ�һ��Message(�ֽڴ�)����fingerprint(ָ�ƣ����Է�ֹ�����۸ġ����ٸ����ӣ��㽫һ�λ�д��һ���� readme.txt�ļ��У��������readme.txt����һ��MD5��ֵ����¼�ڰ���Ȼ������Դ�������ļ������ˣ���������޸����ļ��е��κ����ݣ��������ļ����¼���MD5ʱ�ͻᷢ�֣�����MD5ֵ����ͬ�����������һ������������֤��������MD5�����Է�ֹ�ļ����ߵġ����������������ν������ǩ��Ӧ�á�"));
		System.out.println(c=MD5.getMD5("admin"));
		System.out.println(d=MD5.getMD5("MD5�ĵ���Ӧ���Ƕ�һ��Message(�ֽڴ�)����fingerprint(ָ�ƣ����Է�ֹ�����۸ġ����ٸ����ӣ��㽫һ�λ�д��һ���� readme.txt�ļ��У��������readme.txt����һ��MD5��ֵ����¼�ڰ���Ȼ������Դ�������ļ������ˣ���������޸����ļ��е��κ����ݣ��������ļ����¼���MD5ʱ�ͻᷢ�֣�����MD5ֵ����ͬ�����������һ������������֤��������MD5�����Է�ֹ�ļ����ߵġ����������������ν������ǩ��Ӧ�á�"));
		System.out.println(a.equals(c));
		System.out.println(b.equals(d));
		System.out.println(a.length());
	}

}
