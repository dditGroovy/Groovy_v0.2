package kr.co.groovy.security;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/security")
@Controller
public class ErrorController {
    @GetMapping("/403")
    public String error403() {
        return "security/403";
    }
}
