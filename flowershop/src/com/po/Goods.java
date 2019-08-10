package com.po;

import org.springframework.web.multipart.MultipartFile;

public class Goods {
private int id;
private String gname;
private double goprice;
private double gnprice;
private int gstore;
private MultipartFile logoImage;//使用multipartFile进行文件上传
private String gpic;
private String gdescribe;
private int goodstype_id;

public MultipartFile getLogoImage() {
	return logoImage;
}
public void setLogoImage(MultipartFile logoImage) {
	this.logoImage = logoImage;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getGname() {
	return gname;
}
public void setGname(String gname) {
	this.gname = gname;
}
public double getGoprice() {
	return goprice;
}
public void setGoprice(double goprice) {
	this.goprice = goprice;
}
public double getGnprice() {
	return gnprice;
}
public void setGnprice(double gnprice) {
	this.gnprice = gnprice;
}
public int getGstore() {
	return gstore;
}
public void setGstore(int gstore) {
	this.gstore = gstore;
}
public String getGpic() {
	return gpic;
}
public void setGpic(String gpic) {
	this.gpic = gpic;
}

public String getGdescribe() {
	return gdescribe;
}
public void setGdescribe(String gdescribe) {
	this.gdescribe = gdescribe;
}
public int getGoodstype_id() {
	return goodstype_id;
}
public void setGoodstype_id(int goodstype_id) {
	this.goodstype_id = goodstype_id;
}

}
