WITH tb_join AS(
    SELECT t2.*, t3.idVendedor

    FROM Pedido as t1

    LEFT JOIN pagamento_pedido as t2
    ON t1.idPedido = t2.idPedido

    LEFT JOIN item_pedido as t3
    ON t1.idPedido = t3.idPedido

    WHERE t1.dtPedido < '2018-01-01'
    AND t1.dtPedido >= '2017-06-01'
    AND t3.idVendedor IS NOT NULL
),

tb_group AS(
    SELECT idVendedor, 
        descTipoPagamento,
        count(DISTINCT idPedido) as qtdePedidoMeioPagamento,
        sum(vlPagamento) as vlPedidoMeioPagamento
    FROM tb_join
    GROUP BY idVendedor, descTipoPagamento
    ORDER BY idVendedor, descTipoPagamento
),

tb_cartao AS(
    SELECT idVendedor,
           nrParcelas,
           vlPagamento

    FROM tb_join
    WHERE descTipoPagamento = 'credit_card'
)

SELECT * from tb_cartao;