package com.hmall.order.listener;

import com.hmall.common.utils.UserContext;
import com.hmall.order.domain.po.Order;
import com.hmall.order.service.IOrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.amqp.rabbit.annotation.Exchange;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.QueueBinding;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class PayStatusListener {
    private final IOrderService orderService;

    @RabbitListener(bindings = @QueueBinding(
        value = @Queue(value = "trade.pay.success.queue"),
        exchange = @Exchange(value = "pay.direct", type = ExchangeTypes.DIRECT),
        key = "pay.success"
    ))
    public void listenPayStatus(Long orderId) {
        // 1.查询订单
        Order order = orderService.getById(orderId);
        // 2. 判断订单状态，是否为未支付【幂等】
        if(order == null || order.getStatus() != 1) {
             // 不做处理
            return;
        }
        // 3. 标记订单支付成功
        orderService.markOrderPaySuccess(orderId);
    }
}
