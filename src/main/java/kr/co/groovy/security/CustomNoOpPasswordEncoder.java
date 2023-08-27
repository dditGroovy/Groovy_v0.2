package kr.co.groovy.security;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.security.MessageDigest;

@Slf4j
public class CustomNoOpPasswordEncoder implements PasswordEncoder {
    private final Log logger = LogFactory.getLog(getClass());

    @Override
    public String encode(CharSequence rawPassword) {
        if (rawPassword == null) {
            throw new IllegalArgumentException("rawPassword cannot be null");
        }
        return this.getSHA512Pw(rawPassword);
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        return rawPassword.toString().equals(encodedPassword);
    }

    private String getSHA512Pw(CharSequence rawPassword) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-512");
            md.update(rawPassword.toString().getBytes());
        } catch (Exception e) {
            this.logger.warn(e.getMessage());
        }

        byte[] msgb = md.digest();

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < msgb.length; i++) {
            String tmp = Integer.toHexString(msgb[i] & 0xFF);
            while (tmp.length() < 2)
                tmp = "0" + tmp;
            sb.append(tmp.substring(tmp.length() - 2));
        }
        return sb.toString();
    }
}

