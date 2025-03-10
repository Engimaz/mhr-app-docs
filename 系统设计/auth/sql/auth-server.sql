-- ----------------------------
-- Chat2DB export data , export time: 2025-03-11 02:10:09
-- ----------------------------
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for table oauth2_authorization
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_authorization`;
CREATE TABLE `oauth2_authorization` (
                                        `id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
                                        `registered_client_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
                                        `principal_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
                                        `authorization_grant_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
                                        `authorized_scopes` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                        `attributes` blob DEFAULT NULL,
                                        `state` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                        `authorization_code_value` blob DEFAULT NULL,
                                        `authorization_code_issued_at` timestamp NULL DEFAULT NULL,
                                        `authorization_code_expires_at` timestamp NULL DEFAULT NULL,
                                        `authorization_code_metadata` blob DEFAULT NULL,
                                        `access_token_value` blob DEFAULT NULL,
                                        `access_token_issued_at` timestamp NULL DEFAULT NULL,
                                        `access_token_expires_at` timestamp NULL DEFAULT NULL,
                                        `access_token_metadata` blob DEFAULT NULL,
                                        `access_token_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                        `access_token_scopes` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                        `oidc_id_token_value` blob DEFAULT NULL,
                                        `oidc_id_token_issued_at` timestamp NULL DEFAULT NULL,
                                        `oidc_id_token_expires_at` timestamp NULL DEFAULT NULL,
                                        `oidc_id_token_metadata` blob DEFAULT NULL,
                                        `refresh_token_value` blob DEFAULT NULL,
                                        `refresh_token_issued_at` timestamp NULL DEFAULT NULL,
                                        `refresh_token_expires_at` timestamp NULL DEFAULT NULL,
                                        `refresh_token_metadata` blob DEFAULT NULL,
                                        `user_code_value` blob DEFAULT NULL,
                                        `user_code_issued_at` timestamp NULL DEFAULT NULL,
                                        `user_code_expires_at` timestamp NULL DEFAULT NULL,
                                        `user_code_metadata` blob DEFAULT NULL,
                                        `device_code_value` blob DEFAULT NULL,
                                        `device_code_issued_at` timestamp NULL DEFAULT NULL,
                                        `device_code_expires_at` timestamp NULL DEFAULT NULL,
                                        `device_code_metadata` blob DEFAULT NULL,
                                        PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of oauth2_authorization
