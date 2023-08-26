package kr.co.groovy.employee;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
public class EmployeeController {
    final
    EmployeeService service;

    public EmployeeController(EmployeeService service) {
        this.service = service;
    }

    @GetMapping("/signIn")
    public String singInForm() {
        return "employee/signIn";
    }
    @GetMapping("/manageEmp")
    public String manageEmpForm() {
        return "admin/manageEmp";
    }

    @GetMapping("/initPassword")
    public String initPasswordForm() {
        return "employee/initPassword";
    }

    @PostMapping("/initPassword")
    public String initPassword(@RequestParam("empId") String id,
                           @RequestParam("empPw") String pw) {
//        log.info();
//        String password = passwordEncoder.encode(pw);
//        log.info(pw);
//        log.info(password);
        service.initPassword(id, pw);
        service.modifyRole(id);
        return "main/home";
    }

}
