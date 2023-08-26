package kr.co.groovy.employee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EmployeeController {
    final
    EmployeeService service;

    public EmployeeController(EmployeeService service) {
        this.service = service;
    }

    @GetMapping("/signIn")
    public String singinForm() {
        return "employee/signIn";
    }

    @GetMapping("/initPassword")
    public String initPasswordForm() {
        return "employee/initPassword";
    }

    @PostMapping("/initPassword")
    public String initPassword(@RequestParam("empId") String id,
                           @RequestParam("empPw") String pw) {
        service.initPassword(id, pw);
        service.modifyRole(id);
        return "main/home";
    }

}
