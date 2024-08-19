package com.hmall.order;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@MapperScan("com.hmall.order.mapper")
@SpringBootApplication
@EnableFeignClients(basePackages = "com.hmall.api.client", defaultConfiguration = com.hmall.api.config.DefaultFeignConfig.class)
public class TradeApplication {
    public static void main(String[] args) {
        SpringApplication.run(TradeApplication.class, args);
    }
}
