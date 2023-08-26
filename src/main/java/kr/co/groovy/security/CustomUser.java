package kr.co.groovy.security;

import kr.co.groovy.vo.EmployeeVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
import java.util.stream.Collectors;
public class CustomUser extends User{
	private EmployeeVO employeeVO;
	
	public CustomUser(String username, String password
			, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(EmployeeVO employeeVO) {
		super(employeeVO.getEmpId()+"", employeeVO.getEmpPw(),
				employeeVO.getEmployeeAuthVOList().stream()
			.map(auth->new SimpleGrantedAuthority(auth.getAuthCode()))
			.collect(Collectors.toList())
				);
	}

	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}

	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}
}




