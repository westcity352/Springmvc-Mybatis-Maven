package com.xjm.dao;


import com.xjm.domain.Course;
import com.xjm.domain.Student;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseMapper {

    @Select("select * from course")
    List<Course> findAll();

    //添加课程
    @Insert("insert into course (id,name,teacher,time,score) values (#{id},#{name},#{teacher},#{time},#{score})")
    public void addCourse(Course course);

    //删除课程
    @Delete("delete from course where id =#{id}")
    public void deleteCourse(Integer id);

    //修改课程
    @Update("update course set name=#{name},teacher=#{teacher},time=#{time},score=#{score} where id =#{id}")
    public void editCourse (Course course);

    //根据id查课程
    @Select("select * from course where id=#{id}")
    public Course findById(Integer id);

    //查课程里的学生
    @Select("select * from course")
    @Results(id = "csMap",value = {
            //id表示主键
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "name",property = "name"),
            @Result(column = "teacher",property = "teacher"),
            @Result(column = "time",property = "time"),
            @Result(column = "score",property = "score"),
            @Result(property = "students",column = "id",many = @Many(select = "com.xjm.dao.StudentMapper.findByCid",
                    fetchType = FetchType.LAZY))
    })
    public List<Course> findStudent();

    //通过Sid查学生选修的课程
    @Select("select * from course where id in(select cid from selectedcourse where sid = #{sid})")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "name",property = "name"),
            @Result(column = "teacher",property = "teacher"),
            @Result(column = "time",property = "time"),
            @Result(column = "score",property = "score"),
    })
    List<Course> findBySid(Integer sid);
}
