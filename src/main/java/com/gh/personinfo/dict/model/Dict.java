package com.gh.personinfo.dict.model;

public class Dict {
    private Integer id;

    private Integer dctypeid;

    private String dictname;

    private Integer dictvalue;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDctypeid() {
        return dctypeid;
    }

    public void setDctypeid(Integer dctypeid) {
        this.dctypeid = dctypeid;
    }

    public String getDictname() {
        return dictname;
    }

    public void setDictname(String dictname) {
        this.dictname = dictname == null ? null : dictname.trim();
    }

    public Integer getDictvalue() {
        return dictvalue;
    }

    public void setDictvalue(Integer dictvalue) {
        this.dictvalue = dictvalue;
    }

    @Override
    public String toString() {
        return "Dict{" +
                "id=" + id +
                ", dctypeid=" + dctypeid +
                ", dictname='" + dictname + '\'' +
                ", dictvalue=" + dictvalue +
                '}';
    }
}