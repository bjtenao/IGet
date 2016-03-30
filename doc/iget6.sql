REVOKE ALL ON spider3.* FROM spider3@'%';
REVOKE ALL ON spider3user.* FROM spider3@'%';
use mysql;
DELETE FROM user WHERE User="spider3" ;
FLUSH PRIVILEGES;

DROP DATABASE spider3;
DROP DATABASE spider3user;

CREATE DATABASE spider3 default character set utf8;
CREATE database spider3user default character set utf8;

GRANT ALL ON spider3.* TO spider3@'%' IDENTIFIED BY  "spider3" ;
GRANT ALL ON spider3user.* TO spider3@'%' IDENTIFIED BY  "spider3" ;
FLUSH PRIVILEGES;

use spider3;
# -----------------------------------------------------------------------
# msitetype
# -----------------------------------------------------------------------
drop table if exists msitetype;

CREATE TABLE msitetype
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    parentID INT,
    remark LONGTEXT,
    PRIMARY KEY(id));

# -----------------------------------------------------------------------
# msite
# -----------------------------------------------------------------------
drop table if exists msite;

CREATE TABLE msite
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address LONGTEXT NOT NULL,
    linkFormat LONGTEXT,
    depth INT NOT NULL,
    downThreadNum INT NOT NULL,
    startTime TIMESTAMP default "0000-00-00 00:00",
    interMinute INT NOT NULL,
    standMinute INT NOT NULL,
    ServerAuth TINYINT default 0,
    userBySA VARCHAR(255),
    pwdBySA VARCHAR(255),
    PageAuth TINYINT default 0,
    sendTypeByPA INT,
    mainAddressByPA VARCHAR(255),
    loginAddressByPA VARCHAR(255),
    userByPA VARCHAR(255),
    userFieldByPA VARCHAR(255),
    pwdByPA VARCHAR(255),
    pwdFieldByPA VARCHAR(255),
    useProxy TINYINT default 0,
    proxyAddress VARCHAR(255),
    proxyPort INT default 80,
    proxyUser VARCHAR(255),
    proxyPwd VARCHAR(255),
    status INT default 0,
    charset VARCHAR(255),
    advancedConfig LONGTEXT,
    siteType INT,
    addressType INT,
    filterLinkFormat LONGTEXT,
    overDomain TINYINT default 0,
    limitDownDays INT,
    keywordsFilter TINYINT default 0,
    keywordsExp LONGTEXT,
    autoAnalyze TINYINT default 0,
    useZSTemplet TINYINT default 0,
    spiderName VARCHAR(255),
    dateAnalyzeType INT,
    defaultConfig LONGTEXT,
    typeID INT ,
    categoryType INT,
    categoryID INT,
    templetVersion INT,
    PRIMARY KEY(id)
    );

# -----------------------------------------------------------------------
# mtexttemplet
# -----------------------------------------------------------------------
drop table if exists mtexttemplet;

CREATE TABLE mtexttemplet
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    siteDomain VARCHAR(255) NOT NULL,
    urlFormats LONGTEXT,
    templetText LONGTEXT,
    parseClass VARCHAR(255) NOT NULL,
    templetType INT,
    sysTemplet TINYINT default 0,
    PRIMARY KEY(id));

# -----------------------------------------------------------------------
# mdownlog
# -----------------------------------------------------------------------
drop table if exists mdownlog;

CREATE TABLE mdownlog
(
    id BIGINT NOT NULL AUTO_INCREMENT,
    startTime TIMESTAMP default "0000-00-00 00:00",
    endTime TIMESTAMP default "0000-00-00 00:00",
    linkTotal INT,
    linkRepeat INT,
    linkDownload INT,
    linkOverplus INT,
    linkDownErr INT,
    buildLinkErr INT,
    analyzeMiss INT,
    analyzeText INT,
    analyzeAuto INT,
    analyzeExpire INT,
    bbstopicnum INT,
    bbsnewtopicnum INT,
    bbspostnum INT,
    downSize INT,
    state INT,
    analyzeDepth INT,
    downDepth INT,
    completeRate INT,
    refValue LONGTEXT,
    siteID INT NOT NULL,
    PRIMARY KEY(id)    
    );



# -----------------------------------------------------------------------
# mspidercontrol
# -----------------------------------------------------------------------
drop table if exists mspidercontrol;

