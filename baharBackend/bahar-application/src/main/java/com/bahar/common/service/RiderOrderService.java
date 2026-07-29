package com.bahar.common.service;

import com.bahar.common.dto.rider.RiderOrderDto;
import com.bahar.common.dto.rider.RiderStatsDto;
import com.bahar.common.param.RiderMyOrderParam;
import com.bahar.common.param.RiderOrderSearchParam;
import com.bahar.common.param.RiderOrderPoolParam;
import com.bahar.framework.exception.BusinessCheckException;
import com.bahar.framework.pagination.PaginationResponse;

import java.util.Map;

/**
 * 骑手订单服务接口
 *
 * Created by FSQ
 * CopyRight https://www.bahar.cn
 */
public interface RiderOrderService {

    /**
     * 获取待接单订单池（status=J，待骑手抢单）
     */
    PaginationResponse getOrderPool(RiderOrderPoolParam param, Integer storeId);

    /**
     * 骑手接单
     */
    RiderOrderDto acceptOrder(Integer orderId, Integer riderId, Integer merchantId) throws BusinessCheckException;

    /**
     * 获取骑手的配送订单列表
     */
    PaginationResponse getMyOrders(RiderMyOrderParam param, Integer riderId);

    /**
     * 获取骑手订单详情
     */
    RiderOrderDto getOrderDetail(Integer orderId) throws BusinessCheckException;

    /**
     * 骑手确认取货
     */
    RiderOrderDto confirmPickup(Integer orderId, Integer riderId) throws BusinessCheckException;

    /**
     * 骑手确认送达
     */
    RiderOrderDto confirmDeliver(Integer orderId, Integer riderId) throws BusinessCheckException;

    /**
     * 搜索已完成配送订单
     */
    PaginationResponse searchCompletedOrders(RiderOrderSearchParam param, Integer riderId);

    /**
     * 获取骑手统计信息
     */
    RiderStatsDto getRiderStats(Integer riderId, String mode);

    /**
     * 获取今日概览数据
     */
    Map<String, Object> getTodayOverview(Integer riderId);
}
