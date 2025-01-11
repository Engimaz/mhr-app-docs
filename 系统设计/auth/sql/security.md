```sql
CREATE TABLE `t_account`
(
    `id`                  bigint unsigned NOT NULL AUTO_INCREMENT,
    `account`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
    `password`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
    `status`              tinyint                                                       NOT NULL DEFAULT '0' COMMENT '状态 0 正常 1 异常',
    `account_expired`     tinyint                                                       NOT NULL DEFAULT '0' COMMENT '账号过期 0 未过期 1 已过期',
    `account_locked`      tinyint                                                       NOT NULL DEFAULT '0' COMMENT '账号锁定 0 未锁定 1 已锁定',
    `credentials_expired` tinyint                                                       NOT NULL DEFAULT '0' COMMENT '凭证过期 0 未过期 1 已过期',
    `create_time`         datetime                                                      NOT NULL,
    `update_time`         datetime                                                      NOT NULL,
    `version`             int                                                           NOT NULL DEFAULT '0' COMMENT '版本号',
    `is_deleted`          tinyint                                                       NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='账号表';


CREATE TABLE `t_binding`
(
    `id`            bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `account_id`    bigint                                                        NOT NULL COMMENT '用户id',
    `identity_type` int                                                           NOT NULL COMMENT '登录类型(手机号/邮箱) 或第三方应用名称 (微信/微博等)',
    `identifier`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号/邮箱/第三方的唯一标识',
    `credential`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码凭证 (自建账号的保存密码, 第三方的保存 token)',
    `create_time`   datetime                                                      NOT NULL COMMENT '创建时间',
    `update_time`   datetime                                                      NOT NULL COMMENT '更新时间',
    `version`       INT                                                           NOT NULL DEFAULT '0' COMMENT '版本号',
    `is_deleted`    tinyint                                                       NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='账号绑定表';

CREATE TABLE t_tenants
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
    parent_id   BIGINT       NOT NULL COMMENT '父租户ID',
    tenant_code VARCHAR(255) NOT NULL UNIQUE COMMENT '租户编码',
    name        VARCHAR(255) NOT NULL COMMENT '租户名称',
    description TEXT NULL COMMENT '描述',
    create_time datetime     NOT NULL COMMENT '创建时间',
    update_time datetime     NOT NULL COMMENT '更新时间',
    version     INT          NOT NULL DEFAULT '0' COMMENT '版本号',
    is_deleted  tinyint      NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='租户表';

CREATE TABLE t_roles
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
    tenant_id   BIGINT       NOT NULL COMMENT '租户ID',
    role_name   VARCHAR(255) NOT NULL COMMENT '角色名称', ,
    description TEXT NULL COMMENT '描述',
    create_time datetime     NOT NULL COMMENT '创建时间',
    update_time datetime     NOT NULL COMMENT '更新时间',
    version     INT          NOT NULL DEFAULT '0' COMMENT '版本号',
    is_deleted  tinyint      NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除'
);

CREATE TABLE t_account_roles
(
    `id`        bigint   NOT NULL AUTO_INCREMENT COMMENT '主键',
    account_id  BIGINT   NOT NULL COMMENT '账号ID',
    role_id     BIGINT   NOT NULL COMMENT '角色ID',
    tenant_id   BIGINT   NOT NULL COMMENT '租户ID',
    create_time datetime NOT NULL COMMENT '创建时间',
    update_time datetime NOT NULL COMMENT '更新时间',
    version     INT      NOT NULL DEFAULT '0' COMMENT '版本号',
    is_deleted  tinyint  NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
    PRIMARY KEY (id)
        unique key (account_id, role_id, tenant_id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '账号角色关联表 该表可实现账号角色租户多对多关联';

CREATE TABLE t_account_tenants
(
    account_id  BIGINT   NOT NULL COMMENT '账号ID',
    tenant_id   BIGINT   NOT NULL COMMENT '租户ID',
    is_primary  BOOLEAN           DEFAULT FALSE COMMENT '是否主租户',
    create_time datetime NOT NULL COMMENT '创建时间',
    update_time datetime NOT NULL COMMENT '更新时间',
    version     INT      NOT NULL DEFAULT '0' COMMENT '版本号',
    is_deleted  tinyint  NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
    PRIMARY KEY (account_id, tenant_id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '账号租户关联表 该表可实现账号租户多对多关联';

CREATE TABLE t_member
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255) NOT NULL comment '会员名称',
    level       INT          NOT NULL comment '会员等级',
    description TEXT comment '会员描述',
    create_time datetime     NOT NULL comment '创建时间',
    update_time datetime     NOT NULL comment '更新时间',
    version     INT          NOT NULL DEFAULT '0' COMMENT '版本号',
    is_deleted  tinyint      NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会员表';

CREATE TABLE `t_member_permissions`
(
    `id`            bigint   NOT NULL AUTO_INCREMENT comment '主键',
    `member_id`     bigint   NOT NULL comment '会员id',
    `permission_id` bigint   NOT NULL comment '权限id',
    `create_time`   datetime NOT NULL comment '创建时间',
    `update_time`   datetime NOT NULL comment '更新时间',
    `version`       int      NOT NULL DEFAULT '0' COMMENT '版本号',
    `is_deleted`    tinyint  NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会员权限表';

CREATE TABLE `t_member_buy_record`
(
    `id`          bigint   NOT NULL AUTO_INCREMENT comment '主键',
    `member_id`   bigint   NOT NULL comment '会员id',
    `relation_id` bigint   NOT NULL comment '租户id',
    `type`        tinyint  not null comment '购买类型 1-租户 2-个人',
    `start_time`  datetime not null comment '会员生效开始时间',
    `end_time`    datetime not null comment '会员生效结束时间',
    `create_time` datetime NOT NULL comment '创建时间',
    `update_time` datetime NOT NULL comment '更新时间',
    `version`     int      NOT NULL DEFAULT '0' COMMENT '版本号',
    `is_deleted`  tinyint  NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会员购买记录表';


CREATE TABLE t_permissions
(
    id               BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
    tenant_id        BIGINT       NOT NULL COMMENT '租户ID',
    permission_type  ENUM('FIELD', 'URL', 'ROUTE') NOT NULL COMMENT '权限类型 FIELD 字段 URL URL ROUTE 路由',
    permission_value VARCHAR(255) NOT NULL COMMENT '权限值',
    description      TEXT NULL COMMENT '描述',
    create_time      datetime     NOT NULL COMMENT '创建时间',
    update_time      datetime     NOT NULL COMMENT '更新时间',
    version          INT          NOT NULL DEFAULT '0' COMMENT '版本号',
    is_deleted       tinyint      NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '权限表';

CREATE TABLE t_profile
(
    id           INT AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
    account_id   bigint   NOT NULL comment '用户ID',
    birthday     DATE     NOT NULL comment '生日',
    gender       TINYINT  NOT NULL comment '性别',
    phone_number VARCHAR(20) null comment '电话号码',
    email        VARCHAR(100) null comment '邮箱',
    address      VARCHAR(255) null comment '地址',
    location INT null comment '地址编码',
    avatar_url   VARCHAR(255) null comment '头像',
    signature    TEXT null comment '个性签名',
    create_time  datetime NOT NULL comment '创建时间',
    update_time  datetime NOT NULL comment '更新时间',
    version      INT      NOT NULL DEFAULT '0' COMMENT '版本号',
    is_deleted   tinyint  NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='个人资料表';


CREATE TABLE `t_role_permissions`
(
    `id`            bigint   NOT NULL AUTO_INCREMENT COMMENT '主键',
    `role_id`       bigint   NOT NULL COMMENT '角色id',
    `permission_id` bigint   NOT NULL COMMENT '权限id',
    `tenant_id`     bigint   NOT NULL COMMENT '租户id',
    `create_time`   datetime NOT NULL COMMENT '创建时间',
    `update_time`   datetime NOT NULL COMMENT '更新时间',
    `version`       int      NOT NULL DEFAULT '0' COMMENT '版本号',
    `is_deleted`    tinyint  NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色权限表';


```