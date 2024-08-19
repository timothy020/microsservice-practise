package com.hmall.api.client;

import com.hmall.api.client.fallback.ItemClientFallbackFactory;
import com.hmall.api.config.DefaultFeignConfig;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collection;
import java.util.List;

@FeignClient(value = "cart-service", configuration = DefaultFeignConfig.class, fallbackFactory = ItemClientFallbackFactory.class)
public interface CartClient {
    @DeleteMapping("/carts")
    void removeByItemIds(@RequestParam("ids") Collection<Long> ids);
}
