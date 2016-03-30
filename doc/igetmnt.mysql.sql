REVOKE ALL ON igetmng.* FROM igetmng@'%';
use mysql;
DELETE FROM user WHERE User="igetmng";
FLUSH PRIVILEGES;
DROP DATABASE igetmng;
CREATE DATABASE igetmng default character set utf8;
GRANT ALL ON igetmng.* TO igetmng@'%' IDENTIFIED BY  "igetmng" ;
FLUSH PRIVILEGES;
use igetmng;

# -----------------------------------------------------------------------
# msite
# -----------------------------------------------------------------------
drop table if exists msite;

CREATE TABLE msite
(
    id MEDIUMINT(20) NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address LONGTEXT NOT NULL,
    linkFormat LONGTEXT,
    depth MEDIUMINT(20) NOT NULL,
    downThreadNum MEDIUMINT(20) NOT NULL,
    startTime TIMESTAMP default "0000-00-00 00:00",
    interMinute MEDIUMINT(20) NOT NULL,
    standMinute MEDIUMINT(20) NOT NULL,
    ServerAuth INTEGER default 0,
    userBySA VARCHAR(255),
    pwdBySA VARCHAR(255),
    PageAuth INTEGER default 0,
    sendTypeByPA MEDIUMINT(20),
    mainAddressByPA VARCHAR(255),
    loginAddressByPA VARCHAR(255),
    userByPA VARCHAR(255),
    userFieldByPA VARCHAR(255),
    pwdByPA VARCHAR(255),
    pwdFieldByPA VARCHAR(255),
    useProxy INTEGER default 0,
    proxyAddress VARCHAR(255),
    proxyPort MEDIUMINT(20) default 80,
    proxyUser VARCHAR(255),
    proxyPwd VARCHAR(255),
    status MEDIUMINT(20) default 0,
    charset VARCHAR(255),
    advancedConfig LONGTEXT,
    siteType MEDIUMINT(20),
    addressType MEDIUMINT(20),
    filterLinkFormat LONGTEXT,
    overDomain INTEGER default 0,
    limitDownDays MEDIUMINT(20),
    keywordsFilter INTEGER default 0,
    keywordsExp LONGTEXT,
    autoAnalyze INTEGER default 0,
    useZSTemplet INTEGER default 0,
    spiderName VARCHAR(255),
    dateAnalyzeType MEDIUMINT(20),
    defaultConfig LONGTEXT,
    typeID MEDIUMINT(20) NOT NULL,
    categoryType MEDIUMINT(20),
    categoryID MEDIUMINT(20),
    templetVersion MEDIUMINT(20),
    uploadTime TIMESTAMP default "0000-00-00 00:00",
    macAddress VARCHAR(255),
    PRIMARY KEY(id));

# -----------------------------------------------------------------------
# mtexttemplet
# -----------------------------------------------------------------------
drop table if exists mtexttemplet;

CREATE TABLE mtexttemplet
(
    id MEDIUMINT(20) NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    siteDomain VARCHAR(255) NOT NULL,
    urlFormats LONGTEXT,
    templetText LONGTEXT,
    parseClass VARCHAR(255) NOT NULL,
    templetType MEDIUMINT(20),
    versionControl MEDIUMINT(20),
    sysTemplet INTEGER default 0,
    PRIMARY KEY(id));

# -----------------------------------------------------------------------
# msitedomain
# -----------------------------------------------------------------------
drop table if exists msitedomain;

CREATE TABLE msitedomain
(
    id MEDIUMINT(20) NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    domainType MEDIUMINT(20),
    versioncode MEDIUMINT(20),
    defaultConfig LONGTEXT,
    PRIMARY KEY(id));

# -----------------------------------------------------------------------
# mspideruser
# -----------------------------------------------------------------------
drop table if exists mspideruser;

CREATE TABLE mspideruser
(
    macAddress VARCHAR(255) NOT NULL,
    hostIP VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    seller VARCHAR(255),
    limitDomainNum MEDIUMINT(20),
    realDomainNum MEDIUMINT(20),
    domainset LONGTEXT,
    downType MEDIUMINT(20),
    beginTime TIMESTAMP default "0000-00-00 00:00",
    endTime TIMESTAMP default "0000-00-00 00:00",
    status MEDIUMINT(20),
    note LONGTEXT,
    PRIMARY KEY(macAddress));



