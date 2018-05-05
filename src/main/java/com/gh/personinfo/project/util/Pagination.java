package com.gh.personinfo.project.util;



import java.util.List;

public class Pagination {
    //根据页数截取list
    public static List<?> subList(int start,int size,List<?> list){

        int end=start+size;
        if(end>list.size()){
            end=list.size();
        }
        return list.subList(start,end);
    }
}