-- ----------------------------
INSERT INTO `oauth2_authorization` (`id`,`registered_client_id`,`principal_name`,`authorization_grant_type`,`authorized_scopes`,`attributes`,`state`,`authorization_code_value`,`authorization_code_issued_at`,`authorization_code_expires_at`,`authorization_code_metadata`,`access_token_value`,`access_token_issued_at`,`access_token_expires_at`,`access_token_metadata`,`access_token_type`,`access_token_scopes`,`oidc_id_token_value`,`oidc_id_token_issued_at`,`oidc_id_token_expires_at`,`oidc_id_token_metadata`,`refresh_token_value`,`refresh_token_issued_at`,`refresh_token_expires_at`,`refresh_token_metadata`,`user_code_value`,`user_code_issued_at`,`user_code_expires_at`,`user_code_metadata`,`device_code_value`,`device_code_issued_at`,`device_code_expires_at`,`device_code_metadata`)  VALUES ('6315792f-a20c-41cb-8fe6-dbc8255a4596','client-id','account','authorization_code','offline_access',0x7B2240636C617373223A226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170222C226F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F72652E656E64706F696E742E4F4175746832417574686F72697A6174696F6E52657175657374223A7B2240636C617373223A226F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F72652E656E64706F696E742E4F4175746832417574686F72697A6174696F6E52657175657374222C22617574686F72697A6174696F6E557269223A22687474703A2F2F3139322E3136382E332E353A393031322F6F61757468322F617574686F72697A65222C22617574686F72697A6174696F6E4772616E7454797065223A7B2276616C7565223A22617574686F72697A6174696F6E5F636F6465227D2C22726573706F6E736554797065223A7B2276616C7565223A22636F6465227D2C22636C69656E744964223A22636C69656E742D6964222C227265646972656374557269223A22687474703A2F2F3132372E302E302E313A333030302F696E646578222C2273636F706573223A5B226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574222C5B226F66666C696E655F616363657373225D5D2C227374617465223A6E756C6C2C226164646974696F6E616C506172616D6574657273223A7B2240636C617373223A226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170222C22636F64655F6368616C6C656E6765223A2264636D3236564774427455325331575270446F73726A357557767442537662444F66365059627062493673222C22636F64655F6368616C6C656E67655F6D6574686F64223A2253323536227D2C22617574686F72697A6174696F6E52657175657374557269223A22687474703A2F2F3139322E3136382E332E353A393031322F6F61757468322F617574686F72697A653F726573706F6E73655F747970653D636F646526636C69656E745F69643D636C69656E742D69642673636F70653D6F66666C696E655F6163636573732672656469726563745F7572693D687474703A2F2F3132372E302E302E313A333030302F696E64657826636F64655F6368616C6C656E67653D64636D3236564774427455325331575270446F73726A357557767442537662444F6636505962706249367326636F64655F6368616C6C656E67655F6D6574686F643D53323536222C2261747472696275746573223A7B2240636C617373223A226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170227D7D2C226A6176612E73656375726974792E5072696E636970616C223A7B2240636C617373223A226F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E222C22617574686F726974696573223A5B226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C6552616E646F6D4163636573734C697374222C5B5D5D2C2264657461696C73223A7B2240636C617373223A226F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E57656241757468656E7469636174696F6E44657461696C73222C2272656D6F746541646472657373223A223139322E3136382E332E35222C2273657373696F6E4964223A6E756C6C7D2C2261757468656E74696361746564223A747275652C227072696E636970616C223A7B2240636C617373223A226F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E55736572222C2270617373776F7264223A6E756C6C2C22757365726E616D65223A226163636F756E74222C22617574686F726974696573223A5B226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574222C5B5D5D2C226163636F756E744E6F6E45787069726564223A747275652C226163636F756E744E6F6E4C6F636B6564223A747275652C2263726564656E7469616C734E6F6E45787069726564223A747275652C22656E61626C6564223A747275657D2C2263726564656E7469616C73223A6E756C6C7D7D,NULL,0x65336C713768657449334D4D355051656656436A744F5854454F38355953314E507165435671695358332D34676747455674396A6D7276525943327676316C557553584853632D304A45586C6B493576595474494432415062594265646F455A477246425044564C306241626853706D474D3459334E6E3344347A41446E5872,'2025-03-11 01:47:28','2025-03-11 02:37:28',0x7B2240636C617373223A226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170222C226D657461646174612E746F6B656E2E696E76616C696461746564223A747275657D,0x65794A72615751694F694A746148497459584277496977695957786E496A6F69556C4D794E54596966512E65794A7A645749694F694A6859324E7664573530496977695958566B496A6F69593278705A5735304C576C6B4969776959574E6A6233567564456C6B496A6F694D694973496D35695A6949364D5463304D5459794F4467314D53776963324E76634755694F6C736962325A6D62476C755A56396859324E6C63334D695853776961584E7A496A6F696148523063446F764C7A45354D6934784E6A67754D79347A4E6A6F354D444578496977695A586877496A6F784E7A51784E6A4D784F4455784C434A70595851694F6A45334E4445324D6A67344E544573496D703061534936496A4D344E444E6D4D47566D4C57526C4D6A55744E4745324E4331694E6D4E6B4C5467324D5749794E6D597A4F5468694D434973496D463164476876636D6C306157567A496A70625858302E4B456A49774176485F3434526C444A585955537437574C4F7948386D4A5576474844436D555F7731327A754C32334C74763646643779545756505662493873313173505F37435047665956777A4F2D53414F6F73574145703842504630715A387A6D3632526E702D517661374445446F2D714D33672D52314857486E67463752727531543348316A7A4C414F44686C5746333762734A626D4C71785A7377357A6D746953714A5453626C545F4B586C444B78783750376B39305965564E43534759597A733632676B6965617835797766645F6C37696E57466E2D4C4C6153597359645676676E6D4548635A6E355F6369633654755A38325637496368324F324E437849546442346F49684E5650585356726846397977695A4F4F774774442D414868486F5F3934436E704E78576C6C416873546D31506A6543672D373868363630786A2D716252325A544248614A63784A4B4C3479464E373275484B584A6C7579385332534F38545777394F532D344C3553784B574765684831434B644C7A32776951374E33706736774C445958497062416445595674373532424A6639336372394D6E6E4F573063796B585073706F4A776C4E2D37342D7173474C376B567237547445596B72765861635572304A2D374B4933587774306E3742444F716F4E5A71436361716B4547696D564F36495869364249794A55584D79367678665436575346656D62736672645F674631647275774A77704C6D3267735F6E6A70726E5F716E4A4742655945796D685569336756304F62686C3530476D56755445567749477A724453674F6C4E4967664555364B7A6156376C796C366C7A5A5F785A4F677A6271366E4E537A7A46536236787753727A61544774656478574F622D75693270394B527A4D426A414E4F476863415A53465175445679484335443772416F7432357674627447357259,'2025-03-11 01:47:32','2025-03-11 02:37:32',0x7B2240636C617373223A226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170222C226D657461646174612E746F6B656E2E636C61696D73223A7B2240636C617373223A226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170222C22737562223A226163636F756E74222C22617564223A5B226A6176612E7574696C2E436F6C6C656374696F6E732453696E676C65746F6E4C697374222C5B22636C69656E742D6964225D5D2C226163636F756E744964223A2232222C226E6266223A5B226A6176612E74696D652E496E7374616E74222C313734313632383835312E3630303335353030305D2C2273636F7065223A5B226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574222C5B226F66666C696E655F616363657373225D5D2C22697373223A5B226A6176612E6E65742E55524C222C22687474703A2F2F3139322E3136382E332E33363A39303131225D2C22657870223A5B226A6176612E74696D652E496E7374616E74222C313734313633313835312E3630303335353030305D2C22696174223A5B226A6176612E74696D652E496E7374616E74222C313734313632383835312E3630303335353030305D2C226A7469223A2233383433663065662D646532352D346136342D623663642D383631623236663339386230222C22617574686F726974696573223A5B226A6176612E7574696C2E48617368536574222C5B5D5D7D2C226D657461646174612E746F6B656E2E696E76616C696461746564223A66616C73657D,'Bearer','offline_access',NULL,NULL,NULL,NULL,0x4432654A5379354844314C706E726449362D3275776F71417244306D336A5971597363366569416B4372734271705639466C4A75776A696130457577495F35706C36326D5552576262666F646649686B4A4132376166373159777253797032453470434D79375A674E544E56776D5748466E66742D303251564969774337504F,'2025-03-11 01:47:32','2025-03-11 11:47:32',0x7B2240636C617373223A226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170222C226D657461646174612E746F6B656E2E696E76616C696461746564223A66616C73657D,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `oauth2_authorization` (`id`,`registered_client_id`,`principal_name`,`authorization_grant_type`,`authorized_scopes`,`attributes`,`state`,`authorization_code_value`,`authorization_code_issued_at`,`authorization_code_expires_at`,`authorization_code_metadata`,`access_token_value`,`access_token_issued_at`,`access_token_expires_at`,`access_token_metadata`,`access_token_type`,`access_token_scopes`,`oidc_id_token_value`,`oidc_id_token_issued_at`,`oidc_id_token_expires_at`,`oidc_id_token_metadata`,`refresh_token_value`,`refresh_token_issued_at`,`refresh_token_expires_at`,`refresh_token_metadata`,`user_code_value`,`user_code_issued_at`,`user_code_expires_at`,`user_code_metadata`,`device_code_value`,`device_code_issued_at`,`device_code_expires_at`,`device_code_metadata`)  VALUES ('a455bb5f-7a91-44c2-a68a-247a66535727','client-id','account','authorization_code',NULL,0x7B2240636C617373223A226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170222C226A6176612E73656375726974792E5072696E636970616C223A7B2240636C617373223A226F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E222C22617574686F726974696573223A5B226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C6552616E646F6D4163636573734C697374222C5B5D5D2C2264657461696C73223A7B2240636C617373223A226F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E57656241757468656E7469636174696F6E44657461696C73222C2272656D6F746541646472657373223A223139322E3136382E332E35222C2273657373696F6E4964223A6E756C6C7D2C2261757468656E74696361746564223A747275652C227072696E636970616C223A7B2240636C617373223A226F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E55736572222C2270617373776F7264223A6E756C6C2C22757365726E616D65223A226163636F756E74222C22617574686F726974696573223A5B226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574222C5B5D5D2C226163636F756E744E6F6E45787069726564223A747275652C226163636F756E744E6F6E4C6F636B6564223A747275652C2263726564656E7469616C734E6F6E45787069726564223A747275652C22656E61626C6564223A747275657D2C2263726564656E7469616C73223A6E756C6C7D2C226F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F72652E656E64706F696E742E4F4175746832417574686F72697A6174696F6E52657175657374223A7B2240636C617373223A226F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F72652E656E64706F696E742E4F4175746832417574686F72697A6174696F6E52657175657374222C22617574686F72697A6174696F6E557269223A22687474703A2F2F3139322E3136382E332E353A393031322F6F61757468322F617574686F72697A65222C22617574686F72697A6174696F6E4772616E7454797065223A7B2276616C7565223A22617574686F72697A6174696F6E5F636F6465227D2C22726573706F6E736554797065223A7B2276616C7565223A22636F6465227D2C22636C69656E744964223A22636C69656E742D6964222C227265646972656374557269223A22687474703A2F2F3132372E302E302E313A333030302F696E646578222C2273636F706573223A5B226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574222C5B226F66666C696E655F616363657373225D5D2C227374617465223A6E756C6C2C226164646974696F6E616C506172616D6574657273223A7B2240636C617373223A226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170222C22636F64655F6368616C6C656E6765223A224A643652554A5833784638364A4448527335375146627836384E4A4C514A475A5259584E367A554B767355222C22636F64655F6368616C6C656E67655F6D6574686F64223A2253323536227D2C22617574686F72697A6174696F6E52657175657374557269223A22687474703A2F2F3139322E3136382E332E353A393031322F6F61757468322F617574686F72697A653F726573706F6E73655F747970653D636F646526636C69656E745F69643D636C69656E742D69642673636F70653D6F66666C696E655F6163636573732672656469726563745F7572693D687474703A2F2F3132372E302E302E313A333030302F696E64657826636F64655F6368616C6C656E67653D4A643652554A5833784638364A4448527335375146627836384E4A4C514A475A5259584E367A554B76735526636F64655F6368616C6C656E67655F6D6574686F643D53323536222C2261747472696275746573223A7B2240636C617373223A226A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170227D7D2C227374617465223A2253765F4E626A3479793052545271514F384670345A34753043445272385633757A68415263586737674D343D227D,'Sv_Nbj4yy0RTRqQO8Fp4Z4u0CDRr8V3uzhARcXg7gM4=',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- ----------------------------
-- Table structure for table oauth2_authorization_consent
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_authorization_consent`;
CREATE TABLE `oauth2_authorization_consent` (
                                                `registered_client_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
                                                `principal_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
                                                `authorities` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
                                                PRIMARY KEY (`registered_client_id`,`principal_name`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of oauth2_authorization_consent
-- ----------------------------
INSERT INTO `oauth2_authorization_consent` (`registered_client_id`,`principal_name`,`authorities`)  VALUES ('client-id','account','SCOPE_offline_access');
-- ----------------------------
-- Table structure for table oauth2_registered_client
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_registered_client`;
CREATE TABLE `oauth2_registered_client` (
                                            `id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
                                            `client_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
                                            `client_id_issued_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                            `client_secret` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                            `client_secret_expires_at` timestamp NULL DEFAULT NULL,
                                            `client_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
                                            `client_authentication_methods` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
                                            `authorization_grant_types` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
                                            `redirect_uris` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                            `post_logout_redirect_uris` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                            `scopes` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
                                            `client_settings` varchar(2000) COLLATE utf8mb4_general_ci NOT NULL,
                                            `token_settings` varchar(2000) COLLATE utf8mb4_general_ci NOT NULL,
                                            PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of oauth2_registered_client
-- ----------------------------
INSERT INTO `oauth2_registered_client` (`id`,`client_id`,`client_id_issued_at`,`client_secret`,`client_secret_expires_at`,`client_name`,`client_authentication_methods`,`authorization_grant_types`,`redirect_uris`,`post_logout_redirect_uris`,`scopes`,`client_settings`,`token_settings`)  VALUES ('client-id','client-id','2024-10-25 00:40:00','{bcrypt}$2a$10$p0JQ9qjcgqYzDNYvCwBJXOTyZTa0NJ0IvkBN2lZx.4VyTmkwT4.am',NULL,'MHR-APP','client_secret_basic','refresh_token,authorization_code','http://127.0.0.1:3000/index','http://localhost:3000/logout','openid,profile,email,all,offline_access','{"@class":"java.util.Collections$UnmodifiableMap","settings.client.require-proof-key":true,"settings.client.require-authorization-consent":true}','{"@class":"java.util.Collections$UnmodifiableMap","settings.token.reuse-refresh-tokens":true,"settings.token.id-token-signature-algorithm":["org.springframework.security.oauth2.jose.jws.SignatureAlgorithm","RS256"],"settings.token.access-token-time-to-live":["java.time.Duration",3000.000000000],"settings.token.access-token-format":{"@class":"org.springframework.security.oauth2.server.authorization.settings.OAuth2TokenFormat","value":"self-contained"},"settings.token.refresh-token-time-to-live":["java.time.Duration",36000.000000000],"settings.token.authorization-code-time-to-live":["java.time.Duration",3000.000000000],"settings.token.device-code-time-to-live":["java.time.Duration",3000.000000000]}');
-- ----------------------------
-- Table structure for table t_account
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account` (
                             `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                             `account` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
                             `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
                             `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态 0 正常 1 异常',
                             `account_expired` tinyint NOT NULL DEFAULT '0' COMMENT '账号过期 0 未过期 1 已过期',
                             `account_locked` tinyint NOT NULL DEFAULT '0' COMMENT '账号锁定 0 未锁定 1 已锁定',
                             `credentials_expired` tinyint NOT NULL DEFAULT '0' COMMENT '凭证过期 0 未过期 1 已过期',
                             `create_time` datetime NOT NULL,
                             `update_time` datetime NOT NULL,
                             `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
                             `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
                             PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=30003 COMMENT='账号表';

-- ----------------------------
-- Records of t_account
-- ----------------------------
INSERT INTO `t_account` (`id`,`account`,`password`,`status`,`account_expired`,`account_locked`,`credentials_expired`,`create_time`,`update_time`,`version`,`is_deleted`)  VALUES ('2','account','{bcrypt}$2a$10$PABaNrQ9TMJMyKiQMQEEHO/4TwZgF4Iv3TgJGY.Xly5k5hlgMwZlS',0,0,0,0,'2025-02-26 23:56:35','2025-02-26 23:56:35','0',0);
-- ----------------------------
-- Table structure for table t_account_roles
-- ----------------------------
DROP TABLE IF EXISTS `t_account_roles`;
CREATE TABLE `t_account_roles` (
                                   `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                   `account_id` bigint NOT NULL COMMENT '账号ID',
                                   `role_id` bigint NOT NULL COMMENT '角色ID',
                                   `tenant_id` bigint NOT NULL COMMENT '租户ID',
                                   `create_time` datetime NOT NULL COMMENT '创建时间',
                                   `update_time` datetime NOT NULL COMMENT '更新时间',
                                   `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
                                   `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
                                   PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
                                   UNIQUE KEY `account_id` (`account_id`,`role_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='账号角色关联表 该表可实现账号角色租户多对多关联';

-- ----------------------------
-- Records of t_account_roles
-- ----------------------------
-- ----------------------------
-- Table structure for table t_account_tenants
-- ----------------------------
DROP TABLE IF EXISTS `t_account_tenants`;
CREATE TABLE `t_account_tenants` (
                                     `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                     `account_id` bigint NOT NULL COMMENT '账号ID',
                                     `tenant_id` bigint NOT NULL COMMENT '租户ID',
                                     `is_primary` tinyint(1) DEFAULT '0' COMMENT '是否主租户',
                                     `create_time` datetime NOT NULL COMMENT '创建时间',
                                     `update_time` datetime NOT NULL COMMENT '更新时间',
                                     `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
                                     `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
                                     PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
                                     UNIQUE KEY `account_id` (`account_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='账号租户关联表 该表可实现账号租户多对多关联';

-- ----------------------------
-- Records of t_account_tenants
-- ----------------------------
-- ----------------------------
-- Table structure for table t_binding
-- ----------------------------
DROP TABLE IF EXISTS `t_binding`;
CREATE TABLE `t_binding` (
                             `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                             `account_id` bigint NOT NULL COMMENT '用户id',
                             `identity_type` int NOT NULL COMMENT '登录类型(手机号/邮箱) 或第三方应用名称 (微信/微博等)',
                             `identifier` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号/邮箱/第三方的唯一标识',
                             `credential` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码凭证 (自建账号的保存密码, 第三方的保存 token)',
                             `create_time` datetime NOT NULL COMMENT '创建时间',
                             `update_time` datetime NOT NULL COMMENT '更新时间',
                             `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
                             `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
                             PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=2 COMMENT='账号绑定表';

-- ----------------------------
-- Records of t_binding
-- ----------------------------
-- ----------------------------
-- Table structure for table t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员名称',
                            `level` int NOT NULL COMMENT '会员等级',
                            `description` text COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '会员描述',
                            `create_time` datetime NOT NULL COMMENT '创建时间',
                            `update_time` datetime NOT NULL COMMENT '更新时间',
                            `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
                            `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
                            PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会员表';

-- ----------------------------
-- Records of t_member
-- ----------------------------
-- ----------------------------
-- Table structure for table t_member_buy_record
-- ----------------------------
DROP TABLE IF EXISTS `t_member_buy_record`;
CREATE TABLE `t_member_buy_record` (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                       `member_id` bigint NOT NULL COMMENT '会员id',
                                       `relation_id` bigint NOT NULL COMMENT '租户id',
                                       `type` tinyint NOT NULL COMMENT '购买类型 1-租户 2-个人',
                                       `start_time` datetime NOT NULL COMMENT '会员生效开始时间',
                                       `end_time` datetime NOT NULL COMMENT '会员生效结束时间',
                                       `create_time` datetime NOT NULL COMMENT '创建时间',
                                       `update_time` datetime NOT NULL COMMENT '更新时间',
                                       `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
                                       `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
                                       PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会员购买记录表';

-- ----------------------------
-- Records of t_member_buy_record
-- ----------------------------
-- ----------------------------
-- Table structure for table t_member_permissions
-- ----------------------------
DROP TABLE IF EXISTS `t_member_permissions`;
CREATE TABLE `t_member_permissions` (
                                        `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                        `member_id` bigint NOT NULL COMMENT '会员id',
                                        `permission_id` bigint NOT NULL COMMENT '权限id',
                                        `create_time` datetime NOT NULL COMMENT '创建时间',
                                        `update_time` datetime NOT NULL COMMENT '更新时间',
                                        `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
                                        `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
                                        PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会员权限表';

-- ----------------------------
-- Records of t_member_permissions
-- ----------------------------
-- ----------------------------
-- Table structure for table t_permissions
-- ----------------------------
DROP TABLE IF EXISTS `t_permissions`;
CREATE TABLE `t_permissions` (
                                 `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                 `tenant_id` bigint NOT NULL COMMENT '租户ID',
                                 `permission_type` enum('FIELD','URL','ROUTE') COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限类型 FIELD 字段 URL URL ROUTE 路由',
                                 `permission_value` varchar(255) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限值',
                                 `description` text COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
                                 `create_time` datetime NOT NULL COMMENT '创建时间',
                                 `update_time` datetime NOT NULL COMMENT '更新时间',
                                 `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
                                 `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
                                 PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限表';

-- ----------------------------
-- Records of t_permissions
-- ----------------------------
-- ----------------------------
-- Table structure for table t_profile
-- ----------------------------
DROP TABLE IF EXISTS `t_profile`;
CREATE TABLE `t_profile` (
                             `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                             `account_id` bigint NOT NULL COMMENT '用户ID',
                             `birthday` date NOT NULL COMMENT '生日',
                             `gender` tinyint NOT NULL COMMENT '性别',
                             `phone_number` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话号码',
                             `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
                             `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
                             `location` int DEFAULT NULL COMMENT '地址编码',
                             `avatar_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
                             `signature` text COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '个性签名',
                             `create_time` datetime NOT NULL COMMENT '创建时间',
                             `update_time` datetime NOT NULL COMMENT '更新时间',
                             `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
                             `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
                             PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=2 COMMENT='个人资料表';

-- ----------------------------
-- Records of t_profile
-- ----------------------------
-- ----------------------------
-- Table structure for table t_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permissions`;
CREATE TABLE `t_role_permissions` (
                                      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                      `role_id` bigint NOT NULL COMMENT '角色id',
                                      `permission_id` bigint NOT NULL COMMENT '权限id',
                                      `tenant_id` bigint NOT NULL COMMENT '租户id',
                                      `create_time` datetime NOT NULL COMMENT '创建时间',
                                      `update_time` datetime NOT NULL COMMENT '更新时间',
                                      `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
                                      `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
                                      PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色权限表';

-- ----------------------------
-- Records of t_role_permissions
-- ----------------------------
-- ----------------------------
-- Table structure for table t_roles
-- ----------------------------
DROP TABLE IF EXISTS `t_roles`;
CREATE TABLE `t_roles` (
                           `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                           `tenant_id` bigint NOT NULL COMMENT '租户ID',
                           `role_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
                           `description` text COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
                           `create_time` datetime NOT NULL COMMENT '创建时间',
                           `update_time` datetime NOT NULL COMMENT '更新时间',
                           `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
                           `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
                           PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_roles
-- ----------------------------
-- ----------------------------
-- Table structure for table t_tenants
-- ----------------------------
DROP TABLE IF EXISTS `t_tenants`;
CREATE TABLE `t_tenants` (
                             `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                             `parent_id` bigint NOT NULL COMMENT '父租户ID',
                             `tenant_code` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户编码',
                             `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户名称',
                             `description` text COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
                             `create_time` datetime NOT NULL COMMENT '创建时间',
                             `update_time` datetime NOT NULL COMMENT '更新时间',
                             `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
                             `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 0 未删除 1 已删除',
                             PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
                             UNIQUE KEY `tenant_code` (`tenant_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=2 COMMENT='租户表';

-- ----------------------------
-- Records of t_tenants
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
