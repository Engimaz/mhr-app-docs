# 生产系统设计

## 1. 项目结构

## 2. 表设计





### 2.4. 生产记录表

```sql
CREATE TABLE ProductionRecord
(
    RecordID       INT PRIMARY KEY, -- 记录ID
    ProductID      INT,             -- 产品ID
    ProductionDate DATE,            -- 生产日期
    Quantity       INT,             -- 数量
    Unit           VARCHAR(20),     -- 单位
    ProducedBy     VARCHAR(100),    -- 生产人
    CreatedBy      VARCHAR(100),    -- 创建人
    CreatedDate    TIMESTAMP,       -- 创建日期
    ModifiedBy     VARCHAR(100),    -- 修改人
    ModifiedDate   TIMESTAMP,       -- 修改日期
    Description    TEXT             -- 描述
);
```

### 2.4. 产品交货表

```sql
CREATE TABLE Delivery
(
    DeliveryID      INT PRIMARY KEY, -- 交货ID
    OrderID         INT,             -- 订单ID
    ProductID       INT,             -- 产品ID
    DeliveryDate    DATE,            -- 交货日期
    Quantity        INT,             -- 数量
    Unit            VARCHAR(20),     -- 单位
    DeliveryAddress VARCHAR(255),    -- 交货地址
    DeliveryStatus  VARCHAR(50),     -- 交货状态
    Carrier         VARCHAR(100),    -- 承运人
    TrackingNumber  VARCHAR(100),    -- 追踪号码
    CreatedBy       VARCHAR(100),    -- 创建人
    CreatedDate     TIMESTAMP,       -- 创建日期
    ModifiedBy      VARCHAR(100),    -- 修改人
    ModifiedDate    TIMESTAMP,       -- 修改日期
    Description     TEXT             -- 描述
);
```

### 2.4 工序节点表

```sql
CREATE TABLE ProcessNode
(
    NodeID            INT PRIMARY KEY, -- 节点ID
    ProcessID         INT,             -- 流程ID
    NodeName          VARCHAR(100),    -- 节点名称
    NodeType          VARCHAR(50),     -- 节点类型
    Sequence          INT,             -- 顺序
    Duration          INT,             -- 持续时间（分钟）
    ResponsibleDept   VARCHAR(100),    -- 负责部门
    ResponsiblePerson VARCHAR(100),    -- 负责人
    StartDate         TIMESTAMP,       -- 开始日期
    EndDate           TIMESTAMP,       -- 结束日期
    Status            VARCHAR(50),     -- 状态
    Description       TEXT             -- 描述
);
```


### 2.6 工序外发表
```sql
CREATE TABLE OutsourcedProcess
(
    OutsourceID    INT PRIMARY KEY, -- 外发ID
    ProcessID      INT,             -- 流程ID
    NodeID         INT,             -- 节点ID
    FactoryName    VARCHAR(100),    -- 加工厂名称
    FactoryAddress VARCHAR(255),    -- 加工厂地址
    ContactPerson  VARCHAR(100),    -- 联系人
    ContactPhone   VARCHAR(20),     -- 联系电话
    StartDate      TIMESTAMP,       -- 开始日期
    EndDate        TIMESTAMP,       -- 结束日期
    Status         VARCHAR(50),     -- 状态
    Cost           DECIMAL(10, 2),  -- 费用
    Description    TEXT             -- 描述
);
```
### 2.7 工人操作记录表
```sql
CREATE TABLE WorkerOperation
(
    OperationID  INT PRIMARY KEY, -- 操作ID
    WorkerID     INT,             -- 工人ID
    ProcessID    INT,             -- 流程ID
    NodeID       INT,             -- 节点ID
    StartTime    TIMESTAMP,       -- 开始时间
    EndTime      TIMESTAMP,       -- 结束时间
    HoursWorked  DECIMAL(5, 2),   -- 工作小时数
    HourlyRate   DECIMAL(10, 2),  -- 时薪
    TotalPay     DECIMAL(10, 2),  -- 总工资
    CreatedBy    VARCHAR(100),    -- 创建人
    CreatedDate  TIMESTAMP,       -- 创建日期
    ModifiedBy   VARCHAR(100),    -- 修改人
    ModifiedDate TIMESTAMP,       -- 修改日期
    Description  TEXT             -- 描述
);
```

