package com.tianshi.domain;

import java.util.Date;

public class Demond {
    private String id;

    private String owner;

    private Date time;

    private String keyword;

    private String cKind;

    private String term;
    private String company ;
    private String phone ;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    @Override
    public String toString() {
        return "Demond{" +
                "id='" + id + '\'' +
                ", owner='" + owner + '\'' +
                ", time=" + time +
                ", keyword='" + keyword + '\'' +
                ", cKind='" + cKind + '\'' +
                ", term='" + term + '\'' +
                ", minMoney='" + minMoney + '\'' +
                ", maxMoney='" + maxMoney + '\'' +
                ", target='" + target + '\'' +
                ", data='" + data + '\'' +
                '}';
    }

    private String minMoney;

    private String maxMoney;

    private String target;

    private String data;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner == null ? null : owner.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    public String getcKind() {
        return cKind;
    }

    public void setcKind(String cKind) {
        this.cKind = cKind == null ? null : cKind.trim();
    }

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term == null ? null : term.trim();
    }

    public String getMinMoney() {
        return minMoney;
    }

    public void setMinMoney(String minMoney) {
        this.minMoney = minMoney == null ? null : minMoney.trim();
    }

    public String getMaxMoney() {
        return maxMoney;
    }

    public void setMaxMoney(String maxMoney) {
        this.maxMoney = maxMoney == null ? null : maxMoney.trim();
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target == null ? null : target.trim();
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data == null ? null : data.trim();
    }
}