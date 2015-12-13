# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table member (
  email                     varchar(255) not null,
  name                      varchar(255),
  password                  varchar(255),
  constraint pk_member primary key (email))
;

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


create table project_member (
  project_id                     bigint not null,
  member_email                   varchar(255) not null,
  constraint pk_project_member primary key (project_id, member_email))
;
create sequence member_seq;

create sequence project_seq;

create sequence task_seq;

alter table task add constraint fk_task_assignedTo_1 foreign key (assigned_to_email) references member (email);
create index ix_task_assignedTo_1 on task (assigned_to_email);
alter table task add constraint fk_task_project_2 foreign key (project_id) references project (id);
create index ix_task_project_2 on task (project_id);



alter table project_member add constraint fk_project_member_project_01 foreign key (project_id) references project (id);

alter table project_member add constraint fk_project_member_member_02 foreign key (member_email) references member (email);

# --- !Downs

drop table if exists member cascade;

drop table if exists project cascade;

drop table if exists project_member cascade;

drop table if exists task cascade;

drop sequence if exists member_seq;

drop sequence if exists project_seq;

drop sequence if exists task_seq;

