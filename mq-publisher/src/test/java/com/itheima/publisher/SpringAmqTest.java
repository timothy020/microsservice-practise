package com.itheima.publisher;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageBuilder;
import org.springframework.amqp.core.MessageDeliveryMode;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.concurrent.ListenableFutureCallback;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@SpringBootTest
@Slf4j
public class SpringAmqTest {
    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Test
    public void testSimpleQueue() {
        //1. 队列名
        String queueName = "simple.queue";
        //2. 消息
        String message = "hello spring amq";
        //3. 发送消息
        rabbitTemplate.convertAndSend(queueName, message);
    }

    @Test
    public void testWorkQueue() {
        String queueName = "work.queue";

        String message = "hello spring amq_";

        for (int i = 0; i < 50; i++) {
            rabbitTemplate.convertAndSend(queueName, message + i);
        }
    }

    @Test
    public void testFanoutExchange() {
        //1. 交换机名
        String exchangeName = "my.fanout";
        //2. 消息
        String message = "hello fanout exchange";
        //3. 发送消息
        rabbitTemplate.convertAndSend(exchangeName, "", message);
    }

    @Test
    public void testDirectExchange() {
        String exchangeName = "my.direct";

        String routingKey = "red";
        String message = "红色警报！ 红色警报！";
        rabbitTemplate.convertAndSend(exchangeName, routingKey, message);

        routingKey = "green";
        message = "虚惊一场~ 虚惊一场~";
        rabbitTemplate.convertAndSend(exchangeName, routingKey, message);

        routingKey = "blue";
        message = "蔚蓝大海* 蔚蓝大海*";
        rabbitTemplate.convertAndSend(exchangeName, routingKey, message);
    }

    @Test
    public void testTopicExchange() {
        String exchangeName = "my.topic";

        String routingKey = "china.news";
        String message = "中国新闻";
        rabbitTemplate.convertAndSend(exchangeName, routingKey, message);
        routingKey = "japan.news";
        message = "日本新闻";
        rabbitTemplate.convertAndSend(exchangeName, routingKey, message);

        routingKey = "china.weather";
        message = "中国天气";
        rabbitTemplate.convertAndSend(exchangeName, routingKey, message);
        routingKey = "japan.weather";
        message = "日本天气";
        rabbitTemplate.convertAndSend(exchangeName, routingKey, message);
    }

    @Test
    public void testObjectQueue() {
        String queueName = "object.queue";

        Map<String, Object> msg =  new HashMap<>();
        msg.put("name", "张三");
        msg.put("age", 21);

        rabbitTemplate.convertAndSend(queueName, msg);
    }

    @Test
    public void testConfirmCallback() throws InterruptedException {
        // 1.创建CorrelationData
        CorrelationData cd = new CorrelationData();
        // 2.给Future添加ConfirmCallback
        cd.getFuture().addCallback(new ListenableFutureCallback<CorrelationData.Confirm>() {
            @Override
            public void onFailure(Throwable ex) {
                // 2.1.Future发生异常时的处理逻辑，基本不会触发
                log.error("send message fail", ex);
            }
            @Override
            public void onSuccess(CorrelationData.Confirm result) {
                // 2.2.Future接收到回执的处理逻辑，参数中的result就是回执内容
                if(result.isAck()){ // result.isAck()，boolean类型，true代表ack回执，false 代表 nack回执
                    log.debug("发送消息成功，收到 ack!");
                }else{ // result.getReason()，String类型，返回nack时的异常描述
                    log.error("发送消息失败，收到 nack, reason : {}", result.getReason());
                }
            }
        });
        //3. 发送消息
        rabbitTemplate.convertAndSend("my.direct", "green", "hello spring amq", cd);

        Thread.sleep(2000);
    }

    @Test
    public void testDurableMessage() {
        // 1.自定义构建消息
        Message message = MessageBuilder.withBody("hello spring amq".getBytes())
                .setDeliveryMode(MessageDeliveryMode.PERSISTENT)
                .build();
        // 2.发送消息
        for (int i = 0; i < 1000000; i++) {
            rabbitTemplate.convertAndSend("lazy.queue", message);
        }
    }

    @Test
    public void testDelayMessage() {
        rabbitTemplate.convertAndSend("normal.exchange", "normal.key", "hello delay message", message -> {
            message.getMessageProperties().setExpiration("10000");
            return message;
        });
    }

    @Test
    public void testDelayMessageByPlugin() {
        rabbitTemplate.convertAndSend("delay.exchange", "delay.key", "hello delay message by plugin", message -> {
            message.getMessageProperties().setDelay(10000);
            return message;
        });
    }
}
