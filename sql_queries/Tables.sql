USE [master];
GO


CREATE TABLE dbo.QRLLanguage (
    LANGUAGE_ID INT PRIMARY KEY NOT NULL,
    LanguageCode VARCHAR(10) NULL,
    LanguageName VARCHAR(50) NULL,
    CreateDate DATETIME NOT NULL,
    CreateBy VARCHAR(250) NOT NULL,
    UpdateDate DATETIME NOT NULL,
    UpdateBy VARCHAR(250) NOT NULL
);
GO

CREATE TABLE dbo.QRLVideo (
    id INT PRIMARY KEY NOT NULL,
    PRODUCT_ID INT NOT NULL, 
    LANGUAGE_ID INT NOT NULL, 
    VIDEO_TITLE VARCHAR(200) NULL,
    VIDEO_THUMBNAIL_URL VARCHAR(1000) NULL,
    HITS INT NULL,
    VIDEO_URL VARCHAR(100) NULL,
    CreateDate DATETIME NOT NULL,
    CreateBy VARCHAR(250) NOT NULL,
    UpdateDate DATETIME NOT NULL,
    UpdateBy VARCHAR(250) NOT NULL,
    BOOKMARK INT NULL   
);
GO

CREATE TABLE dbo.QRLProduct (
    ID INT NOT NULL,
    PRODUCT_ID INT PRIMARY KEY NOT NULL,
    PRODUCT_DISPLAY_NAME VARCHAR(200) NULL,
    CATEGORY_ID INT NULL, 
    PRODUCT_THUMBNAIL_URL NVARCHAR(200) NULL,
    CreateDate DATETIME NOT NULL,
    CreateBy VARCHAR(250) NOT NULL,
    UpdateDate DATETIME NOT NULL,
    UpdateBy VARCHAR(250) NOT NULL,
    BOOKMARK INT NULL,
    HITS INT NULL
    
);
GO

CREATE TABLE dbo.QRLProductCategory (
    id INT NOT NULL,
    CATEGORY_ID INT PRIMARY KEY NOT NULL,
    CATEGORY_NAME VARCHAR(200) NULL,
    CATEGORY_THUMBNAIL_URL VARCHAR(200) NULL,
    CreateDate DATETIME NOT NULL,
    CreateBy VARCHAR(250) NOT NULL,
    UpdateDate DATETIME NOT NULL,
    UpdateBy VARCHAR(250) NOT NULL
);
GO





CREATE TABLE dbo.QRLDocument (
    id INT PRIMARY KEY NOT NULL,
    PRODUCT_ID INT NOT NULL, 
    LANGUAGE_ID INT NOT NULL, 
    DOC_TITLE VARCHAR(200) NULL,
    DOC_PATH VARCHAR(1000) NULL,
    CreateDate DATETIME NOT NULL,
    CreateBy VARCHAR(250) NOT NULL,
    UpdateDate DATETIME NOT NULL,
    UpdateBy VARCHAR(250) NOT NULL,
    BOOKMARK INT NULL,
    HITS INT NULL
);
GO



--Foreign key constraints along with system updates of create and update

ALTER TABLE dbo.QRLProduct
ADD CONSTRAINT FK_QRLProduct_CATEGORY_ID FOREIGN KEY (CATEGORY_ID) REFERENCES dbo.QRLProductCategory(CATEGORY_ID);
 GO




ALTER TABLE dbo.QRLVideo
ADD CONSTRAINT FK_QRLVideo_PRODUCT_ID
FOREIGN KEY (PRODUCT_ID) REFERENCES dbo.QRLProduct(PRODUCT_ID);
GO


ALTER TABLE dbo.QRLVideo
ADD CONSTRAINT FK_QRLVideo_LANGUAGE_ID
FOREIGN KEY (LANGUAGE_ID) REFERENCES dbo.QRLLanguage(LANGUAGE_ID);
GO

ALTER TABLE dbo.QRLDocument
ADD CONSTRAINT FK_QRLDocument_PRODUCT_ID
FOREIGN KEY (PRODUCT_ID) REFERENCES dbo.QRLProduct(PRODUCT_ID);
GO


