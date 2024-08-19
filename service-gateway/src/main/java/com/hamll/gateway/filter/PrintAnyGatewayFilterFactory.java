package com.hamll.gateway.filter;

import lombok.Data;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.OrderedGatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.List;

//工厂类的类名需要以GatewayFilterFactory结尾，前缀PrintAny成为过滤器的名称
@Component
public class PrintAnyGatewayFilterFactory extends AbstractGatewayFilterFactory<PrintAnyGatewayFilterFactory.Config> {
    @Override
    public GatewayFilter apply(Config config) {
        return new OrderedGatewayFilter(new GatewayFilter() {
            @Override
            public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
                System.err.println("a: " + config.getA());
                System.err.println("b: " + config.getB());
                System.err.println("c: " + config.getC());
                System.err.println("PrintAnyGatewayFilterFactory");
                return chain.filter(exchange);
            }
        }, 1);
    }

    @Data
    public static class Config{
        private String a;
        private String b;
        private String c;
    }

    @Override
    public List<String> shortcutFieldOrder() {
        return List.of("a", "b", "c");
    }

    @Override
    public Class<Config> getConfigClass() {
        return Config.class;
    }
}
