package com.xjm.dao;

import com.xjm.domain.Course;
import com.xjm.domain.Student;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentMapper {

    //根据id查学生
    @Select("select * from student where id=#{id}")
    public Course findById(Integer id);

    //查学生选的课程
    @Select("select * from student")
    @Results(id = "scMap",value = {
            //id表示主键
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "name",property = "name"),
            @Result(column = "sex",property = "sex"),
            @Result(column = "college",property = "college"),
            @Result(column = "classes",property = "classes"),
            @Result(property = "courses",column = "id",many = @Many(select = "com.xjm.dao.CourseMapper.findBySid",
                    fetchType = FetchType.LAZY))
    })
    public List<Student> findCourse();

    //通过Cid查课程的学生
    @Select("select * from student where id in(select sid from selectedcourse where cid = #{cid})")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "name",property = "name"),
            @Result(column = "sex",property = "sex"),
            @Result(column = "college",property = "college"),
            @Result(column = "classes",property = "classes"),
    })
    List<Student> findByCid(Integer cid);
}
