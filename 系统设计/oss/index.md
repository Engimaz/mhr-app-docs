# 对象存储设计

### 数据库设计

####

```sql
CREATE TABLE Buckets
(
    BucketID     BIGINT PRIMARY KEY AUTO_INCREMENT,                                           -- Bucket ID
    BucketName   VARCHAR(255) NOT NULL UNIQUE,                                                -- Bucket name
    OwnerID      BIGINT       NOT NULL,                                                       -- Owner ID
    CreatedDate  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,                             -- Creation date
    ModifiedDate TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Modification date
    Description  TEXT                                                                         -- Description
);
```

### Objects table

```sql
CREATE TABLE Objects
(
    ObjectID     BIGINT PRIMARY KEY AUTO_INCREMENT,                                           -- Object ID
    BucketID     BIGINT       NOT NULL,                                                       -- Bucket ID
    ObjectKey    VARCHAR(255) NOT NULL,                                                       -- Object key (name)
    Size         BIGINT       NOT NULL,                                                       -- Object size in bytes
    ContentType  VARCHAR(255) NOT NULL,                                                       -- MIME type of the object
    CreatedDate  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,                             -- Creation date
    ModifiedDate TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Modification date
    ETag         VARCHAR(255) NOT NULL,                                                       -- ETag for the object
    StorageClass VARCHAR(50)  NOT NULL,                                                       -- Storage class (e.g., STANDARD, GLACIER)
    IsDeleted    TINYINT      NOT NULL DEFAULT 0,                                             -- Logical deletion flag (0 - not deleted, 1 - deleted)
    FOREIGN KEY (BucketID) REFERENCES Buckets (BucketID)                                      -- Foreign key to Buckets table
);

```

### Object Metadata table

```sql
CREATE TABLE ObjectMetadata
(
    MetadataID BIGINT PRIMARY KEY AUTO_INCREMENT,        -- Metadata ID
    ObjectID   BIGINT       NOT NULL,                    -- Object ID
    Key        VARCHAR(255) NOT NULL,                    -- Metadata key
    Value      TEXT         NOT NULL,                    -- Metadata value
    FOREIGN KEY (ObjectID) REFERENCES Objects (ObjectID) -- Foreign key to Objects table
);
```