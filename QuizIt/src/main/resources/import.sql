INSERT INTO department (name) VALUES ('Department 1');
INSERT INTO department (name) VALUES ('Department 2');
INSERT INTO department (name) VALUES ('Department 3');

INSERT INTO project (name) VALUES ('Project 1');
INSERT INTO project (name) VALUES ('Project 2');
INSERT INTO project (name) VALUES ('Project 3');


insert into `user`
values (1,0,"aaa","$2a$10$/h6x4IPW4SLvNL2p2N6EvOOzLX66va20TvnR4edlKhdFRwOSZE71.","ROLE_ADMIN","admin",null),
       (2,0,"bbb","$2a$10$o.76NoIpMLz/K.m8VUOvuuAOTwH22qbgcme5DMpxqCbjt.FqewAqy","ROLE_USER","user",null),
       (3,0,"ccc","$2a$10$C6.pakSJu5GcqV92leaBm.EH7n8HFgZUlh.7mucaCykoc0mogn39u","ROLE_ADMIN","1234",null);

/* Accounts:    User        PW
                admin       admin
                user        user
                1234        admin
 */
