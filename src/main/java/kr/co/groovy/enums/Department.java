package kr.co.groovy.enums;

public enum Department {
    HRT("인사"), AT("회계"), ST("영업"), PRT("홍보"), GAT("총무"), CEO("경영진");
    private final String label;

    Department(String label) {
        this.label = label;
    }

    public String label() {
        return label;
    }
}
