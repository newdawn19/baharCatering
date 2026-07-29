package com.bahar.common.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.bahar.common.dto.system.AccountInfo;
import com.bahar.common.param.TableAreaPage;
import com.bahar.framework.exception.BusinessCheckException;
import com.bahar.framework.pagination.PaginationResponse;
import com.bahar.repository.model.MtTableArea;

/**
 * 桌码区域业务接口
 *
 * Created by FSQ
 * CopyRight https://www.bahar.cn
 */
public interface TableAreaService extends IService<MtTableArea> {

    /**
     * 分页查询列表
     *
     * @param tableAreaPage
     * @return
     */
    PaginationResponse<MtTableArea> queryTableAreaListByPagination(TableAreaPage tableAreaPage);

    /**
     * 添加桌码区域
     *
     * @param  mtTableArea
     * @throws BusinessCheckException
     * @return
     */
    MtTableArea addTableArea(MtTableArea mtTableArea) throws BusinessCheckException;

    /**
     * 根据ID获取桌码区域信息
     *
     * @param id ID
     * @return
     */
    MtTableArea queryTableAreaById(Integer id);

    /**
     * 更新桌码区域
     * @param  mtTableArea
     * @param  accountInfo
     * @throws BusinessCheckException
     * @return
     * */
    MtTableArea updateTableArea(MtTableArea mtTableArea, AccountInfo accountInfo) throws BusinessCheckException;

}
