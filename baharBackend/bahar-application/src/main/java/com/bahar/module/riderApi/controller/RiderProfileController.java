package com.bahar.module.riderApi.controller;

import com.bahar.common.dto.member.UserInfo;
import com.bahar.common.dto.rider.RiderDto;
import com.bahar.common.service.RiderService;
import com.bahar.common.util.TokenUtil;
import com.bahar.framework.exception.BusinessCheckException;
import com.bahar.framework.web.BaseController;
import com.bahar.framework.web.ResponseObject;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 骑手端-个人信息接口
 *
 * Created by FSQ
 * CopyRight https://www.bahar.cn
 */
@Api(tags = "骑手端-个人信息接口")
@RestController
@AllArgsConstructor
@RequestMapping(value = "/riderApi/profile")
public class RiderProfileController extends BaseController {

    private RiderService riderService;

    /**
     * 获取骑手个人信息
     */
    @ApiOperation(value = "获取骑手个人信息")
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    @CrossOrigin
    public ResponseObject info() throws BusinessCheckException {
        UserInfo userInfo = TokenUtil.getUserInfo();
        if (userInfo == null) {
            return getFailureResult(1001, "用户未登录");
        }
        RiderDto rider = riderService.getRiderByUserId(userInfo.getId());
        if (rider == null) {
            return getFailureResult(403, "非骑手身份");
        }
        return getSuccessResult(rider);
    }
}
