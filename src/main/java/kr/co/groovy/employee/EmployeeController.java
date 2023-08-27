package kr.co.groovy.employee;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RequestMapping("/employee")
@Controller
public class EmployeeController {
    final
    EmployeeService service;

    public EmployeeController(EmployeeService service) {
        this.service = service;
    }

    @GetMapping("/signIn")
    public String singInForm() {
        return "signIn";
    }
    @GetMapping("/manageEmp")
    public String manageEmp() {
        return "admin/manageEmp";
    }

    @GetMapping("/initPassword")
    public String initPasswordForm() {
        return "initPassword";
    }

    @PostMapping("/initPassword")
    public String initPassword(@RequestParam("empId") String id,
                           @RequestParam("empPw") String pw) {
        service.initPassword(id, pw);
        return "main/home";
    }
    @ResponseBody
    @GetMapping("/countEmp")
    public String countEmp(){
        log.info("countEmp");
        int result = service.countEmp();
        log.info(result + "");
        return Integer.toString(service.countEmp());
    }

}
