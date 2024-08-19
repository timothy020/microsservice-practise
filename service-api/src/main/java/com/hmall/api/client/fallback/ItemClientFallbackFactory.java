package com.hmall.api.client.fallback;

import com.hmall.api.client.ItemClient;
import com.hmall.api.dto.ItemDTO;
import com.hmall.api.dto.OrderDetailDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Slf4j
public class ItemClientFallbackFactory implements FallbackFactory<ItemClient> {
    @Override
    public ItemClient create(Throwable cause) {
        return new ItemClient() {
            @Override
            public List<ItemDTO> queryItemByIds(@RequestParam("ids") Collection<Long> ids) {
                log.info("查询商品失败！ " + cause);
                return new ArrayList<>();
            }

            @Override
            public void deductStock(List<OrderDetailDTO> items) {
                log.info("扣减库存失败！ " + cause);
                throw new RuntimeException(cause);
            }
        };
    }
}
