package ch14;

import java.util.Hashtable;

public class CartMgr {
	
	private Hashtable hCart = new Hashtable();
	
	public CartMgr() { }
	
	public void addCart(OrderBean ob) {
		int pno = ob.getP_no();
		int qtity = ob.getO_quantity();
		if(qtity > 0) {
			if(hCart.containsKey(pno)) {
				OrderBean temp = (OrderBean)hCart.get(pno);
				qtity += temp.getO_quantity();
				temp.setO_quantity(qtity);
				hCart.put(pno, temp);
			}else{
				hCart.put(pno, ob);
			}//hCart
		}//if qtity
	}//addCart end
	
	public Hashtable getCartList() {
		return hCart;
	}//getCartList
	
	public void updateCart(OrderBean ob) {
		int pno = ob.getP_no();
		hCart.put(pno, ob);
	}
	
	public void deleteCart(OrderBean ob) {
		int pno = ob.getP_no();
		hCart.remove(pno);
	}
}
