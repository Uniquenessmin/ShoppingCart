package xxmtest5;

public class Cart {
	private int cart_id;
	private int product_id;
	private String product_name;
	private double product_price;
	private int cart_pquantity;
	private double totalPrice;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public double getProduct_price() {
		return product_price;
	}
	public void setProduct_price(double product_price) {
		this.product_price = product_price;
	}
	public int getCart_pquantity() {
		return cart_pquantity;
	}
	public void setCart_pquantity(int cart_pquantity) {
		this.cart_pquantity = cart_pquantity;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = this.product_price*this.cart_pquantity;
	}

}
