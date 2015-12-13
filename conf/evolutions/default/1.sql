# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table project (
  id                        bigint not null,
  name                      varchar(255),
  folder                    varchar(255),
  constraint pk_project primary key (id))
;

create table task (
  id                        bigint not null,
  title                     varchar(255),
  done                      boolean,
  due_date                  timestamp,
  folder                    varchar(255),
  assigned_to_email         varchar(255),
  project_id                bigint,
  constraint pk_task primary key (id))
;

create table member (
  email                     varchar(255) not null,
  name                      varchar(255),
  password                  varchar(255),
  constraint pk_member primary key (email))
;


create table project_member (
  project_id                     bigint not null,
  member_email                     varchar(255) not null,
  constraint pk_project_member primary key (project_id, member_email))
;
create sequence project_seq;

create sequence task_seq;

create sequence member_seq;

alter table task add constraint fk_task_assignedTo_1 foreign key (assigned_to_email) references member (email) on delete restrict on update restrict;
create index ix_task_assignedTo_1 on task (assigned_to_email);
alter table task add constraint fk_task_project_2 foreign key (project_id) references project (id) on delete restrict on update restrict;
create index ix_task_project_2 on task (project_id);



alter table project_member add constraint fk_project_member_project_01 foreign key (project_id) references project (id) on delete restrict on update restrict;

alter table project_member add constraint fk_project_member_member_02 foreign key (member_email) references member (email) on delete restrict on update restrict;

# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists project;

drop table if exists project_member;

drop table if exists task;

drop table if exists member;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists project_seq;

drop sequence if exists task_seq;

drop sequence if exists member_seq;

