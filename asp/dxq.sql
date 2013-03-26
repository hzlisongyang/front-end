-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2012 年 08 月 15 日 09:48
-- 服务器版本: 5.00.15
-- PHP 版本: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `dxq`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `account` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`account`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `xkId` varchar(100) NOT NULL COMMENT '选课号',
  `kcId` varchar(100) NOT NULL COMMENT '课程号',
  `name` varchar(50) NOT NULL COMMENT '课程名',
  `time` varchar(50) NOT NULL COMMENT '上课时间',
  `address` varchar(50) NOT NULL COMMENT '上课地址',
  `numbers` int(5) NOT NULL COMMENT '人数',
  `grade` varchar(10) NOT NULL COMMENT '年级',
  `teacher` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY  (`xkId`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- 转存表中的数据 `course`
--

INSERT INTO `course` (`xkId`, `kcId`, `name`, `time`, `address`, `numbers`, `grade`, `teacher`, `date`) VALUES
('C01041-J01082-1-2011-2012', 'C01041', '实践教育 （三）', '25/06-04/07', '理4-209', 20, '09', '胡兴桥', '2011-2012-2'),
('C01042-J01082-1-2011-2012', 'C01042', '实践教育 （四）', '25/06-04/07', '理4-209', 10, '09', '胡兴桥', '2011-2012-2'),
('C01043-J01082-1-2011-2012', 'C01043', '数据库', '1111', '理四', 50, '10', '胡兴桥', '2011-2012-2'),
('C01044-J01082-1-2011-2012', 'C01044', 'ASP', '22222', '理四', 50, '11', '胡兴桥', '2011-2012-2'),
('C01045-J01082-1-2011-2012', 'C01045', '网页设计', '1111', '理四', 50, '09', '胡兴桥', '2011-2012-2'),
('C01047-J01082-1-2011-2012', 'C01041', '实践教育 （三）', '25/06-04/07', '理4-209', 20, '09', 'hu', '2011-2012-2');

-- --------------------------------------------------------

--
-- 表的结构 `elective`
--

CREATE TABLE IF NOT EXISTS `elective` (
  `xkId` varchar(100) NOT NULL,
  `sId` varchar(50) NOT NULL COMMENT '学号',
  `Score` int(11) NOT NULL default '0' COMMENT '评分'
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- 转存表中的数据 `elective`
--

INSERT INTO `elective` (`xkId`, `sId`, `Score`) VALUES
('C01041-J01082-1-2011-2012', '30901357', 0),
('C01042-J01082-1-2011-2012', '30901357', 0),
('C01045-J01082-1-2011-2012', '30901357', 0),
('C01043-J01082-1-2011-2012', '30901358', 0),
('C01044-J01082-1-2011-2012', '30901359', 0),
('C01041-J01082-1-2011-2012', '30901358', 5),
('C01041-J01082-1-2011-2012', '30901359', 5),
('C01047-J01082-1-2011-2012', '30901359', 4),
('C01041-J01082-1-2011-2012', '30901360', 5);

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `sId` varchar(50) NOT NULL COMMENT '学号',
  `name` varchar(50) character set gb2312 NOT NULL COMMENT '姓名',
  `password` varchar(50) character set gb2312 NOT NULL COMMENT '密码',
  `class` varchar(50) character set gb2312 NOT NULL COMMENT '班级',
  `tel` varchar(12) character set gb2312 NOT NULL COMMENT '手机号',
  PRIMARY KEY  (`sId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `student`
--

INSERT INTO `student` (`sId`, `name`, `password`, `class`, `tel`) VALUES
('30901356', '李松阳', '30901357', '计算0908', '15068107015'),
('30901357', '李松阳', '30901357', '计算0908', '15068107015'),
('30901358', '李松阳', '30901357', '计算0908', '15068107015'),
('30901359', '李松阳', '30901357', '计算0910', '15068107015'),
('30901360', '李松阳', '30901357', '计算0911', '15068107015');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
