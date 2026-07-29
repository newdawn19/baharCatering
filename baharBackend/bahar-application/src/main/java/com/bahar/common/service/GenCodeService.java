package com.bahar.common.service;

import com.bahar.framework.exception.BusinessCheckException;
import com.bahar.framework.pagination.PaginationRequest;
import com.bahar.framework.pagination.PaginationResponse;
import com.bahar.repository.model.TGenCode;

/**
 * 代码生成服务接口
 *
 * Created by FSQ
 * CopyRight https://www.bahar.cn
 */
public interface GenCodeService {

    /**
     * 分页查询列表
     *
     * @param paginationRequest
     * @return
     */
    PaginationResponse<TGenCode> queryGenCodeListByPagination(PaginationRequest paginationRequest);

    /**
     * 添加生成代码
     *
     * @param  tGenCode 代码参数
     * @throws BusinessCheckException
     * @return
     */
    TGenCode addGenCode(TGenCode tGenCode) throws BusinessCheckException;

    /**
     * 根据ID获取信息
     *
     * @param  id
     * @return
     */
    TGenCode queryGenCodeById(Integer id);

    /**
     * 更新生成代码
     * @param  tGenCode
     * @return
     * */
    TGenCode updateGenCode(TGenCode tGenCode);

    /**
     * 生成代码（自定义路径）
     *
     * @param tableName 表名称
     * @return
     */
    void generatorCode(String tableName);

}