CREATE TABLE mspidercontrol
(
    hostName VARCHAR(255) NOT NULL,
    hostIP VARCHAR(255),
    port INT,
    threadNum INT,
    downNum INT,
    connectSec INT,
    readSec INT,
    PRIMARY KEY(hostName));

# -----------------------------------------------------------------------
# mlinkinfo
# -----------------------------------------------------------------------
drop table if exists mlinkinfo;

CREATE TABLE mlinkinfo
(
    id BIGINT NOT NULL AUTO_INCREMENT,
    pageURL LONGTEXT NOT NULL,
    downTime TIMESTAMP default "0000-00-00 00:00",
    scannable TINYINT default 0,
    depth INT,
    textMD5 VARCHAR(255),
    attribute LONGTEXT,
    parentID BIGINT,
    siteID INT NOT NULL,
    PRIMARY KEY(id)    
    );

# -----------------------------------------------------------------------
# mwebpage
# -----------------------------------------------------------------------
drop table if exists mwebpage;

CREATE TABLE mwebpage
(
    id BIGINT NOT NULL AUTO_INCREMENT,
    pageURL VARCHAR(255) NOT NULL,
    downTime TIMESTAMP default "0000-00-00 00:00",
    title VARCHAR(255),
    mainText LONGTEXT,
    snapShot LONGTEXT,
    siteID INT NOT NULL,
    depth INT,
    remark LONGTEXT,
    PRIMARY KEY(id)    
    );

# -----------------------------------------------------------------------
# muser
# -----------------------------------------------------------------------
drop table if exists muser;

CREATE TABLE muser
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    loginName VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    degree INT,
    remarks LONGTEXT,
    PRIMARY KEY(id));

# -----------------------------------------------------------------------
# mcustomerdb
# -----------------------------------------------------------------------
drop table if exists mcustomerdb;

CREATE TABLE mcustomerdb
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    adapter VARCHAR(255) NOT NULL,
    driver VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL,
    user VARCHAR(255) NOT NULL,
    password VARCHAR(255),
    config LONGTEXT,
    PRIMARY KEY(id));

# -----------------------------------------------------------------------
# mcustomertable
# -----------------------------------------------------------------------
drop table if exists mcustomertable;

CREATE TABLE mcustomertable
(
    id INT NOT NULL AUTO_INCREMENT,
    sysObject VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    advConfig LONGTEXT,
    DBID INT NOT NULL,
    PRIMARY KEY(id));

# -----------------------------------------------------------------------
# mcustomerfield
# -----------------------------------------------------------------------
drop table if exists mcustomerfield;

