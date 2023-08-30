package kr.co.groovy.enums;

public enum ClassOfPosition {
    대표("01"), 이사("02"), 부장("03"), 팀장("04"), 차장("05"), 과장("06"), 대리("07"), 사원("08");

    private final String label;

    ClassOfPosition(String label) {
        this.label = label;
    }

    public String label() {
        return label;
    }
}
