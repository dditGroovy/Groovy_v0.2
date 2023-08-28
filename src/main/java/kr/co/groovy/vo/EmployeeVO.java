package kr.co.groovy.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class EmployeeVO {
    private String empId;
    private String empPw;
    private String empName;
    private String empTel;
    private String empMail;
    private String empZip;
    private String empAddr;
    private String empAddrDetail;
    private String empJoinDate;
    private String empEdu;
    private String empBir;
    private String empProfile;
    private String empStatus;
    private String posCode;
    private String depCode;
    private String enabled;
    private String empSign;
    private List<EmployeeAuthVO> employeeAuthVOList;
}
