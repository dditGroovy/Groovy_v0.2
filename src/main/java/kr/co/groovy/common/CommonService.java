package kr.co.groovy.common;

import kr.co.groovy.vo.NoticeVO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CommonService {
    final
    CommonMapper mapper;

    public CommonService(CommonMapper mapper) {
        this.mapper = mapper;
    }

    List<NoticeVO> loadNoticeList() {
        return mapper.loadNoticeList();
    }


    public List<NoticeVO> findNotice(Map<String, Object> paramMap) {
        return mapper.findNotice(paramMap);

    }

    public NoticeVO loadNoticeDetail(int notiSeq) {
        return mapper.loadNoticeDetail(notiSeq);
    }


    public void modifyNoticeView(int notiSeq) {
        mapper.modifyNoticeView(notiSeq);
    }

}
