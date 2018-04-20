package com.gh.personinfo.user.service;

import com.gh.personinfo.user.model.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    public List<User> find(Map map);
}
