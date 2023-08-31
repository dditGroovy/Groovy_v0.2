package kr.co.groovy.employee;

import kr.co.groovy.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class EmployeeService {
    final
    EmployeeMapper mapper;
  final
  BCryptPasswordEncoder encoder;

    public EmployeeService(EmployeeMapper mapper, BCryptPasswordEncoder encoder) {
        this.mapper = mapper;
        this.encoder = encoder;
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
        return mapper.loadEmpList();
    }

    public List<EmployeeVO> findEmp(@Param("depCode") String depCode, @Param("emplNm") String emplNm, @Param("sortBy") String sortBy) {
        return mapper.findEmp(depCode, emplNm, sortBy);
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


}
