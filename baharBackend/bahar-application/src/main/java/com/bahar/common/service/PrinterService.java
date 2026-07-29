package com.bahar.common.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.bahar.common.dto.order.UserOrderDto;
import com.bahar.common.dto.system.AccountInfo;
import com.bahar.common.param.PrinterPage;
import com.bahar.framework.pagination.PaginationResponse;
import com.bahar.repository.model.MtPrinter;
import com.bahar.framework.exception.BusinessCheckException;
import java.util.List;
import java.util.Map;

/**
 * 打印机业务接口
 *
 * Created by FSQ
 * CopyRight https://www.bahar.cn
 */
public interface PrinterService extends IService<MtPrinter> {

    /**
     * 分页查询列表
     *
     * @param printerPage
     * @return
     */
    PaginationResponse<MtPrinter> queryPrinterListByPagination(PrinterPage printerPage);

    /**
     * 添加打印机
     *
     * @param  mtPrinter
     * @throws BusinessCheckException
     * @return
     */
    MtPrinter addPrinter(MtPrinter mtPrinter) throws BusinessCheckException;

    /**
     * 打印订单
     *
     * @param orderInfo 订单信息
     * @param autoPrint 自动打印
     * @param beforePay 支付前打印
     * @param afterPay 支付后打印
     * @param goodsIds 打印的商品Id
     * @throws Exception
     * @return
     * */
    Boolean printOrder(UserOrderDto orderInfo, boolean autoPrint, boolean beforePay, boolean afterPay, List<Integer> goodsIds) throws Exception;

    /**
     * 打印标签
     *
     * @param orderInfo 订单信息
     * @param autoPrint 自动打印
     * @param beforePay 支付前打印
     * @param afterPay 支付后打印
     * @param goodsIds 打印的商品Id
     * @throws Exception
     * @return
     * */
    Boolean printLabel(UserOrderDto orderInfo, boolean autoPrint, boolean beforePay, boolean afterPay, List<Integer> goodsIds) throws Exception;

    /**
     * 根据ID获取打印机信息
     *
     * @param id ID
     * @return
     */
    MtPrinter queryPrinterById(Integer id);

    /**
     * 根据ID删除打印机
     *
     * @param  id ID
     * @param  accountInfo 操作人
     * @throws BusinessCheckException
     * @return
     */
    void deletePrinter(Integer id, AccountInfo accountInfo) throws BusinessCheckException;

    /**
     * 更新打印机
     * @param  mtPrinter
     * @param accountInfo
     * @throws BusinessCheckException
     * @return
     * */
    MtPrinter updatePrinter(MtPrinter mtPrinter, AccountInfo accountInfo) throws BusinessCheckException;

    /**
     * 根据条件搜索打印机
     *
     * @param params 查询参数
     * @return
     * */
    List<MtPrinter> queryPrinterListByParams(Map<String, Object> params);

    /**
     * 同时打印订单和标签（双线程并行执行）
     *
     * @param orderInfo 订单信息
     * @param autoPrint 自动打印
     * @param beforePay 支付前打印
     * @param afterPay 支付后打印
     * @param goodsIds 打印的商品Id
     * @return 包含打印订单和标签结果的Map，key为"order"和"label"
     * @throws Exception
     */
    Boolean printOrderAndLabel(UserOrderDto orderInfo, boolean autoPrint, boolean beforePay, boolean afterPay, List<Integer> goodsIds) throws Exception;
}
