package kr.co.groovy.employee;

import kr.co.groovy.vo.EmployeeVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Mapper
public interface EmployeeMapper {
    EmployeeVO signIn(String empId);

    void initPassword(@Param("empId") String id, @Param("empPw") String pw);

    int countEmp();

    int inputEmp(EmployeeVO vo);

    List<EmployeeVO> loadEmpList();
    List<EmployeeVO> findEmp(@Param("empName")String empName, @Param("depCode") String depCode, @Param("sortBy")String sortBy);


}

