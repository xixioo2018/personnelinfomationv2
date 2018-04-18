package com.gh.personinfo.other.controller;

import com.gh.personinfo.other.service.PositionService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class PositionController {
    @Resource
    PositionService positionService;
}
