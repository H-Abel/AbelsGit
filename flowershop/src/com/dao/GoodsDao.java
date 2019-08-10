package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Goods;

@Repository("goodsDao")
@Mapper
public interface GoodsDao {
public List<Goods> selectGoodsByKey(String key);
public List<Goods> selectGoodsByType(Integer goodstype_id);
public Goods selectGoodsById(Integer id);
public List<Goods> selectAllGoods();
public List<Goods> selectGoodsServer(Integer pageSize,Integer pageIndex);
public int addAGoods(Goods goods);
public int deleteAGoods(Integer id);
public int  updateAGoods(Goods goods);
}
