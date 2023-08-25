package kr.co.groovy.signin;

import kr.co.groovy.employee.EmployeeVO;
import org.springframework.stereotype.Service;

@Service
public class SignInService {
    private final SignInMapper mapper;

    public SignInService(SignInMapper mapper) {
        this.mapper = mapper;
    }

    public EmployeeVO selectEmployee(String id) {
        return mapper.selectEmployee(id);
    }
}
