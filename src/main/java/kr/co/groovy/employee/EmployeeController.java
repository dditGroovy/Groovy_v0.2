package kr.co.groovy.employee;

import kr.co.groovy.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@RequestMapping("/employee")
@Controller
public class EmployeeController {
    final
    EmployeeService service;
    final
    BCryptPasswordEncoder encoder;

    public EmployeeController(EmployeeService service, BCryptPasswordEncoder encoder) {
        this.service = service;
        this.encoder = encoder;
    }

    @GetMapping("/signIn")
    public String singInForm() {
        return "signIn";
    }

    @GetMapping("/manageEmp")
    public String manageEmp() {
        return "admin/manageEmployee";
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
        // 패스워드 암호화
        vo.setEmplPassword(encoder.encode(vo.getEmplPassword()));
        service.inputEmp(vo);
        return "redirect:/employee/manageEmp";
    }

    @ResponseBody
    @GetMapping("/loadEmpList")
    public List<EmployeeVO> loadEmpList() {
        log.info(service.loadEmpList().toString());
        return service.loadEmpList();
    }

    @ResponseBody
    @GetMapping("/findEmp")
    public List<EmployeeVO> findEmp( @Param("depCode") String depCode, @Param("emplNm")String emplNm, @Param("sortBy")String sortBy) {
        return service.findEmp(depCode, emplNm, sortBy);
    }

    @ResponseBody
    @GetMapping("/loadBirthday")
    public List<EmployeeVO> loadBirthday() {
        return service.loadBirthday();
    }
    @GetMapping("/loadEmp/{emplId}")
    public ModelAndView loadEmp(ModelAndView mav, @PathVariable String emplId){
        EmployeeVO vo = service.loadEmp(emplId);
        mav.addObject("empVO", vo);
        mav.setViewName("admin/employeeDetail");
        return mav;
    }
    @GetMapping("/myVacation")
    public String myVacation() {
        return "employee/myVacation";
    }

    @GetMapping("/vacationRecord")
    public String vacationRecord() {
        return "employee/vacationRecord";
    }

    @GetMapping("/mySalary")
    public String mySalary() {
        return "employee/mySalary";
    }
}
