package kr.co.groovy.employee;

import kr.co.groovy.security.CustomNoOpPasswordEncoder;
import kr.co.groovy.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Service
public class EmployeeService {
    final
    EmployeeMapper mapper;
    CustomNoOpPasswordEncoder encoder;

    public EmployeeService(EmployeeMapper mapper) {
        this.mapper = mapper;
    }

    public EmployeeVO signIn(String emplId) {
        return mapper.signIn(emplId);
    }

    public void initPassword(@RequestParam("emplId") String id,
                             @RequestParam("emplPassword") String pw) {
        mapper.initPassword(id, pw);
    }

    public int countEmp() {
        return mapper.countEmp();
    }

    public int inputEmp(EmployeeVO vo) {
        log.info("inputEmp" + vo);
        // 암호화 추가 예정
//        log.info(encoder.encode(vo.getEmpPw()));
//        vo.setEmpPw(encoder.encode(vo.getEmpPw()));
        return mapper.inputEmp(vo);
    }

    public List<EmployeeVO> loadEmpList() {
        return mapper.loadEmpList();
    }

    public List<EmployeeVO> findEmp(@Param("depCode") String depCode, @Param("emplNm") String emplNm, @Param("sortBy") String sortBy) {
        return mapper.findEmp(depCode, emplNm, sortBy);
    }

}
