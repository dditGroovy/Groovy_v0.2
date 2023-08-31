package kr.co.groovy.employee;

import kr.co.groovy.vo.EmployeeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface EmployeeMapper {
    EmployeeVO signIn(String emplId);

    void initPassword(Map<String, Object> paramMap);

    int countEmp();

    int inputEmp(EmployeeVO vo);

    List<EmployeeVO> loadEmpList();

    List<EmployeeVO> findEmp( String depCode, String emplNm,  String sortBy);

    EmployeeVO findById(String id);

    List<EmployeeVO> loadBirthday();

    EmployeeVO loadEmp(String emplId);

    void modifyProfile(Map<String, String> paramMap);


}

