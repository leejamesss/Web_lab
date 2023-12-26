use library;
#删除email列
ALTER TABLE borrow_card DROP COLUMN email;
#添加email列
ALTER TABLE borrow_card ADD email VARCHAR(100);

UPDATE borrow_card SET email=CONCAT(id,'@stu.pku.edu.cn');

select * from borrow_card;