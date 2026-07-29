package com.bahar.module.backendApi.controller.merchant;

import com.bahar.common.dto.system.AccountInfo;
import com.bahar.common.enums.StatusEnum;
import com.bahar.common.param.StatusParam;
import com.bahar.common.param.TableAreaPage;
import com.bahar.common.service.StoreService;
import com.bahar.common.service.TableAreaService;
import com.bahar.common.util.TokenUtil;
import com.bahar.framework.exception.BusinessCheckException;
import com.bahar.framework.pagination.PaginationResponse;
import com.bahar.framework.web.BaseController;
import com.bahar.framework.web.ResponseObject;
import com.bahar.repository.model.MtStore;
import com.bahar.repository.model.MtTableArea;
import com.bahar.utils.StringUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 桌码区域管理类controller
 *
 * Created by FSQ
 * CopyRight https://www.bahar.cn
 */
@Api(tags="管理端-桌码区域相关接口")
@RestController
@AllArgsConstructor
@RequestMapping(value = "/backendApi/tableArea")
public class BackendTableAreaController extends BaseController {

    /**
     * 桌码区域服务接口
     */
    private TableAreaService tableAreaService;

    /**
     * 店铺服务接口
     */
    private StoreService storeService;

    /**
     * 桌码区域列表查询
     */
    @ApiOperation(value = "桌码区域列表查询")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @CrossOrigin
    @PreAuthorize("@pms.hasPermission('tableArea:list')")
    public ResponseObject list(@ModelAttribute TableAreaPage tableAreaPage) throws BusinessCheckException {
        AccountInfo accountInfo = TokenUtil.getAccountInfo();
        if (accountInfo.getMerchantId() != null && accountInfo.getMerchantId() > 0) {
            tableAreaPage.setMerchantId(accountInfo.getMerchantId());
        }
        if (accountInfo.getStoreId() != null && accountInfo.getStoreId() > 0) {
            tableAreaPage.setStoreId(accountInfo.getStoreId());
        }

        PaginationResponse<MtTableArea> paginationResponse = tableAreaService.queryTableAreaListByPagination(tableAreaPage);
        List<MtStore> storeList = storeService.getActiveStoreList(accountInfo.getMerchantId(), accountInfo.getStoreId(), null);

        Map<String, Object> result = new HashMap<>();
        result.put("paginationResponse", paginationResponse);
        result.put("storeList", storeList);

        return getSuccessResult(result);
    }

    /**
     * 更新桌码区域状态
     */
    @ApiOperation(value = "更新桌码区域状态")
    @RequestMapping(value = "/updateStatus", method = RequestMethod.POST)
    @CrossOrigin
    @PreAuthorize("@pms.hasPermission('tableArea:edit')")
    public ResponseObject updateStatus(@RequestBody StatusParam params) throws BusinessCheckException {
        AccountInfo accountInfo = TokenUtil.getAccountInfo();

        MtTableArea mtTableArea = tableAreaService.queryTableAreaById(params.getId());
        if (mtTableArea == null) {
            return getFailureResult(201);
        }

        mtTableArea.setOperator(accountInfo.getAccountName());
        mtTableArea.setStatus(params.getStatus());
        tableAreaService.updateTableArea(mtTableArea, accountInfo);

        return getSuccessResult(true);
    }

    /**
     * 保存桌码区域
     */
    @ApiOperation(value = "保存桌码区域")
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @CrossOrigin
    @PreAuthorize("@pms.hasPermission('tableArea:add')")
    public ResponseObject saveHandler(@RequestBody Map<String, Object> params) throws BusinessCheckException {
        String id = params.get("id") == null ? "" : params.get("id").toString();
        String status = params.get("status") == null ? StatusEnum.ENABLED.getKey() : params.get("status").toString();
        String storeId = params.get("storeId") == null ? "0" : params.get("storeId").toString();

        AccountInfo accountInfo = TokenUtil.getAccountInfo();
        MtTableArea mtTableArea = new MtTableArea();
        mtTableArea.setOperator(accountInfo.getAccountName());
        mtTableArea.setStatus(status);
        mtTableArea.setStoreId(Integer.parseInt(storeId));
        mtTableArea.setMerchantId(accountInfo.getMerchantId());
        if (StringUtil.isNotEmpty(id)) {
            mtTableArea.setId(Integer.parseInt(id));
            tableAreaService.updateTableArea(mtTableArea, accountInfo);
        } else {
            tableAreaService.addTableArea(mtTableArea);
        }

        return getSuccessResult(true);
    }

    /**
     * 获取桌码区域详情
     */
    @ApiOperation(value = "获取桌码区域详情")
    @RequestMapping(value = "/info/{id}", method = RequestMethod.GET)
    @CrossOrigin
    @PreAuthorize("@pms.hasPermission('tableArea:list')")
    public ResponseObject info(@PathVariable("id") Integer id) throws BusinessCheckException {
        MtTableArea tableAreaInfo = tableAreaService.queryTableAreaById(id);

        Map<String, Object> result = new HashMap<>();
        result.put("tableAreaInfo", tableAreaInfo);

        return getSuccessResult(result);
    }
}