ALTER TABLE dbo.QRLDocument
ADD CONSTRAINT FK_QRLDocument_LANGUAGE_ID
FOREIGN KEY (LANGUAGE_ID) REFERENCES dbo.QRLLanguage(LANGUAGE_ID);
GO



ALTER TABLE dbo.QRLLanguage ADD CONSTRAINT DF_QRLLanguage_CreateDate DEFAULT (sysutcdatetime()) FOR CreateDate;
ALTER TABLE dbo.QRLLanguage ADD CONSTRAINT DF_QRLLanguage_CreateBy DEFAULT (suser_sname()) FOR CreateBy;
ALTER TABLE dbo.QRLLanguage ADD CONSTRAINT DF_QRLLanguage_UpdateDate DEFAULT (sysutcdatetime()) FOR UpdateDate;
ALTER TABLE dbo.QRLLanguage ADD CONSTRAINT DF_QRLLanguage_UpdateBy DEFAULT (suser_sname()) FOR UpdateBy;
GO


ALTER TABLE dbo.QRLProduct ADD CONSTRAINT DF_QRLProduct_CreateDate DEFAULT (sysutcdatetime()) FOR CreateDate;
ALTER TABLE dbo.QRLProduct ADD CONSTRAINT DF_QRLProduct_CreateBy DEFAULT (suser_sname()) FOR CreateBy;
ALTER TABLE dbo.QRLProduct ADD CONSTRAINT DF_QRLProduct_UpdateDate DEFAULT (sysutcdatetime()) FOR UpdateDate;
ALTER TABLE dbo.QRLProduct ADD CONSTRAINT DF_QRLProduct_UpdateBy DEFAULT (suser_sname()) FOR UpdateBy;
GO


ALTER TABLE dbo.QRLProductCategory ADD CONSTRAINT DF_QRLProductCategory_CreateDate DEFAULT (sysutcdatetime()) FOR CreateDate;
ALTER TABLE dbo.QRLProductCategory ADD CONSTRAINT DF_QRLProductCategory_CreateBy DEFAULT (suser_sname()) FOR CreateBy;
ALTER TABLE dbo.QRLProductCategory ADD CONSTRAINT DF_QRLProductCategory_UpdateDate DEFAULT (sysutcdatetime()) FOR UpdateDate;
ALTER TABLE dbo.QRLProductCategory ADD CONSTRAINT DF_QRLProductCategory_UpdateBy DEFAULT (suser_sname()) FOR UpdateBy;
GO





ALTER TABLE dbo.QRLVideo ADD CONSTRAINT DF_QRLVideo_CreateDate DEFAULT (sysutcdatetime()) FOR CreateDate;
ALTER TABLE dbo.QRLVideo ADD CONSTRAINT DF_QRLVideo_CreateBy DEFAULT (suser_sname()) FOR CreateBy;
ALTER TABLE dbo.QRLVideo ADD CONSTRAINT DF_QRLVideo_UpdateDate DEFAULT (sysutcdatetime()) FOR UpdateDate;
ALTER TABLE dbo.QRLVideo ADD CONSTRAINT DF_QRLVideo_UpdateBy DEFAULT (suser_sname()) FOR UpdateBy;
GO


ALTER TABLE dbo.QRLDocument ADD CONSTRAINT DF_QRLDocument_CreateDate DEFAULT (sysutcdatetime()) FOR CreateDate;
ALTER TABLE dbo.QRLDocument ADD CONSTRAINT DF_QRLDocument_CreateBy DEFAULT (suser_sname()) FOR CreateBy;
ALTER TABLE dbo.QRLDocument ADD CONSTRAINT DF_QRLDocument_UpdateDate DEFAULT (sysutcdatetime()) FOR UpdateDate;
ALTER TABLE dbo.QRLDocument ADD CONSTRAINT DF_QRLDocument_UpdateBy DEFAULT (suser_sname()) FOR UpdateBy;
GO


