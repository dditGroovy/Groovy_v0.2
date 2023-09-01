package kr.co.groovy.admin;

import kr.co.groovy.vo.NoticeVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {

    void inputNotice(NoticeVO vo);
}
