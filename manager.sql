-- auto-generated definition
create role manager;
grant SELECT
    ON TABLE lib.announcement
    TO manager;
grant SELECT
    ON TABLE lib.books
    TO manager;

grant SELECT
    ON TABLE lib.borrow_card
    TO manager;
grant SELECT
    ON TABLE lib.library
    TO manager;
grant SELECT
    ON TABLE lib.rules
    TO manager;
grant SELECT
    ON TABLE lib.courseinfo
    TO manager;
grant SELECT
    ON TABLE lib.course
    TO manager;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.bookinfo
    TO manager;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.book_sort
    TO manager;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.borrow_books
    TO manager;
grant SELECT,UPDATE
    ON TABLE lib.manager
    TO manager;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.`discussion(up)`
    TO manager;