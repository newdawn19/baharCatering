package com.bahar.common.service;

import com.bahar.common.dto.rider.RiderDto;
import com.bahar.framework.exception.BusinessCheckException;

/**
 * 骑手服务接口
 *
 * Created by FSQ
 * CopyRight https://www.bahar.cn
 */
public interface RiderService {

    /**
     * 根据会员用户ID获取骑手信息
     */
    RiderDto getRiderByUserId(Integer userId);

    /**
     * 根据骑手ID获取骑手信息
     */
    RiderDto getRiderById(Integer riderId);

    /**
     * 判断会员是否为骑手
     */
    boolean isRider(Integer userId);

    /**
     * 更新骑手信息
     */
    RiderDto updateRider(RiderDto riderDto) throws BusinessCheckException;
}
