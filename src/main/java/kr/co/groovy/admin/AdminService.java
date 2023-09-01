package kr.co.groovy.admin;

import kr.co.groovy.vo.NoticeVO;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
    final
    AdminMapper mapper;

    public AdminService(AdminMapper mapper) {
        this.mapper = mapper;
    }
    public void inputNotice(NoticeVO vo){
        mapper.inputNotice(vo);
    }
}
