package com.actionForm;

import org.apache.struts.action.ActionForm;

public class ParameterForm extends ActionForm {
    private int cost;
    private Integer id;
    private int validity;
    private int remindDay;
    public ParameterForm() {
    }

    public void setRemindDay(int remindDay) {
        this.remindDay = remindDay;
    }

    public int getRemindDay() {
        return remindDay;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public void setValidity(int validity) {
        this.validity = validity;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public int getValidity() {
        return validity;
    }
}
