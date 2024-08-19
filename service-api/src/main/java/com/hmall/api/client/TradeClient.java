package com.hmall.api.client;

import com.hmall.api.client.fallback.ItemClientFallbackFactory;
import com.hmall.api.config.DefaultFeignConfig;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

@FeignClient(value = "trade-service", configuration = DefaultFeignConfig.class, fallbackFactory = ItemClientFallbackFactory.class)
public interface TradeClient {
    @PutMapping("/orders/{orderId}")
    void markOrderPaySuccess(@PathVariable("orderId") Long orderId);
}
