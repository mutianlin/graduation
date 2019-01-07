package priv.mutianlin.graduation.dao;

public interface UserDao {
	/**
	 * 员工登录 <br>
	 * 将用户名及密码转换成<b>md5</b>后查询数据库 <b>user</b> 表 <b>privilege</b> 字段为<b> 1
	 * </b>的是否有用户名及密码为name/pwd的记录
	 * 
	 * @param name
	 *            //用户名
	 * @param pwd
	 *            //密码
	 * @return 成功 return <b>1</b>，失败 return <b>0</b>
	 */
	public int staffLogin(String name, String pwd);

	/**
	 * 店长登录<br>
	 * 将用户名及密码转换成<b>md5</b>后查询数据库 <b>user</b> 表 <b>privilege</b> 字段为<b> 0
	 * </b>的是否有用户名及密码为name/pwd的记录
	 * 
	 * @param name
	 *            //用户名
	 * @param pwd
	 *            //密码
	 * @return 成功 return <b>1</b>，失败 return <b>0</b>
	 */
	public int managerLogin(String name, String pwd);

	/**
	 * 店长交接<br>
	 * 进行店长权限交接，修改数据库中 <b>user</b> 表 <b>privilege</b> 字段为<b>
	 * 0</b>的<b>Incumbent</b>字段的值
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
