# 商品设计

### 2.5 产品设计表

```sql
CREATE TABLE ProductDesign
(
    DesignID         INT PRIMARY KEY, -- 设计ID
    ProductID        INT,             -- 产品ID
    Specification    VARCHAR(255),    -- 规格
    MaterialID       INT,             -- 物料ID
    MaterialQuantity INT,             -- 物料数量
    Unit             VARCHAR(20),     -- 单位
    CreatedBy        VARCHAR(100),    -- 创建人
    CreatedDate      TIMESTAMP,       -- 创建日期
    ModifiedBy       VARCHAR(100),    -- 修改人
    ModifiedDate     TIMESTAMP,       -- 修改日期
    Description      TEXT             -- 描述
);
```

### 2.1. 物料规格表

```sql
CREATE TABLE BillOfMaterials
(
    BOMID         INT PRIMARY KEY, -- BOM ID
    ProductID     INT,             -- 产品ID
    MaterialID    INT,             -- 物料ID
    Quantity      INT,             -- 数量
    Unit          VARCHAR(20),     -- 单位
    EffectiveDate DATE,            -- 生效日期
    ExpiryDate    DATE,            -- 失效日期
    CreatedBy     VARCHAR(100),    -- 创建人
    CreatedDate   TIMESTAMP,       -- 创建日期
    ModifiedBy    VARCHAR(100),    -- 修改人
    ModifiedDate  TIMESTAMP        -- 修改日期
);
```

### 2.2. 物料表

```sql
CREATE TABLE Material
(
    MaterialID    INT PRIMARY KEY, -- 物料ID
    MaterialName  VARCHAR(100),    -- 物料名称
    MaterialType  VARCHAR(50),     -- 物料类型
    Unit          VARCHAR(20),     -- 单位
    UnitPrice     DECIMAL(10, 2),  -- 单价
    SupplierID    INT,             -- 供应商ID
    StockQuantity INT,             -- 库存数量
    SafetyStock   INT,             -- 安全库存
    LeadTime      INT,             -- 交货期（天）
    Description   TEXT             -- 描述
);
```

### 2.3. 产品表

```sql
CREATE TABLE Product
(
    ProductID     INT PRIMARY KEY, -- 产品ID
    ProductName   VARCHAR(100),    -- 产品名称
    ProductType   VARCHAR(50),     -- 产品类型
    Unit          VARCHAR(20),     -- 单位
    UnitPrice     DECIMAL(10, 2),  -- 单价
    StockQuantity INT,             -- 库存数量
    SafetyStock   INT,             -- 安全库存
    LeadTime      INT,             -- 交货期（天）
    Description   TEXT,            -- 描述
    CreatedDate   TIMESTAMP        -- 创建日期
);
```

### 2.8 产品工艺表

```sql
CREATE TABLE ProductionProcess
(
    ProcessID         INT PRIMARY KEY, -- 工艺ID
    ProductID         INT,             -- 产品ID
    ProcessName       VARCHAR(100),    -- 工艺名称
    Sequence          INT,             -- 顺序
    Duration          INT,             -- 持续时间（分钟）
    ResponsibleDept   VARCHAR(100),    -- 负责部门
    ResponsiblePerson VARCHAR(100),    -- 负责人
    StartDate         TIMESTAMP,       -- 开始日期
    EndDate           TIMESTAMP,       -- 结束日期
    Status            VARCHAR(50),     -- 状态
    CreatedBy         VARCHAR(100),    -- 创建人
    CreatedDate       TIMESTAMP,       -- 创建日期
    ModifiedBy        VARCHAR(100),    -- 修改人
    ModifiedDate      TIMESTAMP,       -- 修改日期
    Description       TEXT             -- 描述
);
```

### 产品类别

```sql
CREATE TABLE Categories
(
CategoryID INT PRIMARY KEY, -- 类别ID
CategoryName VARCHAR(100), -- 类别名称
CreatedBy VARCHAR(100), -- 创建人
CreatedDate TIMESTAMP, -- 创建日期
ModifiedBy VARCHAR(100), -- 修改人
ModifiedDate TIMESTAMP, -- 修改日期
Description TEXT -- 描述
);

```