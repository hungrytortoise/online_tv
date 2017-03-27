package com.tianshi.domain;

import java.util.Date;

public class ShowInfo {
    private String id;

    private String title;

    private String stage;

    private Date time;

    @Override
    public String toString() {
        return "ShowInfo{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", stage='" + stage + '\'' +
                ", time=" + time +
                ", keyword='" + keyword + '\'' +
                ", financingMoney='" + financingMoney + '\'' +
                ", financingPercent='" + financingPercent + '\'' +
                ", workMethod='" + workMethod + '\'' +
                ", payOut='" + payOut + '\'' +
                ", patent='" + patent + '\'' +
                ", info='" + info + '\'' +
                ", tInfo='" + tInfo + '\'' +
                ", market='" + market + '\'' +
                ", tAdvance='" + tAdvance + '\'' +
                ", owner='" + owner + '\'' +
                ", tag='" + tag + '\'' +
                '}';
    }

    private String keyword;

    private String financingMoney;

    private String financingPercent;

    private String workMethod;

    private String payOut;

    private String patent;

    private String info;

    private String tInfo;

    private String market;

    private String tAdvance;

    private String owner;

    private String tag;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getStage() {
        return stage;
    }

    public void setStage(String stage) {
        this.stage = stage == null ? null : stage.trim();
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

    public String getFinancingMoney() {
        return financingMoney;
    }

    public void setFinancingMoney(String financingMoney) {
        this.financingMoney = financingMoney == null ? null : financingMoney.trim();
    }

    public String getFinancingPercent() {
        return financingPercent;
    }

    public void setFinancingPercent(String financingPercent) {
        this.financingPercent = financingPercent == null ? null : financingPercent.trim();
    }

    public String getWorkMethod() {
        return workMethod;
    }

    public void setWorkMethod(String workMethod) {
        this.workMethod = workMethod == null ? null : workMethod.trim();
    }

    public String getPayOut() {
        return payOut;
    }

    public void setPayOut(String payOut) {
        this.payOut = payOut == null ? null : payOut.trim();
    }

    public String getPatent() {
        return patent;
    }

    public void setPatent(String patent) {
        this.patent = patent == null ? null : patent.trim();
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info == null ? null : info.trim();
    }

    public String gettInfo() {
        return tInfo;
    }

    public void settInfo(String tInfo) {
        this.tInfo = tInfo == null ? null : tInfo.trim();
    }

    public String getMarket() {
        return market;
    }

    public void setMarket(String market) {
        this.market = market == null ? null : market.trim();
    }

    public String gettAdvance() {
        return tAdvance;
    }

    public void settAdvance(String tAdvance) {
        this.tAdvance = tAdvance == null ? null : tAdvance.trim();
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner == null ? null : owner.trim();
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag == null ? null : tag.trim();
    }
}