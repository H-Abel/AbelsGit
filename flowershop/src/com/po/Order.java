package com.po;

import java.util.Date;

public class Order {
private int id;
private int usertable_id;
private double amount;//¶©µ¥×Ü½ğ¶î
private String status;
private Date orderdate;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getUsertable_id() {
	return usertable_id;
}
public void setUsertable_id(int usertable_id) {
	this.usertable_id = usertable_id;
}
public double getAmount() {
	return amount;
}
public void setAmount(double amount) {
	this.amount = amount;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public Date getOrderdate() {
	return orderdate;
}
public void setOrderdate(Date orderdate) {
	this.orderdate = orderdate;
}

}
