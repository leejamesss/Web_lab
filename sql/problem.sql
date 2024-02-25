Use library;
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem`(
                          `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          `A` VARCHAR(255) NOT NULL,
                          `B` VARCHAR(255) NOT NULL,
                          `C` VARCHAR(255) NOT NULL,
                          `D` VARCHAR(255) NOT NULL,
                          `question` TEXT NOT NULL,
                          `answer` VARCHAR(255) NOT NULL,
                          `testpoint` VARCHAR(255) NOT NULL,
                          `course` VARCHAR(255) NOT NULL,
                          `analysis` TEXT,
                          `correct` BOOLEAN NOT NULL,
                          `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO problem (A, B, C, D, question, answer, testpoint, course, analysis,correct) VALUES
                                                                         ('访问控制', '数据完整性', '数据备份和恢复', '数据库优化', '下列哪项是数据库安全性控制的重要内容？', '1', '安全性控制' ,'数据库', '数据库安全性控制中，访问控制是非常重要的内容，它涉及对用户和程序访问数据库的权限管理，是保障数据库安全性的重要手段。数据完整性主要关注数据的正确性和一致性，数据备份和恢复是防止数据丢失的重要手段，数据库优化是提高数据库性能的方法。',true),
                                                                         ('锁', '视图', '游标', '存储过程', '数据库并发控制中常用的机制是？', '1', '并发控制','数据库', '数据库并发控制中，常用的机制包括锁、MVCC（多版本并发控制）等。锁是最常见的并发控制机制，用于管理事务对数据的访问，确保数据的一致性和完整性。视图是对数据库表查询结果的虚拟表，游标用于遍历查询结果集，存储过程是一系列SQL语句的集合。',true),
                                                                         ('数据库管理员', '数据库设计师', '数据库开发人员', '数据库用户', '下列哪个角色通常拥有对数据库完全的控制权？', '1', '数据库角色','数据库', '数据库管理员通常拥有对数据库完全的控制权，可以进行数据库的备份和恢复、用户权限的管理、性能优化等操作。数据库设计师负责设计数据库的结构和组织方式，数据库开发人员负责编写和维护数据库应用程序，数据库用户则是使用数据库进行数据操作的人员。',true);