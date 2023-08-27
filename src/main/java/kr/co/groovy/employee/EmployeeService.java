package kr.co.groovy.employee;

import kr.co.groovy.security.CustomNoOpPasswordEncoder;
import kr.co.groovy.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
@Slf4j
@Service
public class EmployeeService {
    final
    EmployeeMapper mapper;
    CustomNoOpPasswordEncoder encoder;

    public EmployeeService(EmployeeMapper mapper) {
        this.mapper = mapper;
    }

    public EmployeeVO signIn(String empId) {
        return mapper.signIn(empId);
    }

    public void initPassword(@Param("empId") String id, @Param("empPw") String pw) {
        mapper.initPassword(id, pw);
    }

    public int countEmp() {
        return mapper.countEmp();
    }

    public int inputEmp(EmployeeVO vo) {
        log.info("inputEmp" + vo);
//        log.info(encoder.encode(vo.getEmpPw()));
//        vo.setEmpPw(encoder.encode(vo.getEmpPw()));
        return mapper.inputEmp(vo);
    }
}
