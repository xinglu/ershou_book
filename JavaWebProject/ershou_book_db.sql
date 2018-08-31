-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(30)  NOT NULL COMMENT 'user_name',
  `password` varchar(30)  NOT NULL COMMENT '��¼����',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `gender` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthDate` varchar(20)  NULL COMMENT '��������',
  `userPhoto` varchar(60)  NOT NULL COMMENT '�û���Ƭ',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `email` varchar(50)  NOT NULL COMMENT '����',
  `address` varchar(80)  NULL COMMENT '��ͥ��ַ',
  `regTime` varchar(20)  NULL COMMENT 'ע��ʱ��',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_bookClass` (
  `bookClassId` int(11) NOT NULL AUTO_INCREMENT COMMENT '�����',
  `bookClassName` varchar(20)  NOT NULL COMMENT '�������',
  PRIMARY KEY (`bookClassId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_bookSeek` (
  `seekId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��id',
  `bookPhoto` varchar(60)  NOT NULL COMMENT 'ͼ����ͼ',
  `bookName` varchar(20)  NOT NULL COMMENT 'ͼ������',
  `bookClassObj` int(11) NOT NULL COMMENT 'ͼ�����',
  `publish` varchar(50)  NOT NULL COMMENT '������',
  `author` varchar(20)  NOT NULL COMMENT '����',
  `price` float NOT NULL COMMENT '�󹺼۸�',
  `xjcd` varchar(20)  NOT NULL COMMENT '�¾ɳ̶�',
  `seekDesc` varchar(5000)  NOT NULL COMMENT '��˵��',
  `userObj` varchar(30)  NOT NULL COMMENT '�����û�',
  `addTime` varchar(20)  NULL COMMENT '�û�����ʱ��',
  PRIMARY KEY (`seekId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_bookSell` (
  `sellId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `bookPhoto` varchar(60)  NOT NULL COMMENT 'ͼ����ͼ',
  `bookName` varchar(20)  NOT NULL COMMENT 'ͼ������',
  `bookClassObj` int(11) NOT NULL COMMENT 'ͼ�����',
  `publish` varchar(20)  NOT NULL COMMENT '������',
  `author` varchar(20)  NOT NULL COMMENT '����',
  `sellPrice` float NOT NULL COMMENT '���ۼ۸�',
  `xjcd` varchar(20)  NOT NULL COMMENT '�¾ɳ̶�',
  `sellDesc` varchar(5000)  NOT NULL COMMENT '����˵��',
  `userObj` varchar(30)  NOT NULL COMMENT '�����û�',
  `addTime` varchar(20)  NULL COMMENT '�û�����ʱ��',
  PRIMARY KEY (`sellId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_bookOrder` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `bookSellObj` int(11) NOT NULL COMMENT 'ͼ����Ϣ',
  `userObj` varchar(30)  NOT NULL COMMENT '�����û�',
  `price` float NOT NULL COMMENT '�������',
  `orderMemo` varchar(500)  NULL COMMENT '�û���ע',
  `addTime` varchar(20)  NULL COMMENT '�µ�ʱ��',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_leaveword` (
  `leaveWordId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `leaveTitle` varchar(80)  NOT NULL COMMENT '���Ա���',
  `leaveContent` varchar(2000)  NOT NULL COMMENT '��������',
  `userObj` varchar(30)  NOT NULL COMMENT '������',
  `leaveTime` varchar(20)  NULL COMMENT '����ʱ��',
  `replyContent` varchar(1000)  NULL COMMENT '����ظ�',
  `replyTime` varchar(20)  NULL COMMENT '�ظ�ʱ��',
  PRIMARY KEY (`leaveWordId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_notice` (
  `noticeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `title` varchar(80)  NOT NULL COMMENT '����',
  `content` varchar(5000)  NOT NULL COMMENT '��������',
  `publishDate` varchar(20)  NULL COMMENT '����ʱ��',
  PRIMARY KEY (`noticeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_bookSeek ADD CONSTRAINT FOREIGN KEY (bookClassObj) REFERENCES t_bookClass(bookClassId);
ALTER TABLE t_bookSeek ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_bookSell ADD CONSTRAINT FOREIGN KEY (bookClassObj) REFERENCES t_bookClass(bookClassId);
ALTER TABLE t_bookSell ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_bookOrder ADD CONSTRAINT FOREIGN KEY (bookSellObj) REFERENCES t_bookSell(sellId);
ALTER TABLE t_bookOrder ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_leaveword ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);


