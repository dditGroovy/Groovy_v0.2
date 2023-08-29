package kr.co.groovy.employee;

import kr.co.groovy.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.List;

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
    public String initPassword(@RequestParam("emplId") String id,
                               @RequestParam("emplPassword") String pw) {
        service.initPassword(id, pw);
        return "main/home";
    }

    @ResponseBody
    @GetMapping("/countEmp")
    public String countEmp() {
        int result = service.countEmp();
        log.info("countEmp " + result);
        return Integer.toString(service.countEmp());
    }

    @PostMapping("/inputEmp")
    public String inputEmp(EmployeeVO vo) {
        service.inputEmp(vo);
        return "redirect:/employee/manageEmp";
    }

    @ResponseBody
    @GetMapping("/loadEmp")
    public List<EmployeeVO> loadEmpList() {
        log.info(service.loadEmpList().toString());
        return service.loadEmpList();
    }

    @ResponseBody
    @GetMapping("/findEmp")
    public List<EmployeeVO> findEmp( @Param("depCode") String depCode, @Param("emplNm")String emplNm, @Param("sortBy")String sortBy) {
        return service.findEmp(depCode, emplNm, sortBy);
    }
}
