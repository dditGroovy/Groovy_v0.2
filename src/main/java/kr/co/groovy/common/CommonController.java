package kr.co.groovy.common;

import kr.co.groovy.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RequestMapping("/common")
@Controller
public class CommonController {
    final
    CommonService service;

    public CommonController(CommonService service) {
        this.service = service;
    }

    @GetMapping("/loadNoticeList")
    public ModelAndView loadNoticeList(ModelAndView mav) {
        List<NoticeVO> list = service.loadNoticeList();
        log.info(list.toString());
        mav.addObject("noticeList", list);
        mav.setViewName("common/companyNotice");
        return mav;
    }

    @GetMapping("/findNotice")
    public ModelAndView findNotice(ModelAndView mav, @RequestParam(value = "keyword") String keyword, @RequestParam(value = "sortBy") String sortBy) {
        log.info(sortBy);
        log.info(keyword);

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("keyword", keyword);
        paramMap.put("sortBy", sortBy);

        List<NoticeVO> list = service.findNotice(paramMap);
        log.info(list.toString());

        mav.addObject("noticeList", list);
        mav.setViewName("common/companyNotice");
        return mav;
    }
}
