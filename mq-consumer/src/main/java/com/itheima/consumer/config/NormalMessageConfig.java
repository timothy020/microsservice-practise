package com.itheima.consumer.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class NormalMessageConfig {
    @Bean
    public Queue normalMessageQueue() {
        return QueueBuilder
                .durable("normal.queue")
                .deadLetterExchange("dl.exchange")
                .deadLetterRoutingKey("dl.key")
                .build();
    }

    @Bean
    public DirectExchange normalMessageExchange() {
        return new DirectExchange("normal.exchange");
    }

    @Bean
    public Binding normalMessageBinding(Queue normalMessageQueue, DirectExchange normalMessageExchange) {
        return BindingBuilder.bind(normalMessageQueue).to(normalMessageExchange).with("normal.key");
    }

}
