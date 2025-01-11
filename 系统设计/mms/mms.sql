create table t_marketing_campaign
(
    id          bigint         not null auto_increment comment '主键',
    name        varchar(255)   not null comment '营销活动名称',
    type        int            not null default 0 comment '1-广告 2-促销 3-公关 4-邮件 5-社交 6-调查',
    budget      decimal(10, 2) not null comment '营销活动预算',
    content     text           not null comment '营销活动内容',
    author      varchar(255)   not null comment '作者',
    `tenant_id` bigint         NOT NULL COMMENT '租户id',
    create_time datetime       not null comment '创建时间',
    update_time datetime       not null comment '更新时间',
    version     int            not null default 0 comment '版本号',
    is_deleted  tinyint        not null default 0 comment '逻辑删除 0 未删除 1 已删除',
    primary key (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='营销活动表';

create table t_marketing_campaign_relation
(
    id                    bigint   not null auto_increment comment '主键',
    marketing_campaign_id bigint   not null comment '营销活动id',
    opportunity_id        bigint   not null comment '销售机会id',
    `tenant_id`           bigint   NOT NULL COMMENT '租户id',
    `create_time`         datetime NOT NULL COMMENT '创建时间',
    `update_time`         datetime NOT NULL COMMENT '更新时间',
    `version`             INT      NOT NULL DEFAULT '0' COMMENT '版本号',
    `is_deleted`          tinyint  NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
    primary key (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='营销活动关联表';

create table t_marketing_campaign_member
(
    id                    bigint   not null auto_increment comment '主键',
    `member_id`           bigint   not null comment '成员id',
    marketing_campaign_id bigint   not null comment '营销活动id',
    `tenant_id`           bigint   NOT NULL COMMENT '租户id',
    `create_time`         datetime NOT NULL COMMENT '创建时间',
    `update_time`         datetime NOT NULL COMMENT '更新时间',
    `version`             INT      NOT NULL DEFAULT '0' COMMENT '版本号',
    `is_deleted`          tinyint  NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
    primary key (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='营销活动成员表';