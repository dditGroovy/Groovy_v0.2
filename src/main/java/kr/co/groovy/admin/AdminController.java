package kr.co.groovy.admin;

import kr.co.groovy.vo.NoticeVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {
    final
    AdminService service;

    public AdminController(AdminService service) {
        this.service = service;
    }

    @GetMapping("/manageNotice")
    public String manageNotice() {
        return "admin/manageNotice";

    }
    @PostMapping("/inputNotice")
    public String inputNotice(NoticeVO vo){
        service.inputNotice(vo);
        return "admin/manageNotice";
    }
}
