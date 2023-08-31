package kr.co.groovy.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;
@Getter
@Setter
@ToString
public class NoticeVO {
    private String notiEtprCode;
    private String notiTitle;
    private String notiContent;
    private Date notiDate;
    private int notiRdcnt;
    private String notiCtgryIconFileStreNm;
    private String commonCodeNotiKind;


}
