-- auto-generated definition
create role student;

grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.message
    TO teacher;
grant SELECT,UPDATE
    ON TABLE lib.borrow_card
    TO teacher;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.`acheive(ua)`
    TO teacher;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.`discussion(up)`
    TO teacher;
grant SELECT
    ON TABLE lib.announcement
    TO teacher;
grant SELECT
    ON TABLE lib.bookinfo
    TO teacher;
grant SELECT
    ON TABLE lib.books
    TO teacher;
grant SELECT
    ON TABLE lib.borrow_books
    TO teacher;
grant SELECT
    ON TABLE lib.rules
    TO teacher;
grant SELECT
    ON TABLE lib.library
    TO teacher;
grant SELECT
    ON TABLE lib.course
    TO teacher;
grant SELECT
    ON TABLE lib.courseinfo
    TO teacher;
grant SELECT
    ON TABLE lib.questions
    TO teacher;
grant SELECT
    ON TABLE lib.`teaching(tc)`
    TO teacher;

grant student
TO teacher;