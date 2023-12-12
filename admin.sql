-- auto-generated definition
create role admin;

grant SELECT,UPDATE,DROP,INSERT
ON TABLE lib.announcement
TO admin;

grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.borrow_card
    TO admin;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.library
    TO admin;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.manager
    TO admin;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.rules
    TO admin;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.message
    TO admin;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.acheivement
    TO admin;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.course
    TO admin;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.courseinfo
    TO admin;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.`discussion(up)`
    TO admin;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.`do(sq)`
    TO admin;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.`teaching(tc)`
    TO admin;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.teacher
    TO admin;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.student
    TO admin;