SELECT date(dtPedido) as dtPedido, COUNT(*) as qtde_pedidos
FROM pedido
GROUP BY DATE(dtPedido);