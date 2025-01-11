# 订单管理系统

```sql
-- 订单表
CREATE TABLE Orders
(
OrderID        INT PRIMARY KEY, -- 订单ID
OrderType      VARCHAR(50),     -- 订单类型 (采购, 买入, 卖出, 租赁)
CustomerID     INT,             -- 客户ID
OrderDate      DATE,            -- 订单日期
TotalAmount    DECIMAL(10, 2),  -- 总金额
Status         VARCHAR(50),     -- 状态
CreatedBy      VARCHAR(100),    -- 创建人
CreatedDate    TIMESTAMP,       -- 创建日期
ModifiedBy     VARCHAR(100),    -- 修改人
ModifiedDate   TIMESTAMP,       -- 修改日期
Description    TEXT             -- 描述
);

-- 订单明细表
CREATE TABLE OrderDetails
(
OrderDetailID  INT PRIMARY KEY, -- 订单明细ID
OrderID        INT,             -- 订单ID
ProductID      INT,             -- 产品ID
Quantity       INT,             -- 数量
UnitPrice      DECIMAL(10, 2),  -- 单价
TotalPrice     DECIMAL(10, 2),  -- 总价
CreatedBy      VARCHAR(100),    -- 创建人
CreatedDate    TIMESTAMP,       -- 创建日期
ModifiedBy     VARCHAR(100),    -- 修改人
ModifiedDate   TIMESTAMP,       -- 修改日期
Description    TEXT             -- 描述
);

```