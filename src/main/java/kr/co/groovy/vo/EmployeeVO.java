package kr.co.groovy.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class EmployeeVO {
    private int empSeq;
    private String empId;
    private String empPw;
    private String empName;
    private String empTell;
    private String empMail;
    private String empZip;
    private String empAddr;
    private String empAddrDetail;
    private Date empJoinDate;
    private String empEdu;
    private Date empBir;
    private String empProfile;
    private String empStatus;
    private String posCode;
    private String depCode;
    private String enabled;
    private List<EmployeeAuthVO> employeeAuthVOList;


}
