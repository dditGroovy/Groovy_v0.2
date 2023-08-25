package kr.co.groovy.signin;

import kr.co.groovy.employee.EmployeeVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;

@Controller
public class SignInController {
    private final SignInService service;

    public SignInController(SignInService service) {
        this.service = service;
    }

    @PostMapping("/login")
    public String signIn(EmployeeVO vo, HttpSession session) {
        EmployeeVO empVO = service.selectEmployee(vo.getId());
        session.setAttribute("login", empVO);
        if(session != null){
            return "/resetPassword";
        } else {
            return "/login";
        }
    }

    public String signOut(HttpSession session) {
        session.invalidate();
        return "";
    }

}
