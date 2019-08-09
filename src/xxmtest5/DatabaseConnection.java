package xxmtest5;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DatabaseConnection {
	//驱动
	private	static String driver = "com.mysql.cj.jdbc.Driver";
	//database名，选择我要用的数据库shiyan5
	private	static String url = "jdbc:mysql://localhost:3306/shiyan5?serverTimezone=UTC";
	//验证用户名和密码
	private	static String	username = "root";
	private	static String  passwd= "123456";
	//数据库的连接对象
	private static Connection conn = null;
	//Statement对象
	private static Statement statement = null;
	
	/**
	 * 连接数据库
	 * @return
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,username,passwd);//连接数据库
		} catch (ClassNotFoundException e) {
			System.err.println("无法连接数据库！");
		}//加载驱动
		return conn;		
	}
	
	public DatabaseConnection() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 更新
	 * @param s
	 * @return
	 */
	public int update(String s) {
		int result = 0;
		try {
			statement = conn.createStatement();//实例化statement
			result = statement.executeUpdate(s);//更新语句
			
		} catch (Exception e) {
			System.out.println("执行更新错误！");
		}
		return result;
	}

	/**
	 * 查询
	 * @param s
	 * @return
	 */
	public static ResultSet query(String s)
	{
		ResultSet rs=null;
		try{rs=statement.executeQuery(s);}//执行查询语句
		catch(Exception e){System.out.println("执行查询错误！");}
		return rs;
	}
	
	/**
	 * 关闭与数据库的连接
	 */
	public void close()
	{
		try{
			statement.close();
			conn.close();
		}
		catch(Exception e){}
	}

	public static void main(String[] args) {
		try {
			Connection conn=DatabaseConnection.getConnection();
			if(conn!=null)
			{
				System.out.println("连接数据库正常");
			}
			else {
				System.out.println("连接数据库异常");
			}
			//CartController cc = new CartController();
//			cc.add(6);
//			CartController p = new CartController();
//			p.add("6");
////			p.update("3", "4");
//			ArrayList<Cart> list = p.getAllCart();
//			if (list != null && list.size() > 0) {
//				for (int i = 0; i < list.size(); i++) {
//					Cart pro = list.get(i);
//					int id = pro.getCart_id();
////					String name = pro.getName();
////					double price = pro.getPrice();
////					String type = pro.getType();
////					String msg = pro.getMsg();
////					int quantity = pro.getQuantity();
//					int proid	=pro.getProduct_id();
//					int num = pro.getCart_pquantity();
//			System.out.printf("%d,%d,%d\n",id,proid,num);
//				}
//			}
//			
			
		} catch (Exception ex) {
			// TODO: handle exception
			ex.printStackTrace();
		}
	}

}
