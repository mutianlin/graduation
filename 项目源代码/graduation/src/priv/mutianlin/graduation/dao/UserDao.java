package priv.mutianlin.graduation.dao;

public interface UserDao {
	/**
	 * Ա����¼ <br>
	 * ���û���������ת����<b>md5</b>���ѯ���ݿ� <b>user</b> �� <b>privilege</b> �ֶ�Ϊ<b> 1
	 * </b>���Ƿ����û���������Ϊname/pwd�ļ�¼
	 * 
	 * @param name
	 *            //�û���
	 * @param pwd
	 *            //����
	 * @return �ɹ� return <b>1</b>��ʧ�� return <b>0</b>
	 */
	public int staffLogin(String name, String pwd);

	/**
	 * �곤��¼<br>
	 * ���û���������ת����<b>md5</b>���ѯ���ݿ� <b>user</b> �� <b>privilege</b> �ֶ�Ϊ<b> 0
	 * </b>���Ƿ����û���������Ϊname/pwd�ļ�¼
	 * 
	 * @param name
	 *            //�û���
	 * @param pwd
	 *            //����
	 * @return �ɹ� return <b>1</b>��ʧ�� return <b>0</b>
	 */
	public int managerLogin(String name, String pwd);

	/**
	 * �곤����<br>
	 * ���е곤Ȩ�޽��ӣ��޸����ݿ��� <b>user</b> �� <b>privilege</b> �ֶ�Ϊ<b>
	 * 0</b>��<b>Incumbent</b>�ֶε�ֵ
	 * 
	 * @param oldNmae
	 * @param oldPwd
	 * @param newName
	 * @param newPwd
	 * @return
	 */
	public int managerHandover(String oldNmae, String oldPwd, String newName,
			String newPwd);
}
