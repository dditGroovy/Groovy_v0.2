package kr.co.groovy.security;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Slf4j
public class CustomLoginSuccessHandler extends
        SavedRequestAwareAuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response, Authentication auth)
            throws ServletException, IOException {
        log.warn("Authentication Successful");

        User customUser = (User) auth.getPrincipal();
        String username = customUser.getUsername();

        // 아이디 기억하기 쿠키 생성
        boolean rememberIdChecked = request.getParameter("rememberId") != null;
        log.info("rememberIdChecked" + rememberIdChecked);
        if (rememberIdChecked) {
            Cookie idCookie = new Cookie("emplId", username);
            idCookie.setMaxAge(60 * 60 * 24 * 7); // 쿠키 유효기간 7일
            idCookie.setPath("/");
            response.addCookie(idCookie);
        }


        log.info("username : " + customUser.getUsername());
        List<String> roleNames = new ArrayList<String>();
        auth.getAuthorities().forEach(authority -> {
            roleNames.add(authority.getAuthority());
        });

        log.info("role : " + roleNames);

        //신입사원(ROLE_NEW)
        if (roleNames.contains("ROLE_NEW")) {
            response.sendRedirect("/employee/initPassword");
        } else {
            response.sendRedirect("/");
        }
        if (!response.isCommitted()) {
            // 리다이렉트 전에 응답이 커밋되지 않았을 경우에만 리다이렉트 수행
            super.onAuthenticationSuccess(request, response, auth);
        }
    }
}



