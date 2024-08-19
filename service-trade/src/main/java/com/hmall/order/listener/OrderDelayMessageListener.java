package com.hmall.order.listener;

import com.hmall.api.client.PayClient;
import com.hmall.api.dto.PayOrderDTO;
import com.hmall.order.constans.MQConstants;
import com.hmall.order.domain.po.Order;
import com.hmall.order.service.IOrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.amqp.rabbit.annotation.Exchange;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.QueueBinding;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class OrderDelayMessageListener {
    private final IOrderService orderService;
    private final PayClient payClient;

    @RabbitListener(bindings = @QueueBinding(
            value = @Queue(value = MQConstants.DELAY_ORDER_QUEUE_NAME),
            exchange = @Exchange(value =  MQConstants.DELAY_EXCHANGE_NAME, delayed = "true"),
            key = MQConstants.DELAY_ORDER_ROUTING_KEY
    ))
    public void listenOrderDelayMessage(Long orderId) {
        // 1.查询订单
        Order order = orderService.getById(orderId);
        // 2.检测订单状态，判断是否支付
        if(order == null || order.getStatus() != 1) {
            // 订单不存在或者已支付
            return;
        }
        // 3.未支付，查询支付流水状态
        PayOrderDTO payOrderDTO = payClient.queryPayOrderByBizOrderNo(orderId);
        // 4.判断是否支付
        if(payOrderDTO != null && payOrderDTO.getStatus() == 3) {
            // 4.1.已支付，标记订单状态为已支付
            orderService.markOrderPaySuccess(orderId);
        } else {
            // 4.2.未支付，取消订单，恢复库存
            orderService.cancelOrder(orderId);
        }
    }
}
