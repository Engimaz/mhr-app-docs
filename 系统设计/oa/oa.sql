create table t_report
(
    id          bigint       not null auto_increment comment '主键',
    name        varchar(255) not null comment '报表名称',
    type        int          not null default 0 comment '1-销售报告 2-客户报告 3-市场分析 4-营销报告',
    content     text         not null comment '报表内容',
    author      varchar(255) not null comment '作者',
    create_time datetime     not null comment '创建时间',
    update_time datetime     not null comment '更新时间',
    version     int          not null default 0 comment '版本号',
    is_deleted  tinyint      not null default 0 comment '逻辑删除 0 未删除 1 已删除',
    primary key (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='报告表';