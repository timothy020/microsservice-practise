package com.itheima.consumer.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.rabbit.retry.MessageRecoverer;
import org.springframework.amqp.rabbit.retry.RepublishMessageRecoverer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@Slf4j
public class ErrorMessageConfig {
    @Bean
    public Queue errorMessageQueue() {
        return new Queue("error.queue");
    }

    @Bean
    public DirectExchange errorMessageExchange() {
        return new DirectExchange("error.exchange");
    }

    @Bean
    public Binding errorMessageBinding(Queue errorMessageQueue, DirectExchange errorMessageExchange) {
        return BindingBuilder.bind(errorMessageQueue).to(errorMessageExchange).with("error");
    }

    @Bean
    public RepublishMessageRecoverer errorMessageRecoverer(RabbitTemplate rabbitTemplate) {
        return new RepublishMessageRecoverer(rabbitTemplate, "error.exchange", "error");
    }
}
