package xxmtest5;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CartController {
	ResultSet rs = null;
	Connection conn ;
	PreparedStatement stmt = null;
	ArrayList<Integer> list = new ArrayList<Integer>();
	
	public CartController() {
		try {
			conn= DatabaseConnection.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 获取购物车商品的id
		public ArrayList<Integer> getCartId(int uid) {
 
			try {
				conn = DatabaseConnection.getConnection();
				String sql = "select product_id from carts where uid="+uid;// SQL语句
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				while (rs.next()) {
					list.add(rs.getInt(1));// 把一个商品的i加入列表
				}
				return list;
			} catch (Exception ex) {
				ex.printStackTrace();
				return null;
			} finally {
				// 释放数据集对象
				if (rs != null) {
					try {
						rs.close();
						rs = null;
					} catch (Exception ex) {
						// TODO: handle exception
						ex.printStackTrace();
					}
				}
				// 释放语句对象
				if (stmt != null) {
					try {
						stmt.close();
						stmt = null;
					} catch (Exception ex) {
						// TODO: handle exception
						ex.printStackTrace();
					}
				}
			}
	 
		}

		
		/**
		 * 添加到购物车
		 * @param pid
		 * @return
		 */
		public ArrayList<Integer> add(String proid,String userid) {

			int pid = Integer.parseInt(proid);
			int uid=Integer.parseInt(userid);
			String sql =null;			
			int num=1;
			//库存
			int pnum=new ProductController().getIdProduct(pid).getQuantity();
			//System.out.println(pnum);
			try {
				//将所选商品加入购物车表中
				if(pnum>1) {
				
					list = this.getCartId(uid);//链表存的是购物车商品的id					
					
					if (list.contains(pid)) {//如果链表里有，那说明该商品已经存在于购物车，在数量上加1即可
						//得先从购物车把该商品id的相关的数量和价格查询出来
						
						sql = "select cart_pquantity from carts where product_id="+pid+" and uid="+uid;
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery(sql);
					
						while(rs.next()){							
							num = rs.getInt(1);
						}
						 if(num<pnum) {
						num = num + 1;//再此基础上加1
						sql = "update carts set cart_pquantity = ? where product_id=? and uid=?";
						stmt = conn.prepareStatement(sql);
						stmt.setInt(1, num);	
						stmt.setInt(2, pid);
						stmt.setInt(3, uid);
						stmt.executeUpdate();
						 }
						
						
					} else {//没有购物车匹配不到该商品则直接插入
						
						String name=null;
						double price=0;
						
						
						//获得商品的信息
						ProductController p = new ProductController();
						Product product = p.getIdProduct(pid);
						name = product.getName();
						price = product.getPrice();
						
						//插入数据
						sql = "insert into carts(product_id,product_name,product_price,cart_pquantity,uid) values(?,?,?,?,?)";
						stmt = conn.prepareStatement(sql);
						
						stmt.setInt(1, pid);
						stmt.setString(2, name);	
						stmt.setDouble(3, price);
						stmt.setInt(4, 1);
						stmt.setInt(5, uid);
						stmt.executeUpdate();
						
					}
				}else {
					
				}
						 
			} catch (Exception ex) {
				ex.printStackTrace();
			}finally {
				try {
					//关闭数据库连接
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			return this.getCartId(uid);

		}
		
		/**
		 * 减少数量
		 * @param pid
		 * @return
		 */
		public ArrayList<Integer> less(String proid,String userid) {
//			System.out.println(pid);
			int pid = Integer.parseInt(proid);
			int uid = Integer.parseInt(userid);

			String sql =null;			
			int num=1;
			try {
				
						sql = "select cart_pquantity from carts where product_id="+pid+" and uid="+uid;
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery(sql);
						while(rs.next()){							
							num = rs.getInt(1);
						}
						
						//数量最小为1
						if(num>1) {
							
							num = num - 1;//再此基础上-1
							sql = "update carts set cart_pquantity = ? where product_id=? and uid=?";
							stmt = conn.prepareStatement(sql);
							stmt.setInt(1, num);		
							stmt.setInt(2, pid);
							stmt.setInt(3, uid);
							stmt.executeUpdate();
						}else {
							
						}
				
						 
			} catch (Exception ex) {
				ex.printStackTrace();
			}finally {
				try {
					//关闭数据库连接
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			return this.getCartId(uid);

		}

		/**
		 * 清空购物车
		 * @param userid
		 * @throws SQLException
		 */
		public void clear(String userid) throws SQLException {
		
			String sql = "delete from carts where uid="+userid;
				stmt = conn.prepareStatement(sql);
				stmt.executeUpdate();
		
		}
		

		/**
		 * 删除某个商品
		 * @param pid
		 * @throws SQLException
		 */
		public void delete(String pid,String userid) throws SQLException {
			String sql;
			
			//在购物车中删除商品
				sql = "delete from carts where product_id=? and uid=?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, Integer.parseInt(pid));
				stmt.setInt(2, Integer.parseInt(userid));
				stmt.executeUpdate();
	
		}

		/**
		 * 购物车所有商品
		 * @return
		 */
		public ArrayList<Cart> getAllCart(String userid){
			int uid = Integer.parseInt(userid);
			ArrayList<Cart>	shopList = new ArrayList<Cart>();//把商品存入列表
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			try {
				conn=DatabaseConnection.getConnection();//连接数据库
				//数据库的语句，查询
				String sql = "select * from carts where uid="+uid;
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					//把product表的每一行数据用product对象存储
					//分别设置属性
					Cart cart = new Cart();
					cart.setCart_id(rs.getInt("cart_id"));
					cart.setProduct_id(rs.getInt("product_id"));
					cart.setProduct_name(rs.getString("product_name"));
					cart.setProduct_price(rs.getDouble("product_price"));
					cart.setCart_pquantity(rs.getInt("cart_pquantity"));
					cart.setTotalPrice(rs.getDouble("totalPrice"));
					
					
					// 把一个商品的所有信息加入列表
					shopList.add(cart);

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
						
			return shopList;
			}

}
