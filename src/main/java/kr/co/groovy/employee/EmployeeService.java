package kr.co.groovy.employee;

import kr.co.groovy.enums.ClassOfPosition;
import kr.co.groovy.enums.Department;
import kr.co.groovy.security.CustomUser;
import kr.co.groovy.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Slf4j
@Service
public class EmployeeService {
    final
    EmployeeMapper mapper;
    final
    BCryptPasswordEncoder encoder;
    final
    MultipartHttpServletRequest request;


    public EmployeeService(EmployeeMapper mapper, BCryptPasswordEncoder encoder, MultipartHttpServletRequest request) {
        this.mapper = mapper;
        this.encoder = encoder;
        this.request = request;
    }

    public EmployeeVO signIn(String emplId) {
        return mapper.signIn(emplId);
    }

    public void initPassword(@RequestParam("emplId") String emplId,
                             @RequestParam("emplPassword") String emplPassword) {
        Map<String, Object> paramMap = new HashMap<>();
        String encodePw = encoder.encode(emplPassword);
        paramMap.put("emplId", emplId);
        paramMap.put("emplPassword", encodePw);
        mapper.initPassword(paramMap);
    }

    public int countEmp() {
        return mapper.countEmp();
    }

    public void inputEmp(EmployeeVO vo) {
        vo.setEmplPassword(encoder.encode(vo.getEmplPassword()));
        mapper.inputEmp(vo);
    }

    public List<EmployeeVO> loadEmpList() {
        List<EmployeeVO> list = mapper.loadEmpList();
        for (EmployeeVO vo : list) {
            vo.setCommonCodeDept(Department.valueOf(vo.getCommonCodeDept()).label());
            vo.setCommonCodeClsf(ClassOfPosition.valueOf(vo.getCommonCodeClsf()).label());
        }
        return list;
    }

    public List<EmployeeVO> findEmp(@Param("depCode") String depCode, @Param("emplNm") String emplNm, @Param("sortBy") String sortBy) {
        List<EmployeeVO> list = mapper.findEmp(depCode, emplNm, sortBy);
        for (EmployeeVO vo : list) {
            vo.setCommonCodeDept(Department.valueOf(vo.getCommonCodeDept()).label());
            vo.setCommonCodeClsf(ClassOfPosition.valueOf(vo.getCommonCodeClsf()).label());
        }
        return list;
    }

    public List<EmployeeVO> loadBirthday() {
        return mapper.loadBirthday();
    }

    public EmployeeVO loadEmp(String emplId) {
        return mapper.loadEmp(emplId);
    }

    public EmployeeVO findById(String emplId) {
        return mapper.findById(emplId);
    }

    public void modifyProfile(String emplId, MultipartFile profileFile) {
        try {
            String path = "/Users/seojukang/IdeaProjects/Groovy_v0.2.4/src/main/webapp/resources/images/uploads";

            String originalFileName = profileFile.getOriginalFilename();
            String extension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
            String newFileName = UUID.randomUUID() + "." + extension; // 나중에 처리해도 됨(테스트 기간에는 X)

            File saveFile = new File(path, newFileName);
            profileFile.transferTo(saveFile);

            // 로그인한 유저의 프로필 사진 변수 값 변경
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomUser customUser = (CustomUser) authentication.getPrincipal();
            EmployeeVO employeeVO = customUser.getEmployeeVO();
            employeeVO.setProflPhotoFileStreNm(newFileName);

            Map<String, String> map = new HashMap<>();
            map.put("emplId", emplId);
            map.put("fileName", newFileName);
            map.put("originalFileName", originalFileName);
            mapper.modifyProfile(map);
            log.info("Profile image uploaded successfully");
        } catch (Exception e) {
            log.error("Error uploading profile image");
        }

    }
}