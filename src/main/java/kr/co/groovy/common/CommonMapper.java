package kr.co.groovy.common;

import kr.co.groovy.vo.EmployeeVO;
import kr.co.groovy.vo.NoticeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CommonMapper {
    List<NoticeVO> loadNoticeList();

    List<NoticeVO> findNotice(Map<String, Object> paramMap);

    NoticeVO loadNoticeDetail(int notiSeq);

    void modifyNoticeView(int notiSeq);

    List<EmployeeVO> loadOrgChart (String depCode);
}
