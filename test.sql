-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.36 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- test 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET euckr */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `test`;

-- 테이블 test.account 구조 내보내기
CREATE TABLE IF NOT EXISTS `account` (
  `account_num` char(100) NOT NULL COMMENT '계좌 번호',
  `id` char(100) NOT NULL COMMENT '계정 아이디',
  `USD` double NOT NULL DEFAULT '0' COMMENT '보유금',
  `JPY` double NOT NULL DEFAULT '0',
  `THB` double NOT NULL DEFAULT '0',
  `AUD` double NOT NULL DEFAULT '0',
  `CAD` double NOT NULL DEFAULT '0',
  `CHF` double NOT NULL DEFAULT '0',
  `CNY` double NOT NULL DEFAULT '0',
  `EUR` double NOT NULL DEFAULT '0',
  `GBP` double NOT NULL DEFAULT '0',
  `HKD` double NOT NULL DEFAULT '0',
  `NZD` double NOT NULL DEFAULT '0',
  `SGD` double NOT NULL DEFAULT '0',
  `KRW` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_num`),
  KEY `id` (`id`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COMMENT='계좌';

-- 테이블 데이터 test.account:~0 rows (대략적) 내보내기

-- 테이블 test.bank 구조 내보내기
CREATE TABLE IF NOT EXISTS `bank` (
  `b_name` char(100) NOT NULL,
  `charge` double NOT NULL COMMENT '은행 별 수수료',
  PRIMARY KEY (`b_name`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COMMENT='은행 별 수수료';

-- 테이블 데이터 test.bank:~16 rows (대략적) 내보내기
INSERT INTO `bank` (`b_name`, `charge`) VALUES
	('BNK경남', 1.75),
	('BNK부산', 1.75),
	('DGB대구', 1.75),
	('IBK기업', 1.75),
	('KB국민', 1.75),
	('KDB산업', 1.5),
	('NH농협', 1.75),
	('SC제일', 1.75),
	('Sh수협', 1.9),
	('광주', 1.75),
	('신한', 1.75),
	('우리', 1.75),
	('전북', 1.75),
	('제주', 1.75),
	('하나', 1.75),
	('한국씨티', 1.75);

-- 테이블 test.currency_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `currency_info` (
  `cur_unit` char(100) NOT NULL COMMENT '화폐 코드',
  `name` char(100) NOT NULL COMMENT '국가명',
  `cur_nm` char(100) NOT NULL COMMENT '화폐 이름',
  PRIMARY KEY (`cur_unit`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COMMENT='화폐 정보';

-- 테이블 데이터 test.currency_info:~13 rows (대략적) 내보내기
INSERT INTO `currency_info` (`cur_unit`, `name`, `cur_nm`) VALUES
	('AUD', '호주', '호주 달러'),
	('CAD', '캐나다', '캐나다 달러'),
	('CHF', '스위스', '스위스 프랑'),
	('CNY', '중국', '중국 위안'),
	('EUR', '유럽', '유럽 유로'),
	('GBP', '영국', '영국 파운드'),
	('HKD', '홍콩', '홍콩 달러'),
	('JPY(100)', '일본', '일본 엔'),
	('KRW', '한국', '한국 원'),
	('NZD', '뉴질랜드', '뉴질랜드 달러'),
	('SGD', '싱가포르', '싱가포르 달러'),
	('THB', '태국', '태국 바트'),
	('USD', '미국', '미국 달러');

-- 테이블 test.exchange_rate 구조 내보내기
CREATE TABLE IF NOT EXISTS `exchange_rate` (
  `DAY` date NOT NULL,
  `USD` double NOT NULL DEFAULT '0' COMMENT '환율',
  `JPY` double NOT NULL DEFAULT '0',
  `THB` double NOT NULL DEFAULT '0',
  `AUD` double NOT NULL DEFAULT '0',
  `CAD` double NOT NULL DEFAULT '0',
  `CHF` double NOT NULL DEFAULT '0',
  `CNY` double NOT NULL DEFAULT '0',
  `EUR` double NOT NULL DEFAULT '0',
  `GBP` double NOT NULL DEFAULT '0',
  `HKD` double NOT NULL DEFAULT '0',
  `NZD` double NOT NULL DEFAULT '0',
  `SGD` double NOT NULL DEFAULT '0',
  `KRW` double NOT NULL DEFAULT '1000000',
  PRIMARY KEY (`DAY`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COMMENT='날짜별 환율';

-- 테이블 데이터 test.exchange_rate:~7 rows (대략적) 내보내기
INSERT INTO `exchange_rate` (`DAY`, `USD`, `JPY`, `THB`, `AUD`, `CAD`, `CHF`, `CNY`, `EUR`, `GBP`, `HKD`, `NZD`, `SGD`, `KRW`) VALUES
	('2024-02-07', 1329.6, 899.65, 37.37, 867.83, 985.84, 1528.98, 184.51, 1430.12, 1675.76, 169.97, 811.19, 989.32, 1),
	('2024-02-08', 1325.3, 895.2, 37.21, 864.49, 984.47, 1515.84, 184.13, 1427.94, 1673.59, 169.5, 809.89, 986.56, 1),
	('2024-02-09', 1325.3, 895.2, 37.21, 864.49, 984.47, 1515.84, 184.13, 1427.94, 1673.59, 169.5, 809.89, 986.56, 1),
	('2024-02-10', 1325.3, 895.2, 37.21, 864.49, 984.47, 1515.84, 184.13, 1427.94, 1673.59, 169.5, 809.89, 986.56, 1),
	('2024-02-11', 1325.3, 895.2, 37.21, 864.49, 984.47, 1515.84, 184.13, 1427.94, 1673.59, 169.5, 809.89, 986.56, 1),
	('2024-02-12', 1325.3, 895.2, 37.21, 864.49, 984.47, 1515.84, 184.13, 1427.94, 1673.59, 169.5, 809.89, 986.56, 1),
	('2024-02-13', 1327.2, 888.8, 36.96, 866.6, 986.62, 1515.33, 184.2, 1429.66, 1675.92, 169.77, 813.57, 986.88, 1);

-- 테이블 test.ex_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `ex_history` (
  `ex_num` int NOT NULL AUTO_INCREMENT COMMENT '환전 번호',
  `ex_account_num` char(100) NOT NULL COMMENT '환전 계좌 번호',
  `day` date NOT NULL COMMENT '환전일',
  `sell_cur` char(100) NOT NULL COMMENT '판매 화폐',
  `sell_amt` double NOT NULL DEFAULT (0) COMMENT '판매 수량',
  `buy_cur` char(100) NOT NULL COMMENT '구매 화폐',
  `buy_amt` double NOT NULL DEFAULT (0) COMMENT '구매 수량',
  `rate` double NOT NULL COMMENT '환율',
  PRIMARY KEY (`ex_num`),
  KEY `ex_account_num` (`ex_account_num`),
  CONSTRAINT `ex_history_ibfk_1` FOREIGN KEY (`ex_account_num`) REFERENCES `account` (`account_num`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COMMENT='환전 내역';

-- 테이블 데이터 test.ex_history:~0 rows (대략적) 내보내기

-- 테이블 test.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `id` char(100) NOT NULL COMMENT '계정 아이디',
  `pwd` char(255) CHARACTER SET euckr COLLATE euckr_korean_ci NOT NULL COMMENT '계정 비밀번호',
  `name` char(10) NOT NULL COMMENT '회원 이름',
  `email` char(100) NOT NULL COMMENT '회원 이메일',
  `phone_num` char(100) NOT NULL COMMENT '휴대폰 번호',
  `admin` tinyint(1) DEFAULT '0' COMMENT '관리자 권한 여부',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COMMENT='회원 정보';

-- 테이블 데이터 test.member:~1 rows (대략적) 내보내기
INSERT INTO `member` (`id`, `pwd`, `name`, `email`, `phone_num`, `admin`) VALUES
	('admin', 'admin', '관리자', 'admin@gmail.com', '010-0000-0000', 1);

-- 테이블 test.qa 구조 내보내기
CREATE TABLE IF NOT EXISTS `qa` (
  `qa_num` int NOT NULL AUTO_INCREMENT COMMENT '1대1 상담 번호',
  `id` char(100) NOT NULL COMMENT '상담 회원 계정 id',
  `qa_date` date NOT NULL COMMENT '상담일자',
  `qa_memo` char(100) NOT NULL COMMENT '상담 사유',
  PRIMARY KEY (`qa_num`),
  KEY `id` (`id`),
  CONSTRAINT `qa_ibfk_1` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COMMENT='1대1 상담 내역';

-- 테이블 데이터 test.qa:~0 rows (대략적) 내보내기

-- 테이블 test.trade_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `trade_history` (
  `trade_num` int NOT NULL AUTO_INCREMENT COMMENT '교환 번호',
  `trader_account_1` char(100) NOT NULL COMMENT '교환자1 계좌 번호',
  `trader_account_2` char(100) CHARACTER SET euckr COLLATE euckr_korean_ci DEFAULT NULL COMMENT '교환자2 계좌 번호',
  `day` date NOT NULL COMMENT '교환일',
  `sell_cur` char(100) NOT NULL COMMENT '판매 화폐',
  `sell_amt` double NOT NULL DEFAULT (0) COMMENT '판매 수량',
  `buy_cur` char(100) NOT NULL COMMENT '구매 화폐',
  `buy_amt` double NOT NULL DEFAULT (0) COMMENT '구매 수량',
  `rate` double NOT NULL COMMENT '환율',
  `CHECK1` tinyint(1) NOT NULL DEFAULT '0',
  `CHECK2` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`trade_num`),
  KEY `trader_account_1` (`trader_account_1`),
  KEY `trader_account_2` (`trader_account_2`),
  CONSTRAINT `trade_history_ibfk_1` FOREIGN KEY (`trader_account_1`) REFERENCES `account` (`account_num`),
  CONSTRAINT `trade_history_ibfk_2` FOREIGN KEY (`trader_account_2`) REFERENCES `account` (`account_num`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COMMENT='교환 내역';

-- 테이블 데이터 test.trade_history:~0 rows (대략적) 내보내기

-- 테이블 test.withdraw_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `withdraw_history` (
  `with_num` int NOT NULL AUTO_INCREMENT COMMENT '출금 번호',
  `account_num` char(100) NOT NULL COMMENT '출금 계좌 번호',
  `date` date NOT NULL COMMENT '출금 날짜',
  `cur_unit` char(100) NOT NULL COMMENT '출금 화폐',
  `amount` double NOT NULL DEFAULT (0) COMMENT '출금 수량',
  `b_name` char(100) NOT NULL COMMENT '은행 명',
  `charge` double NOT NULL COMMENT '은행 별 수수료',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '수령 여부',
  PRIMARY KEY (`with_num`),
  KEY `b_name` (`b_name`),
  KEY `account_num` (`account_num`),
  CONSTRAINT `withdraw_history_ibfk_1` FOREIGN KEY (`b_name`) REFERENCES `bank` (`b_name`),
  CONSTRAINT `withdraw_history_ibfk_2` FOREIGN KEY (`account_num`) REFERENCES `account` (`account_num`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COMMENT='출금 내역';

-- 테이블 데이터 test.withdraw_history:~0 rows (대략적) 내보내기

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
