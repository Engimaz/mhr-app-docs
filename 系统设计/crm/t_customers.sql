CREATE TABLE `t_customers`
(
    `id`          bigint   NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`        bigint   NOT NULL COMMENT '客户名称',
    `category`    tinyint  NOT NULL default 0 COMMENT '客户类型 1-潜在客户 2-现有客户 3-流失客户',
    `location`    int      NOT NULL COMMENT '客户位置 使用地址编码',
    `address`     varchar(255) COMMENT '客户地址',
    `remark`      varchar(255) COMMENT '备注',
    `tenant_id`   bigint   NOT NULL COMMENT '租户id',
    `create_time` datetime NOT NULL COMMENT '创建时间',
    `update_time` datetime NOT NULL COMMENT '更新时间',
    `version`     INT      NOT NULL DEFAULT '0' COMMENT '版本号',
    `is_deleted`  tinyint  NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='客户表';

CREATE TABLE `t_customer_contacts`
(
    `id`          bigint      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `customer_id` bigint      NOT NULL COMMENT '客户id',
    `name`        bigint      NOT NULL COMMENT '联系人名称',
    `phone`       bigint      NOT NULL COMMENT '联系人电话',
    `email`       varchar(32) NOT NULL COMMENT '联系人邮箱',
    `position`    varchar(32) NOT NULL COMMENT '联系人职位',
    `remark`      varchar(255) COMMENT '备注',
    `tenant_id`   bigint      NOT NULL COMMENT '租户id',
    `create_time` datetime    NOT NULL COMMENT '创建时间',
    `update_time` datetime    NOT NULL COMMENT '更新时间',
    `version`     INT         NOT NULL DEFAULT '0' COMMENT '版本号',
    `is_deleted`  tinyint     NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='客户联系人表';

CREATE TABLE `t_opportunities`
(
    `id`          bigint         NOT NULL AUTO_INCREMENT COMMENT '主键',
    `customer_id` bigint         NOT NULL COMMENT '客户id',
    `title`       varchar(32)    NOT NULL COMMENT '销售机会的标题或名称',
    `status`      int            NOT NULL COMMENT '机会状态 开放、已赢、已输',
    `stage`       int            NOT NULL COMMENT '初步接触、谈判、成交',
    `probability` decimal(10, 2) NOT NULL COMMENT '可能性',
    `value`       decimal(10, 2) NOT NULL COMMENT '达成交易的价值',
    `remark`      varchar(255) COMMENT '备注',
    `tenant_id`   bigint         NOT NULL COMMENT '租户id',
    `create_time` datetime       NOT NULL COMMENT '创建时间',
    `update_time` datetime       NOT NULL COMMENT '更新时间',
    `version`     INT            NOT NULL DEFAULT '0' COMMENT '版本号',
    `is_deleted`  tinyint        NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='销售机会表';


CREATE TABLE t_sales_performance
(
    `id`            bigint         NOT NULL AUTO_INCREMENT COMMENT '主键',
    `amount`        decimal(10, 2) NOT NULL COMMENT '业绩金额',
    `business_date` datetime       NOT NULL COMMENT '业绩日期',
    `remark`        varchar(255) COMMENT '备注',
    `tenant_id`     bigint         NOT NULL COMMENT '租户id',
    `create_time`   datetime       NOT NULL COMMENT '创建时间',
    `update_time`   datetime       NOT NULL COMMENT '更新时间',
    `version`       INT            NOT NULL DEFAULT '0' COMMENT '版本号',
    `is_deleted`    tinyint        NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='销售业绩表';

create table t_sales_performance_relation
(
    id                   bigint   not null auto_increment comment '主键',
    sales_performance_id bigint   not null comment '销售业绩id',
    opportunity_id       bigint   not null comment '销售机会id',
    sales_id             bigint   not null comment '销售id',
    `tenant_id`          bigint   NOT NULL COMMENT '租户id',
    `create_time`        datetime NOT NULL COMMENT '创建时间',
    `update_time`        datetime NOT NULL COMMENT '更新时间',
    `version`            INT      NOT NULL DEFAULT '0' COMMENT '版本号',
    `is_deleted`         tinyint  NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
    primary key (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='销售业绩关联表';




create table t_customer_service_request
(
    id          bigint       not null auto_increment comment '主键',
    customer_id bigint       not null comment '客户id',
    title       varchar(255) not null comment '标题',
    type        tinyint      not null comment '1-售前 2-售后 3-投诉 4-咨询 5-建议 6-技术支持',
    content     text         not null comment '内容',
    `status`    tinyint      not null comment '1-待处理 2-处理中 3-已处理 4-已关闭',
    `tenant_id` bigint       NOT NULL COMMENT '租户id',
    create_time datetime     not null comment '创建时间',
    update_time datetime     not null comment '更新时间',
    version     int          not null default 0 comment '版本号',
    is_deleted  tinyint      not null default 0 comment '逻辑删除 0 未删除 1 已删除',
    primary key (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='客服请求表';

create table t_customer_service_request_relation
(
    id                          bigint   not null auto_increment comment '主键',
    customer_service_request_id bigint   not null comment '客服请求id',
    handler_id                  bigint   not null comment '处理人id',
    type                        tinyint  not null comment '1-机器人 2-客服 3-技术人员',
    `tenant_id`                 bigint   NOT NULL COMMENT '租户id',
    `create_time`               datetime NOT NULL COMMENT '创建时间',
    `update_time`               datetime NOT NULL COMMENT '更新时间',
    `version`                   INT      NOT NULL DEFAULT '0' COMMENT '版本号',
    `is_deleted`                tinyint  NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
    primary key (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='客服请求关联表';

create table t_contracts
(
    id             bigint         not null auto_increment comment '主键',
    customer_id    bigint         not null comment '客户id',
    opportunity_id bigint         not null comment '销售机会id',
    type           tinyint        not null comment '1-销售合同 2-采购合同 3-服务合同',
    title          varchar(255)   not null comment '标题',
    start_time     datetime       not null comment '合同开始时间',
    end_time       datetime       not null comment '合同结束时间',
    status         tinyint        not null comment '1-有效、2-过期、3-终止',
    amount         decimal(10, 2) not null comment '合同金额',
    content        text           not null comment '合同内容',
    `tenant_id`    bigint         NOT NULL COMMENT '租户id',
    create_time    datetime       not null comment '创建时间',
    update_time    datetime       not null comment '更新时间',
    version        int            not null default 0 comment '版本号',
    is_deleted     tinyint        not null default 0 comment '逻辑删除 0 未删除 1 已删除',
    primary key (id)

) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='合同表';