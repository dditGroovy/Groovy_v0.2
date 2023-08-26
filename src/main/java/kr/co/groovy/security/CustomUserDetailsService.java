package kr.co.groovy.security;

import kr.co.groovy.employee.EmployeeMapper;
import kr.co.groovy.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class CustomUserDetailsService implements UserDetailsService {
    private final EmployeeMapper mapper;

    public CustomUserDetailsService(EmployeeMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        EmployeeVO employeeVO = this.mapper.signIn(id);
        log.info("employeeVO : " + employeeVO);
        return employeeVO == null ? null : new CustomUser(employeeVO);
    }
}
