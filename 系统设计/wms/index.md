# 仓库管理系统

## 数据库设计

### 仓库表

```sql
CREATE TABLE Warehouses
(
    WarehouseID       INT PRIMARY KEY AUTO_INCREMENT,                                              -- 仓库ID
    ParentWarehouseID INT,                                                                         -- 父仓库ID
    WarehouseName     VARCHAR(100) NOT NULL,                                                       -- 仓库名称
    Location          VARCHAR(255) NOT NULL,                                                       -- 仓库位置
    CreatedBy         VARCHAR(100),                                                                -- 创建人
    CreatedDate       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,                             -- 创建日期
    ModifiedBy        VARCHAR(100),                                                                -- 修改人
    ModifiedDate      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 修改日期
    Description       TEXT,                                                                        -- 描述
    FOREIGN KEY (ParentWarehouseID) REFERENCES Warehouses (WarehouseID)                            -- 外键关联父仓库
);
```

### 库存表

```sql
CREATE TABLE Inventory
(
    InventoryID  INT PRIMARY KEY AUTO_INCREMENT,                                           -- 库存ID
    WarehouseID  INT       NOT NULL,                                                       -- 仓库ID
    ProductID    INT       NOT NULL,                                                       -- 产品ID
    Quantity     INT       NOT NULL,                                                       -- 数量
    CreatedBy    VARCHAR(100),                                                             -- 创建人
    CreatedDate  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,                             -- 创建日期
    ModifiedBy   VARCHAR(100),                                                             -- 修改人
    ModifiedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 修改日期
    Description  TEXT,                                                                     -- 描述
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses (WarehouseID),                         -- 外键关联仓库表
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)                                -- 外键关联产品表
);
```

### 入库单表

``` 
CREATE TABLE InboundOrders
(
InboundOrderID INT PRIMARY KEY AUTO_INCREMENT, -- 入库单ID
WarehouseID    INT NOT NULL,                   -- 仓库ID
OrderDate      DATE NOT NULL,                  -- 订单日期
Status         VARCHAR(50) NOT NULL,           -- 状态
CreatedBy      VARCHAR(100),                   -- 创建人
CreatedDate    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 创建日期
ModifiedBy     VARCHAR(100),                   -- 修改人
ModifiedDate   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 修改日期
Description    TEXT,                           -- 描述
FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID) -- 外键关联仓库表
);
```

### 出库单表

```
CREATE TABLE OutboundOrders
(
OutboundOrderID INT PRIMARY KEY AUTO_INCREMENT, -- 出库单ID
WarehouseID     INT NOT NULL,                   -- 仓库ID
OrderDate       DATE NOT NULL,                  -- 订单日期
Status          VARCHAR(50) NOT NULL,           -- 状态
CreatedBy       VARCHAR(100),                   -- 创建人
CreatedDate     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 创建日期
ModifiedBy      VARCHAR(100),                   -- 修改人
ModifiedDate    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 修改日期
Description     TEXT,                           -- 描述
FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID) -- 外键关联仓库表
);
```

### 库存移动表

```sql
CREATE TABLE InventoryMovements
(
    MovementID      INT PRIMARY KEY AUTO_INCREMENT,                                           -- 移动ID
    FromWarehouseID INT       NOT NULL,                                                       -- 来源仓库ID
    ToWarehouseID   INT       NOT NULL,                                                       -- 目标仓库ID
    ProductID       INT       NOT NULL,                                                       -- 产品ID
    Quantity        INT       NOT NULL,                                                       -- 数量
    MovementDate    DATE      NOT NULL,                                                       -- 移动日期
    CreatedBy       VARCHAR(100),                                                             -- 创建人
    CreatedDate     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,                             -- 创建日期
    ModifiedBy      VARCHAR(100),                                                             -- 修改人
    ModifiedDate    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 修改日期
    Description     TEXT,                                                                     -- 描述
    FOREIGN KEY (FromWarehouseID) REFERENCES Warehouses (WarehouseID),                        -- 外键关联来源仓库表
    FOREIGN KEY (ToWarehouseID) REFERENCES Warehouses (WarehouseID),                          -- 外键关联目标仓库表
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)                                   -- 外键关联产品表
);
Ï
```