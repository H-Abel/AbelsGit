package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.GoodsType;


@Repository("typeDao")
@Mapper
public interface TypeDao {
public List<GoodsType> selectAllType();
public GoodsType selectTypeById(int id);
public int addAType(GoodsType goodstype);
public int deleteAType(int id);
public int updateAType(GoodsType goodsType);
}
