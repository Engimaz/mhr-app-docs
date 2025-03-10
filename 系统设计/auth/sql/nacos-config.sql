-- ----------------------------
-- Chat2DB export data , export time: 2025-03-11 02:08:42
-- ----------------------------
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for table config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
                               `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                               `data_id` varchar(255) NOT NULL COMMENT 'data_id',
                               `group_id` varchar(128) DEFAULT NULL,
                               `content` longtext NOT NULL COMMENT 'content',
                               `md5` varchar(32) DEFAULT NULL COMMENT 'md5',
                               `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                               `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                               `src_user` text DEFAULT NULL COMMENT 'source user',
                               `src_ip` varchar(50) DEFAULT NULL COMMENT 'source ip',
                               `app_name` varchar(128) DEFAULT NULL,
                               `tenant_id` varchar(128) DEFAULT '' COMMENT '租户字段',
                               `c_desc` varchar(256) DEFAULT NULL,
                               `c_use` varchar(64) DEFAULT NULL,
                               `effect` varchar(64) DEFAULT NULL,
                               `type` varchar(64) DEFAULT NULL,
                               `c_schema` text DEFAULT NULL,
                               `encrypted_data_key` text NOT NULL COMMENT '秘钥',
                               PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
                               UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=60005 COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` (`id`,`data_id`,`group_id`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`app_name`,`tenant_id`,`c_desc`,`c_use`,`effect`,`type`,`c_schema`,`encrypted_data_key`)  VALUES ('3','seataServer.properties','SEATA_GROUP','transport.type=TCP
transport.server=NIO
transport.heartbeat=true
transport.enableTmClientBatchSendRequest=false
transport.enableRmClientBatchSendRequest=true
transport.enableTcServerBatchSendResponse=false
transport.rpcRmRequestTimeout=30000
transport.rpcTmRequestTimeout=30000
transport.rpcTcRequestTimeout=30000
transport.threadFactory.bossThreadPrefix=NettyBoss
transport.threadFactory.workerThreadPrefix=NettyServerNIOWorker
transport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler
transport.threadFactory.shareBossWorker=false
transport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector
transport.threadFactory.clientSelectorThreadSize=1
transport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread
transport.threadFactory.bossThreadSize=1
transport.threadFactory.workerThreadSize=default
transport.shutdown.wait=3
transport.serialization=seata
transport.compressor=none

#Transaction routing rules configuration, only for the client
service.vgroupMapping.default_tx_group=default
#If you use a registry, you can ignore it
service.default.grouplist=127.0.0.1:8091
service.enableDegrade=false
service.disableGlobalTransaction=false

#Transaction rule configuration, only for the client
client.rm.asyncCommitBufferLimit=10000
client.rm.lock.retryInterval=10
client.rm.lock.retryTimes=30
client.rm.lock.retryPolicyBranchRollbackOnConflict=true
client.rm.reportRetryCount=5
client.rm.tableMetaCheckEnable=true
client.rm.tableMetaCheckerInterval=60000
client.rm.sqlParserType=druid
client.rm.reportSuccessEnable=false
client.rm.sagaBranchRegisterEnable=false
client.rm.sagaJsonParser=fastjson
client.rm.tccActionInterceptorOrder=-2147482648
client.tm.commitRetryCount=5
client.tm.rollbackRetryCount=5
client.tm.defaultGlobalTransactionTimeout=60000
client.tm.degradeCheck=false
client.tm.degradeCheckAllowTimes=10
client.tm.degradeCheckPeriod=2000
client.tm.interceptorOrder=-2147482648
client.undo.dataValidation=true
client.undo.logSerialization=jackson
client.undo.onlyCareUpdateColumns=true
server.undo.logSaveDays=7
server.undo.logDeletePeriod=86400000
client.undo.logTable=undo_log
client.undo.compress.enable=true
client.undo.compress.type=zip
client.undo.compress.threshold=64k
#For TCC transaction mode
tcc.fence.logTableName=tcc_fence_log
tcc.fence.cleanPeriod=1h

#Log rule configuration, for client and server
log.exceptionRate=100

#Transaction storage configuration, only for the server. The file, db, and redis configuration values are optional.
#存储模式，需要自行增加或修改
store.mode=db
store.lock.mode=db
store.session.mode=db
#Used for password encryption
store.publicKey=


store.db.datasource=druid
store.db.dbType=mysql
store.db.driverClassName=com.mysql.cj.jdbc.Driver
store.db.url=jdbc:mysql://basic-tidb.tidb.svc.cluster.local:4000/seata
store.db.user=root
store.db.password=123456
store.db.minConn=5
store.db.maxConn=30
store.db.globalTable=global_table
store.db.branchTable=branch_table
store.db.distributedLockTable=distributed_lock
store.db.queryLimit=100
store.db.lockTable=lock_table
store.db.maxWait=5000


#Transaction rule configuration, only for the server
server.recovery.committingRetryPeriod=1000
server.recovery.asynCommittingRetryPeriod=1000
server.recovery.rollbackingRetryPeriod=1000
server.recovery.timeoutRetryPeriod=1000
server.maxCommitRetryTimeout=-1
server.maxRollbackRetryTimeout=-1
server.rollbackRetryTimeoutUnlockEnable=false
server.distributedLockExpireTime=10000
server.xaerNotaRetryTimeout=60000
server.session.branchAsyncQueueSize=5000
server.session.enableBranchAsyncRemove=false
server.enableParallelRequestHandle=false

#Metrics configuration, only for the server
metrics.enabled=false
metrics.registryType=compact
metrics.exporterList=prometheus
metrics.exporterPrometheusPort=9898','26c463a808429a1062fca86df97a77d1','2025-02-20 00:58:04','2025-03-11 00:24:36','nacos','10.244.235.200','','seata','','','','properties','','');
INSERT INTO `config_info` (`id`,`data_id`,`group_id`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`app_name`,`tenant_id`,`c_desc`,`c_use`,`effect`,`type`,`c_schema`,`encrypted_data_key`)  VALUES ('4','auth-server-mysql.yml','DEFAULT_GROUP','spring:
  datasource:
    driverClassName: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://basic-tidb.tidb.svc.cluster.local:4000/auth-server
    username: root
    password: 123456

','ff253e140600608605a292334065b36b','2025-02-27 00:08:20','2025-03-11 00:57:50','nacos','10.244.235.200','','mhr-app','','','','yaml','','');
INSERT INTO `config_info` (`id`,`data_id`,`group_id`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`app_name`,`tenant_id`,`c_desc`,`c_use`,`effect`,`type`,`c_schema`,`encrypted_data_key`)  VALUES ('30005','common-redis.yml','DEFAULT_GROUP','spring:
  data:
    redis:
      password: 123456
      timeout: 5000
      host: redis-master.redis.svc.cluster.local
      port: 6379
      database: 0','7abf8a488c59547b6488c0cf21ebab0c','2025-03-11 01:01:18','2025-03-11 01:41:14','nacos','10.244.235.200','','mhr-app','','','','yaml','','');
INSERT INTO `config_info` (`id`,`data_id`,`group_id`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`app_name`,`tenant_id`,`c_desc`,`c_use`,`effect`,`type`,`c_schema`,`encrypted_data_key`)  VALUES ('30006','auth-security-client.yml','DEFAULT_GROUP','spring:
  security:
    oauth2:
      client:
        registration:
          gitee:
            provider: gitee
            redirect-uri: http://127.0.0.1:9011/login/oauth2/code/gitee
            client-id: 0a0920c2432cb50cec643a8eab150a916e7c84f8b3683637cb8762c48c624197
            client-secret: e89ef5d21cc087626d3f83d516167b7cfac1798babc1be1d044c7ab610b2aaab
            authorization-grant-type: authorization_code
            scope:
              - user_info
        provider:
          gitee:
            user-name-attribute: login
            token-uri: https://gitee.com/oauth/token
            user-info-uri: https://gitee.com/api/v5/user
            authorization-uri: https://gitee.com/oauth/authorize','616e65521df8778c7a240fae7b2f18cc','2025-03-11 01:02:21','2025-03-11 01:02:21','nacos','10.244.235.200','','mhr-app',NULL,NULL,NULL,'yaml',NULL,'');
-- ----------------------------
-- Table structure for table config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                                    `data_id` varchar(255) NOT NULL COMMENT 'data_id',
                                    `group_id` varchar(128) NOT NULL COMMENT 'group_id',
                                    `datum_id` varchar(255) NOT NULL COMMENT 'datum_id',
                                    `content` longtext NOT NULL COMMENT '内容',
                                    `gmt_modified` datetime NOT NULL COMMENT '修改时间',
                                    `app_name` varchar(128) DEFAULT NULL,
                                    `tenant_id` varchar(128) DEFAULT '' COMMENT '租户字段',
                                    PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
                                    UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------
-- ----------------------------
-- Table structure for table config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                                    `data_id` varchar(255) NOT NULL COMMENT 'data_id',
                                    `group_id` varchar(128) NOT NULL COMMENT 'group_id',
                                    `app_name` varchar(128) DEFAULT NULL COMMENT 'app_name',
                                    `content` longtext NOT NULL COMMENT 'content',
                                    `beta_ips` varchar(1024) DEFAULT NULL COMMENT 'betaIps',
                                    `md5` varchar(32) DEFAULT NULL COMMENT 'md5',
                                    `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                    `src_user` text DEFAULT NULL COMMENT 'source user',
                                    `src_ip` varchar(50) DEFAULT NULL COMMENT 'source ip',
                                    `tenant_id` varchar(128) DEFAULT '' COMMENT '租户字段',
                                    `encrypted_data_key` text NOT NULL COMMENT '秘钥',
                                    PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
                                    UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------
-- ----------------------------
-- Table structure for table config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
                                   `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                                   `data_id` varchar(255) NOT NULL COMMENT 'data_id',
                                   `group_id` varchar(128) NOT NULL COMMENT 'group_id',
                                   `tenant_id` varchar(128) DEFAULT '' COMMENT 'tenant_id',
                                   `tag_id` varchar(128) NOT NULL COMMENT 'tag_id',
                                   `app_name` varchar(128) DEFAULT NULL COMMENT 'app_name',
                                   `content` longtext NOT NULL COMMENT 'content',
                                   `md5` varchar(32) DEFAULT NULL COMMENT 'md5',
                                   `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                   `src_user` text DEFAULT NULL COMMENT 'source user',
                                   `src_ip` varchar(50) DEFAULT NULL COMMENT 'source ip',
                                   PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
                                   UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------
-- ----------------------------
-- Table structure for table config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
                                        `id` bigint NOT NULL COMMENT 'id',
                                        `tag_name` varchar(128) NOT NULL COMMENT 'tag_name',
                                        `tag_type` varchar(64) DEFAULT NULL COMMENT 'tag_type',
                                        `data_id` varchar(255) NOT NULL COMMENT 'data_id',
                                        `group_id` varchar(128) NOT NULL COMMENT 'group_id',
                                        `tenant_id` varchar(128) DEFAULT '' COMMENT 'tenant_id',
                                        `nid` bigint NOT NULL AUTO_INCREMENT,
                                        PRIMARY KEY (`nid`) /*T![clustered_index] CLUSTERED */,
                                        UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
                                        KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------
-- ----------------------------
-- Table structure for table group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
                                  `group_id` varchar(128) NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
                                  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
                                  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
                                  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
                                  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
                                  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
                                  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
                                  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
                                  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Records of group_capacity
-- ----------------------------
-- ----------------------------
-- Table structure for table his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
                                   `id` bigint unsigned NOT NULL,
                                   `nid` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `data_id` varchar(255) NOT NULL,
                                   `group_id` varchar(128) NOT NULL,
                                   `app_name` varchar(128) DEFAULT NULL COMMENT 'app_name',
                                   `content` longtext NOT NULL,
                                   `md5` varchar(32) DEFAULT NULL,
                                   `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                   `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                   `src_user` text DEFAULT NULL,
                                   `src_ip` varchar(50) DEFAULT NULL,
                                   `op_type` char(10) DEFAULT NULL,
                                   `tenant_id` varchar(128) DEFAULT '' COMMENT '租户字段',
                                   `encrypted_data_key` text NOT NULL COMMENT '秘钥',
                                   PRIMARY KEY (`nid`) /*T![clustered_index] CLUSTERED */,
                                   KEY `idx_gmt_create` (`gmt_create`),
                                   KEY `idx_gmt_modified` (`gmt_modified`),
                                   KEY `idx_did` (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=60011 COMMENT='多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('0','1','seataServer.yaml','DEFAULT_GROUP','',' store:
    # support: file 、 db 、 redis 、 raft
    mode: db
    session:
      mode: db
    lock:
      mode: db
    db:
      datasource: druid
      dbType: mysql
      driverClassName: com.mysql.cj.jdbc.Driver
      url: jdbc:mysql://mysql-primary.mysql.svc.cluster.local:3306/seata?allowPublicKeyRetrieval=true
      user: user
      password: 123456
      minConn: 10
      maxConn: 100
      globalTable: global_table
      branchTable: branch_table
      lockTable: lock_table
      distributedLockTable: distributed_lock
      queryLimit: 1000
      maxWait: 5000
    security:
      secretKey: SeataSecretKey0c382ef121d778043159209298fd40bf3850a017
      tokenValidityInMilliseconds: 1800000
      ignore:
        urls: /,/**/*.css,/**/*.js,/**/*.html,/**/*.map,/**/*.svg,/**/*.png,/**/*.jpeg,/**/*.ico,/api/v1/auth/login,/metadata/v1/**','86c828ecf0d7ac5b1e4f0f8c9448da46','2025-02-20 00:22:47','2025-02-20 00:22:48','nacos','10.244.109.127','I','seata','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('1','2','seataServer.yaml','DEFAULT_GROUP','',' store:
    # support: file 、 db 、 redis 、 raft
    mode: db
    session:
      mode: db
    lock:
      mode: db
    db:
      datasource: druid
      dbType: mysql
      driverClassName: com.mysql.cj.jdbc.Driver
      url: jdbc:mysql://mysql-primary.mysql.svc.cluster.local:3306/seata?allowPublicKeyRetrieval=true
      user: user
      password: 123456
      minConn: 10
      maxConn: 100
      globalTable: global_table
      branchTable: branch_table
      lockTable: lock_table
      distributedLockTable: distributed_lock
      queryLimit: 1000
      maxWait: 5000
    security:
      secretKey: SeataSecretKey0c382ef121d778043159209298fd40bf3850a017
      tokenValidityInMilliseconds: 1800000
      ignore:
        urls: /,/**/*.css,/**/*.js,/**/*.html,/**/*.map,/**/*.svg,/**/*.png,/**/*.jpeg,/**/*.ico,/api/v1/auth/login,/metadata/v1/**','86c828ecf0d7ac5b1e4f0f8c9448da46','2025-02-20 00:28:57','2025-02-20 00:28:58','nacos','10.244.109.127','U','seata','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('1','3','seataServer.yaml','DEFAULT_GROUP','',' store:
    # support: file 、 db 、 redis 、 raft
    mode: db
    session:
      mode: db
    lock:
      mode: db
    db:
      datasource: druid
      dbType: mysql
      driverClassName: com.mysql.cj.jdbc.Driver
      url: jdbc:mysql://mysql-primary.mysql.svc.cluster.local:3306/seata?allowPublicKeyRetrieval=true
      user: user
      password: 123456
      minConn: 10
      maxConn: 100
      globalTable: global_table
      branchTable: branch_table
      lockTable: lock_table
      distributedLockTable: distributed_lock
      queryLimit: 1000
      maxWait: 5000
    security:
      secretKey: SeataSecretKey0c382ef121d778043159209298fd40bf3850a017
      tokenValidityInMilliseconds: 1800000
      ignore:
        urls: /,/**/*.css,/**/*.js,/**/*.html,/**/*.map,/**/*.svg,/**/*.png,/**/*.jpeg,/**/*.ico,/api/v1/auth/login,/metadata/v1/**
spring:
  datasource:
    druid:
      driver-class-name: com.mysql.cj.jdbc.Driver
      url: jdbc:mysql://mysql-primary.mysql.svc.cluster.local:3306/seata?allowPublicKeyRetrieval=true
      username: user
      password: 123456
      initial-size: 5
      min-idle: 5
      max-active: 20
      max-wait: 60000
      time-between-eviction-runs-millis: 60000
      min-evictable-idle-time-millis: 300000
      validation-query: SELECT 1 FROM DUAL
      test-while-idle: true
      test-on-borrow: false
      test-on-return: false
      pool-prepared-statements: true
      max-pool-prepared-statement-per-connection-size: 20
      filters: stat,wall,log4j
      connection-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000

# Druid监控页面配置
druid:
  stat-view-servlet:
    enabled: true
    url-pattern: /druid/*
    login-username: admin
    login-password: admin
    reset-enable: false
  web-stat-filter:
    enabled: true
    url-pattern: /*
    exclusions: ''*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*''','cd66601a92a5dd98219ab444e8c657fc','2025-02-20 00:31:33','2025-02-20 00:31:33','nacos','10.244.109.127','U','seata','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('1','4','seataServer.yaml','DEFAULT_GROUP','',' store:
    # support: file 、 db 、 redis 、 raft
    mode: db
    session:
      mode: db
    lock:
      mode: db
    db:
      datasource: druid
      dbType: mysql
      driverClassName: com.mysql.cj.jdbc.Driver
      url: jdbc:mysql://mysql-primary.mysql.svc.cluster.local:3306/seata?allowPublicKeyRetrieval=true
      user: user
      password: 123456
      minConn: 10
      maxConn: 100
      globalTable: global_table
      branchTable: branch_table
      lockTable: lock_table
      distributedLockTable: distributed_lock
      queryLimit: 1000
      maxWait: 5000
    security:
      secretKey: SeataSecretKey0c382ef121d778043159209298fd40bf3850a017
      tokenValidityInMilliseconds: 1800000
      ignore:
        urls: /,/**/*.css,/**/*.js,/**/*.html,/**/*.map,/**/*.svg,/**/*.png,/**/*.jpeg,/**/*.ico,/api/v1/auth/login,/metadata/v1/**
','d72b1c9037b80fd29f8162aec43610b0','2025-02-20 00:40:24','2025-02-20 00:40:25','nacos','10.244.109.127','U','seata','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('1','5','seataServer.yaml','DEFAULT_GROUP','',' store:
    # support: file 、 db 、 redis 、 raft
    mode: db
    session:
      mode: db
    lock:
      mode: db
    db:
      datasource: druid
      dbType: mysql
      driverClassName: com.mysql.cj.jdbc.Driver
      url: jdbc:mysql://mysql-primary.mysql.svc.cluster.local:3306/seata?allowPublicKeyRetrieval=true
      user: user
      password: 123456
      minConn: 10
      maxConn: 100
      globalTable: global_table
      branchTable: branch_table
      lockTable: lock_table
      distributedLockTable: distributed_lock
      queryLimit: 1000
      maxWait: 5000
    security:
      secretKey: SeataSecretKey0c382ef121d778043159209298fd40bf3850a017
      tokenValidityInMilliseconds: 1800000
      ignore:
        urls: /,/**/*.css,/**/*.js,/**/*.html,/**/*.map,/**/*.svg,/**/*.png,/**/*.jpeg,/**/*.ico,/api/v1/auth/login,/metadata/v1/**
','d72b1c9037b80fd29f8162aec43610b0','2025-02-20 00:42:46','2025-02-20 00:42:47','nacos','10.244.109.127','U','seata','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('0','6','seataServer.properties','DEFAULT_GROUP','','transport.type=TCP
transport.server=NIO
transport.heartbeat=true
transport.enableTmClientBatchSendRequest=false
transport.enableRmClientBatchSendRequest=true
transport.enableTcServerBatchSendResponse=false
transport.rpcRmRequestTimeout=30000
transport.rpcTmRequestTimeout=30000
transport.rpcTcRequestTimeout=30000
transport.threadFactory.bossThreadPrefix=NettyBoss
transport.threadFactory.workerThreadPrefix=NettyServerNIOWorker
transport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler
transport.threadFactory.shareBossWorker=false
transport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector
transport.threadFactory.clientSelectorThreadSize=1
transport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread
transport.threadFactory.bossThreadSize=1
transport.threadFactory.workerThreadSize=default
transport.shutdown.wait=3
transport.serialization=seata
transport.compressor=none

#Transaction routing rules configuration, only for the client
service.vgroupMapping.default_tx_group=default
#If you use a registry, you can ignore it
service.default.grouplist=127.0.0.1:8091
service.enableDegrade=false
service.disableGlobalTransaction=false

#Transaction rule configuration, only for the client
client.rm.asyncCommitBufferLimit=10000
client.rm.lock.retryInterval=10
client.rm.lock.retryTimes=30
client.rm.lock.retryPolicyBranchRollbackOnConflict=true
client.rm.reportRetryCount=5
client.rm.tableMetaCheckEnable=true
client.rm.tableMetaCheckerInterval=60000
client.rm.sqlParserType=druid
client.rm.reportSuccessEnable=false
client.rm.sagaBranchRegisterEnable=false
client.rm.sagaJsonParser=fastjson
client.rm.tccActionInterceptorOrder=-2147482648
client.tm.commitRetryCount=5
client.tm.rollbackRetryCount=5
client.tm.defaultGlobalTransactionTimeout=60000
client.tm.degradeCheck=false
client.tm.degradeCheckAllowTimes=10
client.tm.degradeCheckPeriod=2000
client.tm.interceptorOrder=-2147482648
client.undo.dataValidation=true
client.undo.logSerialization=jackson
client.undo.onlyCareUpdateColumns=true
server.undo.logSaveDays=7
server.undo.logDeletePeriod=86400000
client.undo.logTable=undo_log
client.undo.compress.enable=true
client.undo.compress.type=zip
client.undo.compress.threshold=64k
#For TCC transaction mode
tcc.fence.logTableName=tcc_fence_log
tcc.fence.cleanPeriod=1h

#Log rule configuration, for client and server
log.exceptionRate=100

#Transaction storage configuration, only for the server. The file, db, and redis configuration values are optional.
#存储模式，需要自行增加或修改
store.mode=db
store.lock.mode=db
store.session.mode=db
#Used for password encryption
store.publicKey=


store.db.datasource=druid
store.db.dbType=mysql
store.db.driverClassName=com.mysql.cj.jdbc.Driver
store.db.url=jdbc:mysql://mysql-primary.mysql.svc.cluster.local:3306/seata?allowPublicKeyRetrieval=true
store.db.user=user
store.db.password=123456
store.db.minConn=5
store.db.maxConn=30
store.db.globalTable=global_table
store.db.branchTable=branch_table
store.db.distributedLockTable=distributed_lock
store.db.queryLimit=100
store.db.lockTable=lock_table
store.db.maxWait=5000


#Transaction rule configuration, only for the server
server.recovery.committingRetryPeriod=1000
server.recovery.asynCommittingRetryPeriod=1000
server.recovery.rollbackingRetryPeriod=1000
server.recovery.timeoutRetryPeriod=1000
server.maxCommitRetryTimeout=-1
server.maxRollbackRetryTimeout=-1
server.rollbackRetryTimeoutUnlockEnable=false
server.distributedLockExpireTime=10000
server.xaerNotaRetryTimeout=60000
server.session.branchAsyncQueueSize=5000
server.session.enableBranchAsyncRemove=false
server.enableParallelRequestHandle=false

#Metrics configuration, only for the server
metrics.enabled=false
metrics.registryType=compact
metrics.exporterList=prometheus
metrics.exporterPrometheusPort=9898','60c39443d095048fbcb163b2c61ec990','2025-02-20 00:50:32','2025-02-20 00:50:33','nacos','10.244.109.127','I','seata','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('1','7','seataServer.yaml','DEFAULT_GROUP','',' store:
    # support: file 、 db 、 redis 、 raft
    mode: db
    session:
      mode: db
    lock:
      mode: db
    db:
      datasource: druid
      dbType: mysql
      driverClassName: com.mysql.cj.jdbc.Driver
      url: jdbc:mysql://mysql-primary.mysql.svc.cluster.local:3306/seata?allowPublicKeyRetrieval=true
      user: user
      password: "123456"
      minConn: 10
      maxConn: 100
      globalTable: global_table
      branchTable: branch_table
      lockTable: lock_table
      distributedLockTable: distributed_lock
      queryLimit: 1000
      maxWait: 5000
    security:
      secretKey: SeataSecretKey0c382ef121d778043159209298fd40bf3850a017
      tokenValidityInMilliseconds: 1800000
      ignore:
        urls: /,/**/*.css,/**/*.js,/**/*.html,/**/*.map,/**/*.svg,/**/*.png,/**/*.jpeg,/**/*.ico,/api/v1/auth/login,/metadata/v1/**
','1ab6df0cecc3283065834be6cff44f7d','2025-02-20 00:51:24','2025-02-20 00:51:24','nacos','10.244.109.127','D','seata','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('0','8','seataServer.properties','SEATA_GROUP','','transport.type=TCP
transport.server=NIO
transport.heartbeat=true
transport.enableTmClientBatchSendRequest=false
transport.enableRmClientBatchSendRequest=true
transport.enableTcServerBatchSendResponse=false
transport.rpcRmRequestTimeout=30000
transport.rpcTmRequestTimeout=30000
transport.rpcTcRequestTimeout=30000
transport.threadFactory.bossThreadPrefix=NettyBoss
transport.threadFactory.workerThreadPrefix=NettyServerNIOWorker
transport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler
transport.threadFactory.shareBossWorker=false
transport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector
transport.threadFactory.clientSelectorThreadSize=1
transport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread
transport.threadFactory.bossThreadSize=1
transport.threadFactory.workerThreadSize=default
transport.shutdown.wait=3
transport.serialization=seata
transport.compressor=none

#Transaction routing rules configuration, only for the client
service.vgroupMapping.default_tx_group=default
#If you use a registry, you can ignore it
service.default.grouplist=127.0.0.1:8091
service.enableDegrade=false
service.disableGlobalTransaction=false

#Transaction rule configuration, only for the client
client.rm.asyncCommitBufferLimit=10000
client.rm.lock.retryInterval=10
client.rm.lock.retryTimes=30
client.rm.lock.retryPolicyBranchRollbackOnConflict=true
client.rm.reportRetryCount=5
client.rm.tableMetaCheckEnable=true
client.rm.tableMetaCheckerInterval=60000
client.rm.sqlParserType=druid
client.rm.reportSuccessEnable=false
client.rm.sagaBranchRegisterEnable=false
client.rm.sagaJsonParser=fastjson
client.rm.tccActionInterceptorOrder=-2147482648
client.tm.commitRetryCount=5
client.tm.rollbackRetryCount=5
client.tm.defaultGlobalTransactionTimeout=60000
client.tm.degradeCheck=false
client.tm.degradeCheckAllowTimes=10
client.tm.degradeCheckPeriod=2000
client.tm.interceptorOrder=-2147482648
client.undo.dataValidation=true
client.undo.logSerialization=jackson
client.undo.onlyCareUpdateColumns=true
server.undo.logSaveDays=7
server.undo.logDeletePeriod=86400000
client.undo.logTable=undo_log
client.undo.compress.enable=true
client.undo.compress.type=zip
client.undo.compress.threshold=64k
#For TCC transaction mode
tcc.fence.logTableName=tcc_fence_log
tcc.fence.cleanPeriod=1h

#Log rule configuration, for client and server
log.exceptionRate=100

#Transaction storage configuration, only for the server. The file, db, and redis configuration values are optional.
#存储模式，需要自行增加或修改
store.mode=db
store.lock.mode=db
store.session.mode=db
#Used for password encryption
store.publicKey=


store.db.datasource=druid
store.db.dbType=mysql
store.db.driverClassName=com.mysql.cj.jdbc.Driver
store.db.url=jdbc:mysql://mysql-primary.mysql.svc.cluster.local:3306/seata?allowPublicKeyRetrieval=true
store.db.user=user
store.db.password=123456
store.db.minConn=5
store.db.maxConn=30
store.db.globalTable=global_table
store.db.branchTable=branch_table
store.db.distributedLockTable=distributed_lock
store.db.queryLimit=100
store.db.lockTable=lock_table
store.db.maxWait=5000


#Transaction rule configuration, only for the server
server.recovery.committingRetryPeriod=1000
server.recovery.asynCommittingRetryPeriod=1000
server.recovery.rollbackingRetryPeriod=1000
server.recovery.timeoutRetryPeriod=1000
server.maxCommitRetryTimeout=-1
server.maxRollbackRetryTimeout=-1
server.rollbackRetryTimeoutUnlockEnable=false
server.distributedLockExpireTime=10000
server.xaerNotaRetryTimeout=60000
server.session.branchAsyncQueueSize=5000
server.session.enableBranchAsyncRemove=false
server.enableParallelRequestHandle=false

#Metrics configuration, only for the server
metrics.enabled=false
metrics.registryType=compact
metrics.exporterList=prometheus
metrics.exporterPrometheusPort=9898','60c39443d095048fbcb163b2c61ec990','2025-02-20 00:58:03','2025-02-20 00:58:04','nacos','10.244.109.127','I','seata','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('2','9','seataServer.properties','DEFAULT_GROUP','','transport.type=TCP
transport.server=NIO
transport.heartbeat=true
transport.enableTmClientBatchSendRequest=false
transport.enableRmClientBatchSendRequest=true
transport.enableTcServerBatchSendResponse=false
transport.rpcRmRequestTimeout=30000
transport.rpcTmRequestTimeout=30000
transport.rpcTcRequestTimeout=30000
transport.threadFactory.bossThreadPrefix=NettyBoss
transport.threadFactory.workerThreadPrefix=NettyServerNIOWorker
transport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler
transport.threadFactory.shareBossWorker=false
transport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector
transport.threadFactory.clientSelectorThreadSize=1
transport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread
transport.threadFactory.bossThreadSize=1
transport.threadFactory.workerThreadSize=default
transport.shutdown.wait=3
transport.serialization=seata
transport.compressor=none

#Transaction routing rules configuration, only for the client
service.vgroupMapping.default_tx_group=default
#If you use a registry, you can ignore it
service.default.grouplist=127.0.0.1:8091
service.enableDegrade=false
service.disableGlobalTransaction=false

#Transaction rule configuration, only for the client
client.rm.asyncCommitBufferLimit=10000
client.rm.lock.retryInterval=10
client.rm.lock.retryTimes=30
client.rm.lock.retryPolicyBranchRollbackOnConflict=true
client.rm.reportRetryCount=5
client.rm.tableMetaCheckEnable=true
client.rm.tableMetaCheckerInterval=60000
client.rm.sqlParserType=druid
client.rm.reportSuccessEnable=false
client.rm.sagaBranchRegisterEnable=false
client.rm.sagaJsonParser=fastjson
client.rm.tccActionInterceptorOrder=-2147482648
client.tm.commitRetryCount=5
client.tm.rollbackRetryCount=5
client.tm.defaultGlobalTransactionTimeout=60000
client.tm.degradeCheck=false
client.tm.degradeCheckAllowTimes=10
client.tm.degradeCheckPeriod=2000
client.tm.interceptorOrder=-2147482648
client.undo.dataValidation=true
client.undo.logSerialization=jackson
client.undo.onlyCareUpdateColumns=true
server.undo.logSaveDays=7
server.undo.logDeletePeriod=86400000
client.undo.logTable=undo_log
client.undo.compress.enable=true
client.undo.compress.type=zip
client.undo.compress.threshold=64k
#For TCC transaction mode
tcc.fence.logTableName=tcc_fence_log
tcc.fence.cleanPeriod=1h

#Log rule configuration, for client and server
log.exceptionRate=100

#Transaction storage configuration, only for the server. The file, db, and redis configuration values are optional.
#存储模式，需要自行增加或修改
store.mode=db
store.lock.mode=db
store.session.mode=db
#Used for password encryption
store.publicKey=


store.db.datasource=druid
store.db.dbType=mysql
store.db.driverClassName=com.mysql.cj.jdbc.Driver
store.db.url=jdbc:mysql://mysql-primary.mysql.svc.cluster.local:3306/seata?allowPublicKeyRetrieval=true
store.db.user=user
store.db.password=123456
store.db.minConn=5
store.db.maxConn=30
store.db.globalTable=global_table
store.db.branchTable=branch_table
store.db.distributedLockTable=distributed_lock
store.db.queryLimit=100
store.db.lockTable=lock_table
store.db.maxWait=5000


#Transaction rule configuration, only for the server
server.recovery.committingRetryPeriod=1000
server.recovery.asynCommittingRetryPeriod=1000
server.recovery.rollbackingRetryPeriod=1000
server.recovery.timeoutRetryPeriod=1000
server.maxCommitRetryTimeout=-1
server.maxRollbackRetryTimeout=-1
server.rollbackRetryTimeoutUnlockEnable=false
server.distributedLockExpireTime=10000
server.xaerNotaRetryTimeout=60000
server.session.branchAsyncQueueSize=5000
server.session.enableBranchAsyncRemove=false
server.enableParallelRequestHandle=false

#Metrics configuration, only for the server
metrics.enabled=false
metrics.registryType=compact
metrics.exporterList=prometheus
metrics.exporterPrometheusPort=9898','60c39443d095048fbcb163b2c61ec990','2025-02-20 00:58:07','2025-02-20 00:58:07','nacos','10.244.109.127','D','seata','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('0','10','auth-server-mysql.yml','DEFAULT_GROUP','','mybatis-flex:
  datasource:
    master:
      url: jdbc:mysql://mysql-primary.mysql.svc.cluster.local:3306/auth-server
      username: root
      password: 123456
    slave1:
      url: jdbc:mysql://mysql-secondary.mysql.svc.cluster.local:3306/auth-server
      username: root
      password: 123456
','ca27590b1842ec5e2e10ff40d652e6fc','2025-02-27 00:08:19','2025-02-27 00:08:20','nacos','10.244.109.86','I','mhr-app','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('3','30011','seataServer.properties','SEATA_GROUP','','transport.type=TCP
transport.server=NIO
transport.heartbeat=true
transport.enableTmClientBatchSendRequest=false
transport.enableRmClientBatchSendRequest=true
transport.enableTcServerBatchSendResponse=false
transport.rpcRmRequestTimeout=30000
transport.rpcTmRequestTimeout=30000
transport.rpcTcRequestTimeout=30000
transport.threadFactory.bossThreadPrefix=NettyBoss
transport.threadFactory.workerThreadPrefix=NettyServerNIOWorker
transport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler
transport.threadFactory.shareBossWorker=false
transport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector
transport.threadFactory.clientSelectorThreadSize=1
transport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread
transport.threadFactory.bossThreadSize=1
transport.threadFactory.workerThreadSize=default
transport.shutdown.wait=3
transport.serialization=seata
transport.compressor=none

#Transaction routing rules configuration, only for the client
service.vgroupMapping.default_tx_group=default
#If you use a registry, you can ignore it
service.default.grouplist=127.0.0.1:8091
service.enableDegrade=false
service.disableGlobalTransaction=false

#Transaction rule configuration, only for the client
client.rm.asyncCommitBufferLimit=10000
client.rm.lock.retryInterval=10
client.rm.lock.retryTimes=30
client.rm.lock.retryPolicyBranchRollbackOnConflict=true
client.rm.reportRetryCount=5
client.rm.tableMetaCheckEnable=true
client.rm.tableMetaCheckerInterval=60000
client.rm.sqlParserType=druid
client.rm.reportSuccessEnable=false
client.rm.sagaBranchRegisterEnable=false
client.rm.sagaJsonParser=fastjson
client.rm.tccActionInterceptorOrder=-2147482648
client.tm.commitRetryCount=5
client.tm.rollbackRetryCount=5
client.tm.defaultGlobalTransactionTimeout=60000
client.tm.degradeCheck=false
client.tm.degradeCheckAllowTimes=10
client.tm.degradeCheckPeriod=2000
client.tm.interceptorOrder=-2147482648
client.undo.dataValidation=true
client.undo.logSerialization=jackson
client.undo.onlyCareUpdateColumns=true
server.undo.logSaveDays=7
server.undo.logDeletePeriod=86400000
client.undo.logTable=undo_log
client.undo.compress.enable=true
client.undo.compress.type=zip
client.undo.compress.threshold=64k
#For TCC transaction mode
tcc.fence.logTableName=tcc_fence_log
tcc.fence.cleanPeriod=1h

#Log rule configuration, for client and server
log.exceptionRate=100

#Transaction storage configuration, only for the server. The file, db, and redis configuration values are optional.
#存储模式，需要自行增加或修改
store.mode=db
store.lock.mode=db
store.session.mode=db
#Used for password encryption
store.publicKey=


store.db.datasource=druid
store.db.dbType=mysql
store.db.driverClassName=com.mysql.cj.jdbc.Driver
store.db.url=jdbc:mysql://mysql-primary.mysql.svc.cluster.local:3306/seata?allowPublicKeyRetrieval=true
store.db.user=user
store.db.password=123456
store.db.minConn=5
store.db.maxConn=30
store.db.globalTable=global_table
store.db.branchTable=branch_table
store.db.distributedLockTable=distributed_lock
store.db.queryLimit=100
store.db.lockTable=lock_table
store.db.maxWait=5000


#Transaction rule configuration, only for the server
server.recovery.committingRetryPeriod=1000
server.recovery.asynCommittingRetryPeriod=1000
server.recovery.rollbackingRetryPeriod=1000
server.recovery.timeoutRetryPeriod=1000
server.maxCommitRetryTimeout=-1
server.maxRollbackRetryTimeout=-1
server.rollbackRetryTimeoutUnlockEnable=false
server.distributedLockExpireTime=10000
server.xaerNotaRetryTimeout=60000
server.session.branchAsyncQueueSize=5000
server.session.enableBranchAsyncRemove=false
server.enableParallelRequestHandle=false

#Metrics configuration, only for the server
metrics.enabled=false
metrics.registryType=compact
metrics.exporterList=prometheus
metrics.exporterPrometheusPort=9898','60c39443d095048fbcb163b2c61ec990','2025-03-10 16:20:28','2025-03-11 00:20:28','nacos','10.244.235.200','U','seata','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('3','30012','seataServer.properties','SEATA_GROUP','','transport.type=TCP
transport.server=NIO
transport.heartbeat=true
transport.enableTmClientBatchSendRequest=false
transport.enableRmClientBatchSendRequest=true
transport.enableTcServerBatchSendResponse=false
transport.rpcRmRequestTimeout=30000
transport.rpcTmRequestTimeout=30000
transport.rpcTcRequestTimeout=30000
transport.threadFactory.bossThreadPrefix=NettyBoss
transport.threadFactory.workerThreadPrefix=NettyServerNIOWorker
transport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler
transport.threadFactory.shareBossWorker=false
transport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector
transport.threadFactory.clientSelectorThreadSize=1
transport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread
transport.threadFactory.bossThreadSize=1
transport.threadFactory.workerThreadSize=default
transport.shutdown.wait=3
transport.serialization=seata
transport.compressor=none

#Transaction routing rules configuration, only for the client
service.vgroupMapping.default_tx_group=default
#If you use a registry, you can ignore it
service.default.grouplist=127.0.0.1:8091
service.enableDegrade=false
service.disableGlobalTransaction=false

#Transaction rule configuration, only for the client
client.rm.asyncCommitBufferLimit=10000
client.rm.lock.retryInterval=10
client.rm.lock.retryTimes=30
client.rm.lock.retryPolicyBranchRollbackOnConflict=true
client.rm.reportRetryCount=5
client.rm.tableMetaCheckEnable=true
client.rm.tableMetaCheckerInterval=60000
client.rm.sqlParserType=druid
client.rm.reportSuccessEnable=false
client.rm.sagaBranchRegisterEnable=false
client.rm.sagaJsonParser=fastjson
client.rm.tccActionInterceptorOrder=-2147482648
client.tm.commitRetryCount=5
client.tm.rollbackRetryCount=5
client.tm.defaultGlobalTransactionTimeout=60000
client.tm.degradeCheck=false
client.tm.degradeCheckAllowTimes=10
client.tm.degradeCheckPeriod=2000
client.tm.interceptorOrder=-2147482648
client.undo.dataValidation=true
client.undo.logSerialization=jackson
client.undo.onlyCareUpdateColumns=true
server.undo.logSaveDays=7
server.undo.logDeletePeriod=86400000
client.undo.logTable=undo_log
client.undo.compress.enable=true
client.undo.compress.type=zip
client.undo.compress.threshold=64k
#For TCC transaction mode
tcc.fence.logTableName=tcc_fence_log
tcc.fence.cleanPeriod=1h

#Log rule configuration, for client and server
log.exceptionRate=100

#Transaction storage configuration, only for the server. The file, db, and redis configuration values are optional.
#存储模式，需要自行增加或修改
store.mode=db
store.lock.mode=db
store.session.mode=db
#Used for password encryption
store.publicKey=


store.db.datasource=druid
store.db.dbType=mysql
store.db.driverClassName=com.mysql.cj.jdbc.Driver
store.db.url=jdbc:mysql://basic-tidb.tidb.svc.cluster.local:4000/seata
store.db.user=user
store.db.password=123456
store.db.minConn=5
store.db.maxConn=30
store.db.globalTable=global_table
store.db.branchTable=branch_table
store.db.distributedLockTable=distributed_lock
store.db.queryLimit=100
store.db.lockTable=lock_table
store.db.maxWait=5000


#Transaction rule configuration, only for the server
server.recovery.committingRetryPeriod=1000
server.recovery.asynCommittingRetryPeriod=1000
server.recovery.rollbackingRetryPeriod=1000
server.recovery.timeoutRetryPeriod=1000
server.maxCommitRetryTimeout=-1
server.maxRollbackRetryTimeout=-1
server.rollbackRetryTimeoutUnlockEnable=false
server.distributedLockExpireTime=10000
server.xaerNotaRetryTimeout=60000
server.session.branchAsyncQueueSize=5000
server.session.enableBranchAsyncRemove=false
server.enableParallelRequestHandle=false

#Metrics configuration, only for the server
metrics.enabled=false
metrics.registryType=compact
metrics.exporterList=prometheus
metrics.exporterPrometheusPort=9898','388df88046564aeef90f0b461f672daf','2025-03-10 16:24:35','2025-03-11 00:24:36','nacos','10.244.235.200','U','seata','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('4','30013','auth-server-mysql.yml','DEFAULT_GROUP','','mybatis-flex:
  datasource:
    master:
      url: jdbc:mysql://mysql-primary.mysql.svc.cluster.local:3306/auth-server
      username: root
      password: 123456
    slave1:
      url: jdbc:mysql://mysql-secondary.mysql.svc.cluster.local:3306/auth-server
      username: root
      password: 123456
','ca27590b1842ec5e2e10ff40d652e6fc','2025-03-10 16:55:55','2025-03-11 00:55:55','nacos','10.244.235.200','U','mhr-app','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('4','30014','auth-server-mysql.yml','DEFAULT_GROUP','','spring:
  datasource:
    master:
      url: jdbc:mysql://basic-tidb.tidb.svc.cluster.local:4000/auth-server
      username: root
      password: 123456

','70234b7e04215662491e133a1ce158e8','2025-03-10 16:57:49','2025-03-11 00:57:50','nacos','10.244.235.200','U','mhr-app','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('0','30015','common-redis.yml','DEFAULT_GROUP','','spring:
  redis:
    # 主节点配置（用于写操作）
    master:
      host: redis-master.redis.svc.cluster.local
      port: 6379
      password: 123456
    # 从节点配置（用于读操作）
    replicas:
      host: redis-replicas.redis.svc.cluster.local
      port: 6379
      password: 123456
    # 连接池配置
    pool:
      max-active: 100
      max-wait: 2000
      max-idle: 500
      min-idle: 0
    # 集群配置（如果有）
    cluster:
      expire-seconds: 120
      command-timeout: 5000','aa338e3da0ae1cfc2b2056848f7235c7','2025-03-10 17:01:18','2025-03-11 01:01:18','nacos','10.244.235.200','I','mhr-app','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('0','30016','auth-security-client.yml','DEFAULT_GROUP','','spring:
  security:
    oauth2:
      client:
        registration:
          gitee:
            provider: gitee
            redirect-uri: http://127.0.0.1:9011/login/oauth2/code/gitee
            client-id: 0a0920c2432cb50cec643a8eab150a916e7c84f8b3683637cb8762c48c624197
            client-secret: e89ef5d21cc087626d3f83d516167b7cfac1798babc1be1d044c7ab610b2aaab
            authorization-grant-type: authorization_code
            scope:
              - user_info
        provider:
          gitee:
            user-name-attribute: login
            token-uri: https://gitee.com/oauth/token
            user-info-uri: https://gitee.com/api/v5/user
            authorization-uri: https://gitee.com/oauth/authorize','616e65521df8778c7a240fae7b2f18cc','2025-03-10 17:02:21','2025-03-11 01:02:21','nacos','10.244.235.200','I','mhr-app','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('30005','30017','common-redis.yml','DEFAULT_GROUP','','spring:
  redis:
    # 主节点配置（用于写操作）
    master:
      host: redis-master.redis.svc.cluster.local
      port: 6379
      password: 123456
    # 从节点配置（用于读操作）
    replicas:
      host: redis-replicas.redis.svc.cluster.local
      port: 6379
      password: 123456
    # 连接池配置
    pool:
      max-active: 100
      max-wait: 2000
      max-idle: 500
      min-idle: 0
    # 集群配置（如果有）
    cluster:
      expire-seconds: 120
      command-timeout: 5000','aa338e3da0ae1cfc2b2056848f7235c7','2025-03-10 17:29:41','2025-03-11 01:29:41','nacos','10.244.235.200','U','mhr-app','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('30005','30018','common-redis.yml','DEFAULT_GROUP','','spring:
  data:
    redis:
      cluster:
        nodes: redis-master.redis.svc.cluster.local:6379,redis-replicas.redis.svc.cluster.local:6379
        max-redirects: 3','f1957e59847eec79cf624ea066dd86df','2025-03-10 17:34:05','2025-03-11 01:34:06','nacos','10.244.235.200','U','mhr-app','');
INSERT INTO `his_config_info` (`id`,`nid`,`data_id`,`group_id`,`app_name`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`op_type`,`tenant_id`,`encrypted_data_key`)  VALUES ('30005','30019','common-redis.yml','DEFAULT_GROUP','','spring:
  data:
    redis:
      password: 123456
      cluster:
        nodes: redis-master.redis.svc.cluster.local:6379,redis-replicas.redis.svc.cluster.local:6379
        max-redirects: 3','b376b47335b65511e89a0c2fa73f9e1f','2025-03-10 17:41:14','2025-03-11 01:41:14','nacos','10.244.235.200','U','mhr-app','');
-- ----------------------------
-- Table structure for table permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
                               `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `resource` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `action` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
                               UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
-- ----------------------------
-- Table structure for table roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
                         `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                         UNIQUE KEY `idx_user_role` (`username`,`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` (`username`,`role`)  VALUES ('nacos','ROLE_ADMIN');
-- ----------------------------
-- Table structure for table tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
                                   `tenant_id` varchar(128) NOT NULL DEFAULT '' COMMENT 'Tenant ID',
                                   `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
                                   `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
                                   `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
                                   `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
                                   `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
                                   `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
                                   `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                   PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
                                   UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------
-- ----------------------------
-- Table structure for table tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
                               `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                               `kp` varchar(128) NOT NULL COMMENT 'kp',
                               `tenant_id` varchar(128) DEFAULT '' COMMENT 'tenant_id',
                               `tenant_name` varchar(128) DEFAULT '' COMMENT 'tenant_name',
                               `tenant_desc` varchar(256) DEFAULT NULL COMMENT 'tenant_desc',
                               `create_source` varchar(32) DEFAULT NULL COMMENT 'create_source',
                               `gmt_create` bigint NOT NULL COMMENT '创建时间',
                               `gmt_modified` bigint NOT NULL COMMENT '修改时间',
                               PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
                               UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
                               KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=30002 COMMENT='tenant_info';

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` (`id`,`kp`,`tenant_id`,`tenant_name`,`tenant_desc`,`create_source`,`gmt_create`,`gmt_modified`)  VALUES ('1','1','seata','seata','seata','nacos','1739982129183','1739982129183');
INSERT INTO `tenant_info` (`id`,`kp`,`tenant_id`,`tenant_name`,`tenant_desc`,`create_source`,`gmt_create`,`gmt_modified`)  VALUES ('2','1','mhr-app','mhr-app','mhr-app','nacos','1740585467807','1740585467807');
-- ----------------------------
-- Table structure for table users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
                         `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `password` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `enabled` tinyint(1) NOT NULL,
                         PRIMARY KEY (`username`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` (`username`,`password`,`enabled`)  VALUES ('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);
SET FOREIGN_KEY_CHECKS=1;