CREATE TABLE mcustomerfield
(
    id INT NOT NULL AUTO_INCREMENT,
    property VARCHAR(255) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    cfType VARCHAR(255) NOT NULL,
    cfSize INT,
    cfRequired TINYINT default 0,
    cfDefault VARCHAR(255),
    cfPrimaryKey TINYINT,
    cfAutoInc TINYINT,
    advConfig LONGTEXT,
    TableID INT NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# mcustomercategory
# -----------------------------------------------------------------------
drop table if exists mcustomercategory;

CREATE TABLE mcustomercategory
(
    id INT NOT NULL AUTO_INCREMENT,
    customerID INT NOT NULL,
    name VARCHAR(255),
    available TINYINT default 0,
    existing TINYINT default 0,
    initalize TINYINT default 0,
    keywords LONGTEXT,
    parentID INT,
    advConfig LONGTEXT,
    PRIMARY KEY(id));

# -----------------------------------------------------------------------
# mbbstopic
# -----------------------------------------------------------------------
drop table if exists mbbstopic;

CREATE TABLE mbbstopic
(
    siteid INT NOT NULL,
    titleid VARCHAR(200) NOT NULL,
    lasttime DATETIME NOT NULL,
    downpagenum INT NOT NULL,
    downpostnum INT NOT NULL,
    subnum INT NOT NULL,
    PRIMARY KEY(siteid,titleid));
# -----------------------------------------------------------------------
# msitedowninfo
# -----------------------------------------------------------------------
drop table if exists msitedowninfo;

CREATE TABLE msitedowninfo
(
    id INT NOT NULL AUTO_INCREMENT,
    theTime TIMESTAMP NOT NULL,
    linkTotal INT,
    linkRepeat INT,
    linkDownload INT,
    linkOverplus INT,
    linkDownErr INT,
    buildLinkErr INT,
    analyzeMiss INT,
    analyzeText INT,
    analyzeAuto INT,
    analyzeExpire INT,
    bbstopicnum INT,
    bbsnewtopicnum INT,
    bbspostnum INT,
    downSize INT,
    state INT,
    analyzeDepth INT,
    downDepth INT,
    completeRate INT,
    refValue LONGTEXT,
    siteID INT NOT NULL,
    PRIMARY KEY(id));

# -----------------------------------------------------------------------
# mtypedowninfo
# -----------------------------------------------------------------------
drop table if exists mtypedowninfo;

CREATE TABLE mtypedowninfo
(
    id INT NOT NULL AUTO_INCREMENT,
    theTime TIMESTAMP NOT NULL,
    linkTotal INT,
    linkRepeat INT,
    linkDownload INT,
    linkOverplus INT,
    linkDownErr INT,
    buildLinkErr INT,
    analyzeMiss INT,
    analyzeText INT,
    analyzeAuto INT,
    analyzeExpire INT,
    bbstopicnum INT,
    bbsnewtopicnum INT,
    bbspostnum INT,
    downSize INT,
    state INT,
    analyzeDepth INT,
    downDepth INT,
    completeRate INT,
    refValue LONGTEXT,
    typeid INT NOT NULL,
    PRIMARY KEY(id));

# -----------------------------------------------------------------------
# mdownloadedurl
# -----------------------------------------------------------------------
drop table if exists mdownloadedurl;

CREATE TABLE mdownloadedurl
(
    siteid INT NOT NULL,
    titleid CHAR(16) NOT NULL,
    pubtime DATETIME NOT NULL,
    PRIMARY KEY(siteid,titleid));


set names 'gb2312';
insert into  msitetype(name,parentID,remark) values('缺省类别',0,'系统默认类别,您可以创建其他的相关类别');
INSERT INTO mcustomerdb VALUES
  (1, 'cdb', 'mysql', 'com.mysql.jdbc.Driver', 'jdbc:mysql://127.0.0.1:3306/spider3user?useUnicode=true&characterEncoding=UTF-8', 'spider3', 'spider3', NULL);

INSERT INTO mcustomertable VALUES
  (1, 'news', 'NEWS', '', 1),
  (2, 'category', 'NEWSCLASS', '', 1);

INSERT INTO mcustomerfield VALUES
  (1, 'news.id', 'ID', 'int', 0, 0, '', 1, 1, '', 1),
  (2, 'news.title', 'TITLE', 'string', 0, 0, '', 0, 0, '', 1),
  (3, 'news.text', 'MAINTEXT', 'string', 0, 0, '', 0, 0, '', 1),
  (4, 'news.time', 'RELEASETIME', 'time', 0, 0, '', 0, 0, '', 1),
  (5, 'news.source', 'WEBSITE', 'string', 0, 0, '', 0, 0, '', 1),
  (6, 'news.url', 'URL', 'string', 0, 0, '', 0, 0, '', 1),
  (7, 'news.categoryid', 'CATEGORYID', 'int', 0, 0, '', 0, 0, '', 1),
  (8, 'news.sourceid', 'SOURCEID', 'string', 0, 0, '', 0, 0, '', 1),
	(9, 'news.downloadtime', 'createtime', 'time', 0, 0, '', 0, 0, '', 1);

insert into mcustomerfield values
  (10, 'category.id', 'id', 'int', 0, 0, '', 1, 1, '', 2),
  (11, 'category.name', 'classname', 'string', 0, 0, '', 0, 0, '', 2),
  (12, 'category.parentid', 'pid', 'int', 0, 0, '', 0, 0, '', 2),
  (13, 'category.keywords', 'keyword', 'string', 0, 0, '', 0, 0, '', 2);

insert into muser(name,loginName,password)values('admin','admin','admin');


use spider3user;

create table news (
  id INT NOT NULL auto_increment,
  title varchar(255),
  maintext longtext,
  releasetime timestamp default '0000-00-00 00:00',
  website varchar(255),
  url varchar(255),
  categoryid int,
  sourceid int,
  createtime TIMESTAMP DEFAULT now(),
  PRIMARY KEY(id)
);

create table newsclass (
  id INT not null auto_increment,
  classname varchar(255),
  pid int(20),
  keyword longtext,
  primary key(id)
);







