package com.hmall.api.config;


import com.hmall.api.client.fallback.ItemClientFallbackFactory;
import com.hmall.common.utils.UserContext;
import feign.Logger;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.context.annotation.Bean;

public class DefaultFeignConfig {
    /**
     * 配置日志级别
     */
    @Bean
    public Logger.Level feignLogLevel(){
        return Logger.Level.FULL;
    }


    /**
     * 配置Feign拦截器：在请求头中，传递用户信息【用于微服务之间的相互调用时】
     */
    @Bean
    public RequestInterceptor userInfoRequestInterceptor() {
        return new RequestInterceptor() {
            @Override
            public void apply(RequestTemplate requestTemplate) {
                Long userId = UserContext.getUser();
                if(userId != null) {
                    requestTemplate.header("user-info", userId.toString());
                }
            }
        };
    }

    @Bean
    public ItemClientFallbackFactory itemClientFallbackFactory() {
        return new ItemClientFallbackFactory();
    }
}