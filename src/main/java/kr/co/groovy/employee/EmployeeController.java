package kr.co.groovy.employee;

import kr.co.groovy.vo.EmployeeVO;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping({"/employee"})
@Controller
public class EmployeeController {
    private static final Logger log = LoggerFactory.getLogger(EmployeeController.class);
    final EmployeeService service;

    public EmployeeController(EmployeeService service) {
        this.service = service;
    }

    @GetMapping({"/signIn"})
    public String singInForm(Authentication auth) {
        return auth != null ? "main/home" : "signIn";
    }

    @GetMapping({"/signInFail"})
    public ModelAndView signInFail(ModelAndView mav, String exception) {
        mav.addObject("message", exception);
        mav.setViewName("signIn");
        return mav;
    }

    @GetMapping({"/manageEmp"})
    public String manageEmp() {
        return "admin/manageEmployee";
    }

    @GetMapping({"/initPassword"})
    public String initPasswordForm() {
        return "initPassword";
    }

    @PostMapping({"/initPassword"})
    public String initPassword(@RequestParam("emplId") String emplId, @RequestParam("emplPassword") String emplPassword) {
        this.service.initPassword(emplId, emplPassword);
        return "main/home";
    }

    @ResponseBody
    @GetMapping({"/countEmp"})
    public String countEmp() {
        int result = this.service.countEmp();
        return Integer.toString(this.service.countEmp());
    }

    @PostMapping({"/inputEmp"})
    public String inputEmp(EmployeeVO vo) {
        this.service.inputEmp(vo);
        return "redirect:/employee/manageEmp";
    }

    @ResponseBody
    @GetMapping({"/loadEmpList"})
    public List<EmployeeVO> loadEmpList() {
    return service.loadEmpList();
    }

    @ResponseBody
    @GetMapping({"/findEmp"})
    public List<EmployeeVO> findEmp(String depCode, String emplNm, String sortBy) {
        return service.findEmp(depCode, emplNm, sortBy);
    }

    @ResponseBody
    @GetMapping({"/loadBirthday"})
    public List<EmployeeVO> loadBirthday() {
        return service.loadBirthday();
    }

    @GetMapping({"/loadEmp/{emplId}"})
    public ModelAndView loadEmp(ModelAndView mav, @PathVariable String emplId) {
        EmployeeVO vo = this.service.loadEmp(emplId);
        mav.addObject("empVO", vo);
        mav.setViewName("admin/employeeDetail");
        return mav;
    }

    @GetMapping({"/myVacation"})
    public String myVacation() {
        return "employee/myVacation";
    }

    @GetMapping({"/vacationRecord"})
    public String vacationRecord() {
        return "employee/vacationRecord";
    }

    @GetMapping({"/mySalary"})
    public String mySalary() {
        return "employee/mySalary";
    }

    @GetMapping({"/myChat"})
    public String myChat() {
        return "employee/myChat";
    }

    @GetMapping({"/commute"})
    public String commute() {
        return "employee/commute";
    }

    @GetMapping({"/teamCommunity"})
    public String teamCommunity() {
        return "employee/teamCommunity";
    }

    @GetMapping({"/myInfo"})
    public String myInfo() {
        return "employee/myInfo";
    }

    @PostMapping({"/modifyProfile"})
    public String modifyProfile(@Param("emplId") String emplId, @Param("profileFile") MultipartFile profileFile) {
        log.info("filename={}", profileFile.getOriginalFilename());
        log.info("filesize={}", profileFile.getSize());
        log.info("MIME type={}", profileFile.getContentType());
        this.service.modifyProfile(emplId, profileFile);
        return "redirect:/employee/myInfo";
    }
}

