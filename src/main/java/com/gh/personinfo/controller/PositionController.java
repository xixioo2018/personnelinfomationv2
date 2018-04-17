package com.gh.personinfo.controller;

import com.gh.personinfo.service.PositionService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class PositionController {
    @Resource
    PositionService positionService;
}
