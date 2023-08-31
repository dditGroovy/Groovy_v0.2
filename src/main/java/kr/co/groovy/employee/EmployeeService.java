package kr.co.groovy.employee;

import kr.co.groovy.enums.ClassOfPosition;
import kr.co.groovy.enums.Department;
import kr.co.groovy.security.CustomUser;
import kr.co.groovy.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.List;
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

    public void initPassword(String emplId, String emplPassword) {
        String encodePw = encoder.encode(emplPassword);
        mapper.initPassword(emplId, encodePw);
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

    public List<EmployeeVO> findEmp(String depCode, String emplNm, String sortBy) {
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

            mapper.modifyProfile(emplId, newFileName, originalFileName);
            log.info("프로필 사진 변경 성공");
        } catch (Exception e) {
            log.info("프로필 사진 변경 실패");
        }
    }

    public void modifyPassword(String emplId, String emplPassword) {
        String encodePw = encoder.encode(emplPassword);
        mapper.modifyPassword(emplId, encodePw);
    }

    public void modifySign(String emplId, MultipartFile signPhotoFile) {
        try {
            String path = "/Users/seojukang/IdeaProjects/Groovy_v0.2.4/src/main/webapp/resources/images/sign";
            log.debug("왜?1");

            String originalFileName = signPhotoFile.getOriginalFilename();
            String extension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
            String newFileName = UUID.randomUUID() + "." + extension; // 나중에 처리해도 됨(테스트 기간에는 X)
            log.debug("왜?2");

            File saveFile = new File(path, newFileName);
            signPhotoFile.transferTo(saveFile);
            log.debug("왜?3");

            // 로그인한 유저의 서명 사진 변수 값 변경
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomUser customUser = (CustomUser) authentication.getPrincipal();
            EmployeeVO employeeVO = customUser.getEmployeeVO();
            employeeVO.setSignPhotoFileStreNm(newFileName);
            log.debug("왜?4");
            log.info(emplId);
            log.info(signPhotoFile + "service");

            mapper.modifySign(emplId, newFileName, originalFileName);
            log.info("서명 변경 성공");
        } catch (Exception e) {
            log.info("서명 변경 실패");
        }
    }
}

