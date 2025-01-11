# 财务设计

## 数据库设计

### 账户表
```sql
CREATE TABLE Accounts
(
AccountID   INT PRIMARY KEY AUTO_INCREMENT,                                              -- 账户ID
AccountName VARCHAR(100) NOT NULL,                                                       -- 账户名称
AccountType VARCHAR(50) NOT NULL,                                                        -- 账户类型（如现金、银行、信用卡等）
Balance     DECIMAL(10, 2) NOT NULL,                                                     -- 余额
CreatedBy   VARCHAR(100),                                                                -- 创建人
CreatedDate TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,                             -- 创建日期
ModifiedBy  VARCHAR(100),                                                                -- 修改人
ModifiedDate TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 修改日期
Description TEXT                                                                         -- 描述
);

```
### 交易表 
```sql
CREATE TABLE Transactions
(
TransactionID INT PRIMARY KEY AUTO_INCREMENT,                                              -- 交易ID
AccountID     INT NOT NULL,                                                                -- 账户ID
TransactionDate DATE NOT NULL,                                                             -- 交易日期
Amount        DECIMAL(10, 2) NOT NULL,                                                     -- 金额
TransactionType VARCHAR(50) NOT NULL,                                                      -- 交易类型（如收入、支出、转账等）
Category      VARCHAR(100) NOT NULL,                                                       -- 类别
CreatedBy     VARCHAR(100),                                                                -- 创建人
CreatedDate   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,                             -- 创建日期
ModifiedBy    VARCHAR(100),                                                                -- 修改人
ModifiedDate  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 修改日期
Description   TEXT,                                                                        -- 描述
FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)                                     -- 外键关联账户表
);

```
### 发票表
```sql
CREATE TABLE Invoices
(
InvoiceID    INT PRIMARY KEY AUTO_INCREMENT,                                              -- 发票ID
AccountID    INT NOT NULL,                                                                -- 账户ID
InvoiceDate  DATE NOT NULL,                                                               -- 发票日期
Amount       DECIMAL(10, 2) NOT NULL,                                                     -- 金额
Status       VARCHAR(50) NOT NULL,                                                        -- 状态（如未支付、已支付、已取消等）
CreatedBy    VARCHAR(100),                                                                -- 创建人
CreatedDate  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,                             -- 创建日期
ModifiedBy   VARCHAR(100),                                                                -- 修改人
ModifiedDate TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 修改日期
Description  TEXT,                                                                        -- 描述
FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)                                    -- 外键关联账户表
);

```
### 预算表 
```sql
CREATE TABLE Budgets
(
    BudgetID     INT PRIMARY KEY AUTO_INCREMENT,                                                -- 预算ID
    AccountID    INT            NOT NULL,                                                       -- 账户ID
    BudgetPeriod VARCHAR(50)    NOT NULL,                                                       -- 预算周期（如月度、季度、年度等）
    Amount       DECIMAL(10, 2) NOT NULL,                                                       -- 金额
    CreatedBy    VARCHAR(100),                                                                  -- 创建人
    CreatedDate  TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,                             -- 创建日期
    ModifiedBy   VARCHAR(100),                                                                  -- 修改人
    ModifiedDate TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 修改日期
    Description  TEXT,                                                                          -- 描述
    FOREIGN KEY (AccountID) REFERENCES Accounts (AccountID)                                     -- 外键关联账户表
);
```
