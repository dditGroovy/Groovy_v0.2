package kr.co.groovy.employee;

import kr.co.groovy.vo.EmployeeVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {
    final
    EmployeeMapper mapper;

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
}
