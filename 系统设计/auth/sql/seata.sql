-- ----------------------------
-- Chat2DB export data , export time: 2025-03-11 02:10:41
-- ----------------------------
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for table branch_table
-- ----------------------------
DROP TABLE IF EXISTS `branch_table`;
CREATE TABLE `branch_table` (
                                `branch_id` bigint NOT NULL,
                                `xid` varchar(128) COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                `transaction_id` bigint DEFAULT NULL,
                                `resource_group_id` varchar(32) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                `resource_id` varchar(256) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                `branch_type` varchar(8) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                `status` tinyint DEFAULT NULL,
                                `client_id` varchar(64) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                `application_data` varchar(2000) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                `gmt_create` datetime(6) DEFAULT NULL,
                                `gmt_modified` datetime(6) DEFAULT NULL,
                                PRIMARY KEY (`branch_id`) /*T![clustered_index] CLUSTERED */,
                                KEY `idx_xid` (`xid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of branch_table
-- ----------------------------
-- ----------------------------
-- Table structure for table distributed_lock
-- ----------------------------
DROP TABLE IF EXISTS `distributed_lock`;
CREATE TABLE `distributed_lock` (
                                    `lock_key` char(20) COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                    `lock_value` varchar(20) COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                    `expire` bigint DEFAULT NULL,
                                    PRIMARY KEY (`lock_key`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of distributed_lock
-- ----------------------------
INSERT INTO `distributed_lock` (`lock_key`,`lock_value`,`expire`)  VALUES ('AsyncCommitting',' ','0');
INSERT INTO `distributed_lock` (`lock_key`,`lock_value`,`expire`)  VALUES ('RetryCommitting',' ','0');
INSERT INTO `distributed_lock` (`lock_key`,`lock_value`,`expire`)  VALUES ('RetryRollbacking',' ','0');
INSERT INTO `distributed_lock` (`lock_key`,`lock_value`,`expire`)  VALUES ('TxTimeoutCheck',' ','0');
INSERT INTO `distributed_lock` (`lock_key`,`lock_value`,`expire`)  VALUES ('UndologDelete',' ','0');
-- ----------------------------
-- Table structure for table global_table
-- ----------------------------
DROP TABLE IF EXISTS `global_table`;
CREATE TABLE `global_table` (
                                `xid` varchar(128) COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                `transaction_id` bigint DEFAULT NULL,
                                `status` tinyint NOT NULL,
                                `application_id` varchar(32) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                `transaction_service_group` varchar(32) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                `transaction_name` varchar(128) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                `timeout` int DEFAULT NULL,
                                `begin_time` bigint DEFAULT NULL,
                                `application_data` varchar(2000) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                `gmt_create` datetime DEFAULT NULL,
                                `gmt_modified` datetime DEFAULT NULL,
                                PRIMARY KEY (`xid`) /*T![clustered_index] CLUSTERED */,
                                KEY `idx_status_gmt_modified` (`status`,`gmt_modified`),
                                KEY `idx_transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of global_table
-- ----------------------------
-- ----------------------------
-- Table structure for table lock_table
-- ----------------------------
DROP TABLE IF EXISTS `lock_table`;
CREATE TABLE `lock_table` (
                              `row_key` varchar(128) COLLATE utf8mb4_0900_ai_ci NOT NULL,
                              `xid` varchar(128) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                              `transaction_id` bigint DEFAULT NULL,
                              `branch_id` bigint NOT NULL,
                              `resource_id` varchar(256) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                              `table_name` varchar(32) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                              `pk` varchar(36) COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                              `status` tinyint NOT NULL DEFAULT '0' COMMENT '0:locked ,1:rollbacking',
                              `gmt_create` datetime DEFAULT NULL,
                              `gmt_modified` datetime DEFAULT NULL,
                              PRIMARY KEY (`row_key`) /*T![clustered_index] CLUSTERED */,
                              KEY `idx_status` (`status`),
                              KEY `idx_branch_id` (`branch_id`),
                              KEY `idx_xid` (`xid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of lock_table
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
