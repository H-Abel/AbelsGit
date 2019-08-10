package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.User;

@Repository("userDao")
@Mapper
public interface UserDao {
public User selectUserById(int id);
public List<User> selectAllUser();
public User selectUserByName(String name);
public int register(User user);
public int updatePassword(Map<String,Object> map);
public int deleteAUser(int id);
public int updateAUser(User user);
public int addUser(User user);
}
