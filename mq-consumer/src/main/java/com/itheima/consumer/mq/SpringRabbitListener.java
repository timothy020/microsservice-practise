package com.itheima.consumer.mq;

import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.*;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
@Slf4j
public class SpringRabbitListener {

    @RabbitListener(queues = "simple.queue")
    public void simpleQueueListener1(Message message) {
        log.info("监听到来自simple.queue的消息id: {}", message.getMessageProperties().getMessageId());
        log.info("监听到来自simple.queue的消息: {}", new String(message.getBody()));
        throw new RuntimeException("故意抛出异常");
    }

    @RabbitListener(queues = "work.queue")
    public void workQueueListener1(String message) throws InterruptedException {
        log.info("监听到来自work.queue的消息_1: {}", message);
        Thread.sleep(200);
    }
    @RabbitListener(queues = "work.queue")
    public void workQueueListener2(String message) {
        log.error("监听到来自work.queue的消息_2: {}", message);
    }


    @RabbitListener(queues = "fanout.queue1")
    public void fanoutQueueListener1(String message) {
        log.info("监听到来自fanout.queue1的消息: {}", message);
    }
    @RabbitListener(queues = "fanout.queue2")
    public void fanoutQueueListener2(String message) {
        log.info("监听到来自fanout.queue2的消息: {}", message);
    }

    // 基于注解声明队列和交换机
    @RabbitListener(bindings = @QueueBinding(
            value = @Queue("direct.queue1"),
            exchange = @Exchange(value = "my.direct", type = ExchangeTypes.DIRECT),
            key = {"red", "green"}
    ))
    public void directQueueListener1(String message) {
        log.info("监听到来自direct.queue1的消息: {}", message);
    }

    @RabbitListener(bindings = @QueueBinding(
            value = @Queue("direct.queue2"),
            exchange = @Exchange(value = "my.direct", type = ExchangeTypes.DIRECT),
            key = {"red", "blue"}
    ))
    public void directQueueListener2(String message) {
        log.info("监听到来自direct.queue2的消息: {}", message);
    }

    @RabbitListener(queues = "topic.queue1")
    public void topicQueueListener1(String message) {
        log.info("监听到来自topic.queue1的消息【#.news】: {}", message);
    }
    @RabbitListener(queues = "topic.queue2")
    public void topicQueueListener2(String message) {
        log.info("监听到来自topic.queue2的消息【china.#】: {}", message);
    }

    @RabbitListener(queues = "object.queue")
    public void objectQueueListener1(Map<String, Object> msg) {
        log.info("监听到来自object.queue的消息: {}", msg);
    }

//    @RabbitListener(queuesToDeclare = @Queue(
//            value = "lazy.queue",
//            durable = "true",
//            arguments = @Argument(name = "x-queue-mode", value = "lazy")
//    ))
//    public void lazyQueueListener(String message) {
//        log.info("监听到来自lazy.queue的消息: {}", message);
//    }

    // 死信交换机
    @RabbitListener(bindings = @QueueBinding(
            value = @Queue("dl.queue"),
            exchange = @Exchange(value = "dl.exchange", type = ExchangeTypes.DIRECT),
            key = {"dl.key"}
    ))
    public void dlQueue(String message) {
        log.info("监听到来自dl.queue的消息: {}", message);
    }

    // 延时交换机
    @RabbitListener(bindings = @QueueBinding(
            value = @Queue("delay.queue"),
            exchange = @Exchange(value = "delay.exchange", type = ExchangeTypes.DIRECT, delayed = "true"),
            key = {"delay.key"}
    ))
    public void delayQueue(String message) {
        log.info("监听到来自delay.queue的消息: {}", message);
    }
}
