
drop table if exists `tbl_form_type`;
drop table if exists `tbl_form`;
drop table if exists `tbl_form_column`;
drop table if exists `tbl_form_data`;



create table `tbl_form_type` (
  `id` bigint(20) unsigned not null auto_increment comment '主键',
  `form_type_code` varchar(128) not null comment '表单类型代码',
  `form_type_name` varchar(128) not null comment '表单类型名称',
  `create_user_id` varchar(256) null comment '创建者用户主键',
  `form_type_status` varchar(32) not null default 'ENABLED' comment 'ENABLED、DISABLED、DELETED',
  `description` varchar(256) null comment '备注',
  `create_time` datetime null comment '创建时间',
  `modify_time` datetime null comment '最后修改时间',
  primary key (`id`)
) engine=innodb auto_increment=10001 default charset=utf8 comment='表单信息';



create table `tbl_form` (
  `id` bigint(20) unsigned not null auto_increment comment '主键',
  `form_type_code` varchar(64) not null comment '表单类型代码',
  `form_name` varchar(128) not null comment '表单名称',
  `form_design` text null comment '表单设计内容',
  `form_scope` varchar(256) null comment '表单可见范围',
  `form_scope_name` varchar(512) null comment '表单可见范围名称',
  `create_user_id` varchar(256) null comment '创建者用户主键',
  `form_status` varchar(32) not null default 'EDITING' comment 'EDITING、PUBLISHED、FINISHED、DELETED',
  `description` varchar(256) null comment '备注',
  `create_time` datetime null comment '创建时间',
  `modify_time` datetime null comment '最后修改时间',
  primary key (`id`)
) engine=innodb auto_increment=10001 default charset=utf8 comment='表单信息';




create table `tbl_form_column` (
  `id` bigint(20) unsigned not null auto_increment comment '主键',
  `form_id` bigint(64) not null comment '表单主键',
  `column_code` varchar(128) not null comment '表单字段',
  `column_name` varchar(128) not null comment '表单字段名称',
  `column_data_type` varchar(128) null comment '表单字段数据类型',
  `element_type` varchar(128) null comment '表单元素类型',
  `create_user_id` varchar(256) null comment '创建者用户主键',
  `form_column_status` varchar(32) not null default 'EDITING' comment 'EDITING、PUBLISHED、FINISHED、DELETED',
  `create_time` datetime null comment '创建时间',
  `modify_time` datetime null comment '最后修改时间',
  primary key (`id`)
) engine=innodb auto_increment=10001 default charset=utf8 comment='表单字段信息';


create table `tbl_form_data` (
  `id` bigint(20) unsigned not null auto_increment comment '主键',
  `form_id` bigint(64) not null comment '表单主键',
  `row_uuid` varchar(128) not null comment '表单记录主键（GROUP）',
  `column_code` varchar(128) not null comment '表单字段',
  `column_value` varchar(2048) null comment '表单字段值',
  `create_user_id` varchar(256) null comment '创建者用户主键',
  `create_time` datetime null comment '创建时间',
  `modify_time` datetime null comment '最后修改时间',
  primary key (`id`)
) engine=innodb auto_increment=10001 default charset=utf8 comment='表单字段值信息';




insert into tbl_form_type(form_type_code,form_type_name)values('SHANGBAOFULI','商保福利');

insert into tbl_form(form_type_code,form_name)values('SHANGBAOFULI','为配偶投保');
insert into tbl_form(form_type_code,form_name)values('SHANGBAOFULI','为子女投保');


update tbl_app_portal set corp_id='356e1dc1-4c11-419b-a043-cccb537dfb9b' where portal_status='ENABLED';

alter table tbl_form add img_url varchar(256) null comment '图片地址';