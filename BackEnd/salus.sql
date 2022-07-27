-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.8.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- salus 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `salus` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `salus`;

-- 테이블 salus.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `subjectNo` int(11) NOT NULL AUTO_INCREMENT,
  `board_gymId` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `writeDate` date NOT NULL,
  `hits` int(11) DEFAULT NULL,
  `firstRegist` datetime NOT NULL DEFAULT current_timestamp(),
  `updateRegist` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`subjectNo`),
  KEY `FK1_manager_board` (`board_gymId`) USING BTREE,
  CONSTRAINT `FK1_gymId_board` FOREIGN KEY (`board_gymId`) REFERENCES `gym` (`gymId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 salus.daily_routine 구조 내보내기
CREATE TABLE IF NOT EXISTS `daily_routine` (
  `dailyRoutineId` int(11) NOT NULL AUTO_INCREMENT,
  `excerciseDay` date NOT NULL,
  `progress` double DEFAULT NULL,
  `dailyExcerciseTime` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `oneDayRoutineTitle` varchar(20) NOT NULL,
  `firstRegist` datetime NOT NULL DEFAULT current_timestamp(),
  `updateRegist` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`dailyRoutineId`),
  KEY `FK_daily_routine_user` (`userId`),
  KEY `excerciseDay` (`excerciseDay`),
  KEY `FK_daily_routine_routine` (`oneDayRoutineTitle`),
  CONSTRAINT `FK_daily_routine_routine` FOREIGN KEY (`oneDayRoutineTitle`) REFERENCES `routine` (`oneDayRoutineTitle`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_daily_routine_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 salus.daily_routine_detail 구조 내보내기
CREATE TABLE IF NOT EXISTS `daily_routine_detail` (
  `dailyExcerciseId` int(11) NOT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `endTime` timestamp NULL DEFAULT NULL,
  `excerciseProgress` double DEFAULT NULL,
  `weightNow` int(11) DEFAULT NULL,
  `numberNow` int(11) DEFAULT NULL,
  `setNow` int(11) DEFAULT NULL,
  `excerciseDay` date NOT NULL,
  `dailyRoutineId` int(11) NOT NULL,
  `equipmentName` varchar(30) NOT NULL,
  `firstRegist` datetime NOT NULL,
  `updateRegist` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`dailyExcerciseId`),
  KEY `FK1_dailyroutineId` (`dailyRoutineId`),
  KEY `FK2_equipmentName` (`equipmentName`),
  CONSTRAINT `FK1_dailyroutineId` FOREIGN KEY (`dailyRoutineId`) REFERENCES `daily_routine` (`dailyRoutineId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2_equipmentName` FOREIGN KEY (`equipmentName`) REFERENCES `fitness_equiepment` (`equipmentName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 salus.fitness_equiepment 구조 내보내기
CREATE TABLE IF NOT EXISTS `fitness_equiepment` (
  `equipmentId` int(11) NOT NULL AUTO_INCREMENT,
  `equipmentName` varchar(64) NOT NULL,
  `equipmentCategory` varchar(20) DEFAULT NULL,
  `gymid` int(11) DEFAULT 0,
  `equipmentImage` varchar(64) NOT NULL,
  `equipmentStimulate` text DEFAULT NULL,
  `equipmentDescription` text DEFAULT NULL,
  `firstRegist` datetime NOT NULL DEFAULT current_timestamp(),
  `updateRegist` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`equipmentId`),
  KEY `equipmentCategory` (`equipmentCategory`),
  KEY `equipmentName` (`equipmentName`),
  KEY `FK_fitness equiepment_gym` (`gymid`),
  CONSTRAINT `FK_fitness equiepment_gym` FOREIGN KEY (`gymid`) REFERENCES `gym` (`gymId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 salus.gym 구조 내보내기
CREATE TABLE IF NOT EXISTS `gym` (
  `gymId` int(11) NOT NULL AUTO_INCREMENT,
  `gymName` varchar(50) NOT NULL,
  `gymAddress` text NOT NULL,
  `gymOpenTime` datetime DEFAULT NULL,
  `gymCloseTime` datetime DEFAULT NULL,
  `gymMap` varchar(50) DEFAULT NULL,
  `gymCurrentPerson` int(11) DEFAULT NULL,
  `firstRegist` datetime NOT NULL DEFAULT current_timestamp(),
  `updateRegist` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`gymId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 salus.inbody_profile 구조 내보내기
CREATE TABLE IF NOT EXISTS `inbody_profile` (
  `userid` int(11) NOT NULL,
  `rfidKey` bigint(20) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `skeletalMuscle` double DEFAULT NULL,
  `bmi` double DEFAULT NULL,
  `bmiBodyFat` double DEFAULT NULL,
  `waistHip` double DEFAULT NULL,
  `totalGrade` double DEFAULT NULL,
  `basalMetabolism` double DEFAULT NULL,
  `body` double DEFAULT NULL,
  `rightHand` double DEFAULT NULL,
  `leftHand` double DEFAULT NULL,
  `rightLeg` double DEFAULT NULL,
  `leftLeg` double DEFAULT NULL,
  `firstRegist` datetime NOT NULL DEFAULT current_timestamp(),
  `updateRegist` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`userid`),
  KEY `FK__user_2` (`rfidKey`),
  CONSTRAINT `FK__user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__user_2` FOREIGN KEY (`rfidKey`) REFERENCES `user` (`rfidKey`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 salus.manager 구조 내보내기
CREATE TABLE IF NOT EXISTS `manager` (
  `managerId` int(11) NOT NULL AUTO_INCREMENT,
  `managerLastName` varchar(20) NOT NULL,
  `managerFirstname` varchar(20) NOT NULL,
  `adminPassword` varchar(30) NOT NULL,
  `adminEmail` varchar(40) NOT NULL DEFAULT '',
  `gymId` int(11) DEFAULT NULL,
  `firstRegist` datetime NOT NULL DEFAULT current_timestamp(),
  `updateRegist` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`managerId`),
  UNIQUE KEY `adminEmail` (`adminEmail`),
  KEY `FK_manager_gym` (`gymId`),
  CONSTRAINT `FK_manager_gym` FOREIGN KEY (`gymId`) REFERENCES `gym` (`gymId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 salus.routine 구조 내보내기
CREATE TABLE IF NOT EXISTS `routine` (
  `routineId` int(11) NOT NULL,
  `oneDayRoutineTitle` varchar(20) DEFAULT NULL,
  `managerId` int(11) DEFAULT NULL,
  `repeatRoutineTitle` varchar(64) DEFAULT NULL,
  `oneDayRoutineDescription` varchar(40) DEFAULT NULL,
  `targetWeight` int(11) DEFAULT NULL,
  `targetCount` int(11) DEFAULT NULL,
  `targetSet` int(11) DEFAULT NULL,
  `targetTime` int(11) DEFAULT NULL,
  `equipmentName` varchar(64) DEFAULT NULL,
  `firstRegist` datetime NOT NULL DEFAULT current_timestamp(),
  `updateRegist` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`routineId`),
  KEY `fk1_manager_routine` (`managerId`),
  KEY `FK_routine_fitness_equiepment` (`equipmentName`),
  KEY `oneDayRoutineTitle` (`oneDayRoutineTitle`),
  CONSTRAINT `FK_routine_fitness_equiepment` FOREIGN KEY (`equipmentName`) REFERENCES `fitness_equiepment` (`equipmentName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk1_manager_routine` FOREIGN KEY (`managerId`) REFERENCES `manager` (`managerId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 salus.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `rfidKey` bigint(20) DEFAULT NULL,
  `rfidKey2` bigint(20) DEFAULT NULL,
  `rfidKey3` bigint(20) DEFAULT NULL,
  `email` varchar(40) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(30) DEFAULT '',
  `phone` varchar(20) DEFAULT '',
  `birthDay` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT '',
  `gymPassStart` date DEFAULT NULL,
  `gymPassEnd` date DEFAULT NULL,
  `excerciseStart` date DEFAULT NULL,
  `totalexcerciseTime` int(10) unsigned zerofill DEFAULT NULL,
  `dailyStart` datetime DEFAULT NULL,
  `dailyEnd` datetime DEFAULT NULL,
  `excerciseCheck` tinyint(4) DEFAULT NULL,
  `gymId` int(11) DEFAULT NULL,
  `firstRegist` datetime NOT NULL DEFAULT current_timestamp(),
  `updateRegist` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `rfidKey` (`rfidKey`),
  UNIQUE KEY `rfidKey2` (`rfidKey2`),
  UNIQUE KEY `rfidKey3` (`rfidKey3`),
  KEY `gymId` (`gymId`),
  CONSTRAINT `gymId` FOREIGN KEY (`gymId`) REFERENCES `gym` (`gymId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 salus.user-routine 구조 내보내기
CREATE TABLE IF NOT EXISTS `user-routine` (
  `userId` int(11) NOT NULL,
  `rfidKey` bigint(20) DEFAULT NULL,
  `routineId` int(11) NOT NULL,
  `firstRegist` datetime NOT NULL DEFAULT current_timestamp(),
  `updateRegist` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `FK1_user_routine` (`userId`),
  KEY `FK2_user-routine_user` (`rfidKey`),
  KEY `FK3_user-routineroutine` (`routineId`),
  CONSTRAINT `FK1_user_routine` FOREIGN KEY (`userId`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2_user-routine_user` FOREIGN KEY (`rfidKey`) REFERENCES `user` (`rfidKey`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK3_user-routineroutine` FOREIGN KEY (`routineId`) REFERENCES `routine` (`routineId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;