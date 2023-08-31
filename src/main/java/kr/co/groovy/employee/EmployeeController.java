package kr.co.groovy.employee;

import kr.co.groovy.enums.ClassOfPosition;
import kr.co.groovy.enums.Department;
import kr.co.groovy.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.Authentication;
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

    public EmployeeController(EmployeeService service) {
        this.service = service;
    }

    @GetMapping("/signIn")
    public String singInForm(Authentication auth) {
        if(auth != null){
            return "main/home";
        }
        return "signIn";
    }

    @GetMapping("/signInFail")
    public ModelAndView signInFail(ModelAndView mav, String exception) {
        mav.addObject("message", exception);
        mav.setViewName("signIn");
        return mav;
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
    public String initPassword(@RequestParam("emplId") String emplId,
                               @RequestParam("emplPassword") String emplPassword) {
        service.initPassword(emplId, emplPassword);
        return "main/home";
    }

    @ResponseBody
    @GetMapping("/countEmp")
    public String countEmp() {
        int result = service.countEmp();
        return Integer.toString(service.countEmp());
    }

    @PostMapping("/inputEmp")
    public String inputEmp(EmployeeVO vo) {
        service.inputEmp(vo);
        return "redirect:/employee/manageEmp";
    }

    @ResponseBody
    @GetMapping("/loadEmpList")
    public List<EmployeeVO> loadEmpList() {
        List<EmployeeVO> list = service.loadEmpList();
        for (EmployeeVO vo : list) {
            vo.setCommonCodeDept(Department.valueOf(vo.getCommonCodeDept()).label());
            vo.setCommonCodeClsf(ClassOfPosition.valueOf(vo.getCommonCodeClsf()).label());
        }
        return list;
    }

    @ResponseBody
    @GetMapping("/findEmp")
    public List<EmployeeVO> findEmp(@Param("depCode") String depCode, @Param("emplNm") String emplNm, @Param("sortBy") String sortBy) {
        List<EmployeeVO> list = service.findEmp(depCode, emplNm, sortBy);
        for (EmployeeVO vo : list) {
            vo.setCommonCodeDept(Department.valueOf(vo.getCommonCodeDept()).label());
            vo.setCommonCodeClsf(ClassOfPosition.valueOf(vo.getCommonCodeClsf()).label());
        }
        return list;

    }

    @ResponseBody
    @GetMapping("/loadBirthday")
    public List<EmployeeVO> loadBirthday() {
        return service.loadBirthday();
    }

    @GetMapping("/loadEmp/{emplId}")
    public ModelAndView loadEmp(ModelAndView mav, @PathVariable String emplId) {
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

    @GetMapping("/myChat")
    public String myChat() {
        return "employee/myChat";
    }

    @GetMapping("/commute")
    public String commute() {
        return "employee/commute";
    }
}
