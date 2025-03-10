INSERT INTO oauth2_registered_client (id, client_id, client_id_issued_at, client_secret, client_secret_expires_at,
                                           client_name, client_authentication_methods, authorization_grant_types,
                                           redirect_uris, post_logout_redirect_uris, scopes, client_settings,
                                           token_settings)
VALUES ('client-id', 'client-id', '2024-10-25 00:40:00',
        '{bcrypt}$2a$10$p0JQ9qjcgqYzDNYvCwBJXOTyZTa0NJ0IvkBN2lZx.4VyTmkwT4.am', NULL, 'MHR-APP',
        'client_secret_basic', 'refresh_token,authorization_code', 'http://127.0.0.1:3000/index',
        'http://localhost:3000/logout', 'openid,profile,email,all,offline_access',
        '{"@class":"java.util.Collections$UnmodifiableMap","settings.client.require-proof-key":true,"settings.client.require-authorization-consent":true}',
        '{"@class":"java.util.Collections$UnmodifiableMap","settings.token.reuse-refresh-tokens":true,"settings.token.id-token-signature-algorithm":["org.springframework.security.oauth2.jose.jws.SignatureAlgorithm","RS256"],"settings.token.access-token-time-to-live":["java.time.Duration",3000.000000000],"settings.token.access-token-format":{"@class":"org.springframework.security.oauth2.server.authorization.settings.OAuth2TokenFormat","value":"self-contained"},"settings.token.refresh-token-time-to-live":["java.time.Duration",36000.000000000],"settings.token.authorization-code-time-to-live":["java.time.Duration",3000.000000000],"settings.token.device-code-time-to-live":["java.time.Duration",3000.000000000]}');

