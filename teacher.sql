-- auto-generated definition
create role teacher;
grant student 
to teacher;
grant SELECT,UPDATE,DROP,INSERT
    ON TABLE lib.questions
    TO teacher;





