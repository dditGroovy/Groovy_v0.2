package kr.co.groovy.common;

import kr.co.groovy.enums.ClassOfPosition;
import kr.co.groovy.enums.Department;
import kr.co.groovy.vo.EmployeeVO;
import kr.co.groovy.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
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
        mav.addObject("noticeList", list);
        mav.setViewName("common/companyNotice");
        return mav;
    }

    @GetMapping("/findNotice")
    public ModelAndView findNotice(ModelAndView mav, @RequestParam(value = "keyword") String keyword, @RequestParam(value = "sortBy") String sortBy) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("keyword", keyword);
        paramMap.put("sortBy", sortBy);
        List<NoticeVO> list = service.findNotice(paramMap);
        mav.addObject("noticeList", list);
        mav.setViewName("common/companyNotice");
        return mav;
    }

    @GetMapping("/noticeDetail")
    public ModelAndView loadNoticeDetail(ModelAndView mav, int notiSeq) {
        service.modifyNoticeView(notiSeq);
        NoticeVO vo = service.loadNoticeDetail(notiSeq);
        mav.addObject("noticeDetail", vo);
        mav.setViewName("common/companyNoticeDetail");
        return mav;
    }

    // 조직도 불러오기
    @GetMapping("/loadOrgChart")
    public ModelAndView loadOrgChart(ModelAndView mav, String depCode) {
        List<String> departmentCodes = Arrays.asList("DEPT010", "DEPT011", "DEPT012", "DEPT013", "DEPT014", "DEPT015");
        for (String deptCode : departmentCodes) {
            List<EmployeeVO> deptEmployees = service.loadOrgChart(deptCode);
            for (EmployeeVO vo : deptEmployees) {
                vo.setCommonCodeDept(Department.valueOf(vo.getCommonCodeDept()).label());
                vo.setCommonCodeClsf(ClassOfPosition.valueOf(vo.getCommonCodeClsf()).label());
            }
            mav.addObject(deptCode + "List", deptEmployees);
        }
        mav.setViewName("common/orgChart");
        return mav;
    }
    // 동호회
    @GetMapping("/club")
    public String club(){
        return "common/club";
    }

}

