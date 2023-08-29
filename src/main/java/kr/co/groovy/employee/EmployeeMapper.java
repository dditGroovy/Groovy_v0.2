package kr.co.groovy.employee;

import kr.co.groovy.vo.EmployeeVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Mapper
public interface EmployeeMapper {
    EmployeeVO signIn(String emplId);

    void initPassword(@RequestParam("emplId") String id,
                      @RequestParam("emplPassword") String pw);

    int countEmp();

    int inputEmp(EmployeeVO vo);

    List<EmployeeVO> loadEmpList();
    List<EmployeeVO> findEmp(@Param("depCode") String depCode, @Param("emplNm")String emplNm, @Param("sortBy")String sortBy);

    EmployeeVO selectById(String id);


}

