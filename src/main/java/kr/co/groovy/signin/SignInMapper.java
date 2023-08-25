package kr.co.groovy.signin;

import kr.co.groovy.employee.EmployeeVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SignInMapper {

    EmployeeVO selectEmployee(String id);

}
