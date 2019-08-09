package xxmtest5;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ProductController {

	public ProductController() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 查询所有商品
	 * @return
	 */
	public ArrayList<Product> getAllProduct(){
	ArrayList<Product>	proList = new ArrayList<Product>();//把商品存入列表
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		conn=DatabaseConnection.getConnection();//连接数据库
//		System.out.println(conn);
		//数据库的语句，查询
		String sql = "select * from product";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			//把product表的每一行数据用product对象存储
			//分别设置属性
			Product product = new Product();
			product.setId(rs.getInt("product_id"));
			product.setName(rs.getString("product_name"));
			product.setMsg(rs.getString("product_msg"));
			product.setPrice(rs.getDouble("product_price"));
			product.setType(rs.getString("product_type"));
			product.setQuantity(rs.getInt("product_quantity"));
			product.setPicture(rs.getString("product_img"));
			
			// 把一个商品的所有信息加入列表
			proList.add(product);

		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		//释放数据库集对象
		if(rs!=null) {
			try {
				rs.close();
				rs = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
		
		//释放语句对象
		if(stmt!=null) {
			try {
				stmt.close();
				stmt = null;
			} catch (Exception ex) {
				// TODO: handle exception
				ex.printStackTrace();
				
			}
		}
	}
	
	
	
	return proList;
	}
	
	/**
	 * 查询关键年字商品
	 * @param text
	 * @return
	 */
	public ArrayList<Product> getProduct(String text){
	ArrayList<Product>	proList = new ArrayList<Product>();//把商品存入列表
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		conn=DatabaseConnection.getConnection();//连接数据库
//		System.out.println(conn);
		//数据库的语句，查询
		
		String sql = "select * from product where product_name like \'%"+text+"%\'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			//把product表的每一行数据用product对象存储
			//分别设置属性
			Product product = new Product();
			product.setId(rs.getInt("product_id"));
			product.setName(rs.getString("product_name"));
			product.setMsg(rs.getString("product_msg"));
			product.setPrice(rs.getDouble("product_price"));
			product.setType(rs.getString("product_type"));
			product.setQuantity(rs.getInt("product_quantity"));
			product.setPicture(rs.getString("product_img"));
			
			// 把一个商品的所有信息加入列表
			proList.add(product);

		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		//释放数据库集对象
		if(rs!=null) {
			try {
				rs.close();
				rs = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
		
		//释放语句对象
		if(stmt!=null) {
			try {
				stmt.close();
//				stmt = null;
			} catch (Exception ex) {
				// TODO: handle exception
				ex.printStackTrace();
			}
		}
	}	
	return proList;
	}
	
	/**
	 * 按类别查询
	 * @param type
	 * @return
	 */
	public ArrayList<Product> getTypeProduct(String type){
		ArrayList<Product>	proList = new ArrayList<Product>();//把商品存入列表
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn=DatabaseConnection.getConnection();//连接数据库
//			System.out.println(conn);
			//数据库的语句，查询
			
			String sql = "select * from product where product_type=\'"+type+"\'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				//把product表的每一行数据用product对象存储
				//分别设置属性
				Product product = new Product();
				product.setId(rs.getInt("product_id"));
				product.setName(rs.getString("product_name"));
				product.setMsg(rs.getString("product_msg"));
				product.setPrice(rs.getDouble("product_price"));
				product.setType(rs.getString("product_type"));
				product.setQuantity(rs.getInt("product_quantity"));
				product.setPicture(rs.getString("product_img"));
				
				// 把一个商品的所有信息加入列表
				proList.add(product);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//释放数据库集对象
			if(rs!=null) {
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}			
			}
			
			//释放语句对象
			if(stmt!=null) {
				try {
					stmt.close();
//					stmt = null;
				} catch (Exception ex) {
					// TODO: handle exception
					ex.printStackTrace();
				}
			}
		}	
		return proList;
		}
	
	/**
	 * 按id查询
	 * @param id
	 * @return
	 */
	public Product getIdProduct(int id){
		Product product = new Product();//把商品存入列表
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn=DatabaseConnection.getConnection();//连接数据库
//			System.out.println(conn);
			//数据库的语句，查询
			
			String sql = "select * from product where product_id="+id;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				//分别设置属性
				
				product.setId(rs.getInt("product_id"));
				product.setName(rs.getString("product_name"));
				product.setMsg(rs.getString("product_msg"));
				product.setPrice(rs.getDouble("product_price"));
				product.setType(rs.getString("product_type"));
				product.setQuantity(rs.getInt("product_quantity"));
				product.setPicture(rs.getString("product_img"));
		

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//释放数据库集对象
			if(rs!=null) {
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}			
			}
			
			//释放语句对象
			if(stmt!=null) {
				try {
					stmt.close();

				} catch (Exception ex) {
					// TODO: handle exception
					ex.printStackTrace();
				}
			}
		}	
		return product;
		}
}
