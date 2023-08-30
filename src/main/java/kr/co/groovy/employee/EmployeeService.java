package kr.co.groovy.employee;

import kr.co.groovy.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class EmployeeService {
    final
    EmployeeMapper mapper;

    public EmployeeService(EmployeeMapper mapper) {
        this.mapper = mapper;
    }

    public EmployeeVO signIn(String emplId) {
        return mapper.signIn(emplId);
    }

    public void initPassword(Map<String, Object> paramMap) {
        mapper.initPassword(paramMap);
    }

    public int countEmp() {
        return mapper.countEmp();
    }

    public int inputEmp(EmployeeVO vo) {
        return mapper.inputEmp(vo);
    }

    public List<EmployeeVO> loadEmpList() {
        return mapper.loadEmpList();
    }

    public List<EmployeeVO> findEmp(@Param("depCode") String depCode, @Param("emplNm") String emplNm, @Param("sortBy") String sortBy) {
        return mapper.findEmp(depCode, emplNm, sortBy);
    }

    public List<EmployeeVO> loadBirthday() {
        return mapper.loadBirthday();
    }

    public EmployeeVO loadEmp(String emplId) {
        return mapper.loadEmp(emplId);
    }
    public EmployeeVO findById(String emplId) {
        return mapper.findById(emplId);
    }


}
