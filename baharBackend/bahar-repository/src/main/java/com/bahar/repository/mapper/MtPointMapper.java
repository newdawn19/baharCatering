package com.bahar.repository.mapper;

import com.bahar.repository.bean.PointRankBean;
import com.bahar.repository.model.MtPoint;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * 积分变化表 Mapper 接口
 *
 * Created by FSQ
 * CopyRight https://www.bahar.cn
 */
public interface MtPointMapper extends BaseMapper<MtPoint> {

    /**
     * 获取积分总排行
     */
    List<PointRankBean> getPointTotalRank(@Param("merchantId") Integer merchantId);

    /**
     * 获取时间段内积分排行
     */
    List<PointRankBean> getPointPeriodRank(@Param("merchantId") Integer merchantId, @Param("startTime") Date startTime, @Param("endTime") Date endTime);

}
