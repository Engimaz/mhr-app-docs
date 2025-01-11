# 供应商管理

## 数据库设计

### 供应商表

```sql
CREATE TABLE Suppliers
(
    SupplierID   INT PRIMARY KEY AUTO_INCREMENT,                                              -- 供应商ID
    SupplierName VARCHAR(100) NOT NULL,                                                       -- 供应商名称
    Address      VARCHAR(255) NOT NULL,                                                       -- 地址
    PhoneNumber  VARCHAR(20)  NOT NULL,                                                       -- 电话号码
    Email        VARCHAR(100) NOT NULL,                                                       -- 电子邮件
    CreatedBy    VARCHAR(100),                                                                -- 创建人
    CreatedDate  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,                             -- 创建日期
    ModifiedBy   VARCHAR(100),                                                                -- 修改人
    ModifiedDate TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 修改日期
    Description  TEXT                                                                         -- 描述
);

``` 

### 供应商联系人表

```sql
CREATE TABLE SupplierContacts
(
    ContactID    INT PRIMARY KEY AUTO_INCREMENT,                                              -- 联系人ID
    SupplierID   INT          NOT NULL,                                                       -- 供应商ID
    ContactName  VARCHAR(100) NOT NULL,                                                       -- 联系人姓名
    PhoneNumber  VARCHAR(20)  NOT NULL,                                                       -- 联系电话
    Email        VARCHAR(100) NOT NULL,                                                       -- 电子邮件
    CreatedBy    VARCHAR(100),                                                                -- 创建人
    CreatedDate  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,                             -- 创建日期
    ModifiedBy   VARCHAR(100),                                                                -- 修改人
    ModifiedDate TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 修改日期
    Description  TEXT,                                                                        -- 描述
    FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID)                                -- 外键关联供应商表
);
```

### 供应商产品表

```sql
CREATE TABLE SupplierProducts
(
    SupplierProductID INT PRIMARY KEY AUTO_INCREMENT,                                                -- 供应商产品ID
    SupplierID        INT            NOT NULL,                                                       -- 供应商ID
    ProductID         INT            NOT NULL,                                                       -- 产品ID
    Price             DECIMAL(10, 2) NOT NULL,                                                       -- 价格
    CreatedBy         VARCHAR(100),                                                                  -- 创建人
    CreatedDate       TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,                             -- 创建日期
    ModifiedBy        VARCHAR(100),                                                                  -- 修改人
    ModifiedDate      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 修改日期
    Description       TEXT,                                                                          -- 描述
    FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID),                                      -- 外键关联供应商表
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)                                          -- 外键关联产品表
);
```

### 供应商评估表

```sql
CREATE TABLE SupplierEvaluations
(
    EvaluationID   INT PRIMARY KEY AUTO_INCREMENT,                                           -- 评估ID
    SupplierID     INT       NOT NULL,                                                       -- 供应商ID
    EvaluationDate DATE      NOT NULL,                                                       -- 评估日期
    Score          INT       NOT NULL,                                                       -- 评分
    Comments       TEXT,                                                                     -- 评语
    CreatedBy      VARCHAR(100),                                                             -- 创建人
    CreatedDate    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,                             -- 创建日期
    ModifiedBy     VARCHAR(100),                                                             -- 修改人
    ModifiedDate   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 修改日期
    FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID)                               -- 外键关联供应商表
);
```