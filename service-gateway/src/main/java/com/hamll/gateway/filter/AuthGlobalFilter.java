package com.hamll.gateway.filter;

import cn.hutool.core.text.AntPathMatcher;
import com.hamll.gateway.config.AuthProperties;
import com.hamll.gateway.util.JwtTool;
import com.hmall.common.exception.UnauthorizedException;
import lombok.RequiredArgsConstructor;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.List;

@Component
@RequiredArgsConstructor
public class AuthGlobalFilter implements GlobalFilter, Ordered {

    private final AuthProperties authProperties;

    private final JwtTool jwtTool;

    private final AntPathMatcher antPathMatcher = new AntPathMatcher();

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        //1.获取request
        ServerHttpRequest request = exchange.getRequest();
        //2.判断是否需要做登录拦截
        if(isExclude(request.getPath().toString())) {
            //放行
            return chain.filter(exchange);
        }
        //3.获取token
        String token = null;
        List<String> headers = request.getHeaders().get("authorization");
        if (headers != null && !headers.isEmpty()) {
            token = headers.get(0);
        }
        //4.校验并解析token
        Long userId = null;
        try {
            userId = jwtTool.parseToken(token);
        } catch (UnauthorizedException e) {
            //拦截，设置 response 状态码为 401
            ServerHttpResponse response = exchange.getResponse();
            response.setStatusCode(org.springframework.http.HttpStatus.UNAUTHORIZED);
            return response.setComplete();
        }
        // 5.传递用户信息
        ServerWebExchange swe = exchange.mutate()
                .request(request.mutate().header("user-info", userId.toString()).build())
                .build();

        //6.放行
        return chain.filter(swe);
    }

    private boolean isExclude(String string) {
        for (String excludePath : authProperties.getExcludePaths()) {
            if (antPathMatcher.match(excludePath, string)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public int getOrder() {
        return 0;
    }
}
