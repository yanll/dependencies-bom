

drop table if exists `tbl_portal`;



create table `tbl_portal` (
  `id` bigint(20) unsigned not null auto_increment comment '主键',
  `major` varchar(128) not null,
  `category` varchar(128) not null default '',
  `instance` varchar(128) not null default '',
  `hierarchy` varchar(16) not null comment 'major/category/instance',
  `title` varchar(128) not null default '' comment '标题',
  `icon_url` varchar(256) not null default '' comment '图标地址',
  `img_url` varchar(256) not null default '' comment '图片地址',
  `target_type` varchar(64) not null default '' comment '目标跳转类型',
  `target_url` varchar(256) not null default '' comment '目标跳转地址',
  `target_params` varchar(256) not null default '' comment '目标跳转参数：{}（格式：JSON Object）',
  `portal_sequence` bigint(20) null comment '排序',
  `portal_status` varchar(32) not null default 'ENABLED' comment 'ENABLED、DISABLED、DELETED',
  `description` varchar(256) not null default '' comment '备注',
  `version` varchar(64) not null default '' comment '备注',
  `create_time` datetime null comment '创建时间',
  `modify_time` datetime null comment '最后修改时间',
  primary key (`id`)
) engine=innodb auto_increment=10001 default charset=utf8 comment='portal';

ALTER TABLE `tbl_portal` ADD INDEX tbl_portal_idx_major (`major`);
ALTER TABLE `tbl_portal` ADD INDEX tbl_portal_idx_category (`category`);
ALTER TABLE `tbl_portal` ADD INDEX tbl_portal_idx_instance (`instance`);
ALTER TABLE `tbl_portal` ADD INDEX tbl_portal_idx_portal_status (`portal_status`);



insert into tbl_portal(major,title,version,hierarchy)values('workstation','','1.0.0','major');
insert into tbl_portal(major,category,title,hierarchy)values('workstation','banner','','category');
insert into tbl_portal(major,category,instance,title,hierarchy)values('workstation','banner','welcome','欢迎来到蜂鸟工作台','instance');
insert into tbl_portal(major,category,instance,title,hierarchy)values('workstation','base_app','','基础应用','category');
insert into tbl_portal(major,category,instance,title,hierarchy)values('workstation','base_app','wiki','WIKI','instance');
insert into tbl_portal(major,category,instance,title,hierarchy)values('workstation','base_app','receipt','发票助手','instance');
insert into tbl_portal(major,category,instance,title,hierarchy)values('workstation','business_app','','业务应用','category');
insert into tbl_portal(major,category,instance,title,hierarchy)values('workstation','business_app','security','安全精灵','instance');
insert into tbl_portal(major,category,instance,title,hierarchy)values('workstation','business_app','op','易宝工单','instance');






CREATE TABLE tbl_secret_key (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
	key_code VARCHAR(64) NOT NULL COMMENT '秘钥编码',
	key_type VARCHAR(64) NOT NULL COMMENT '秘钥类型',
	key_rule VARCHAR(64) NOT NULL COMMENT '秘钥规则',
	status VARCHAR(64) NOT NULL	COMMENT '状态',
	key_content VARCHAR(256) NOT NULL COMMENT '秘钥内容',
	effect_datetime DATETIME COMMENT '生效时间',
	created_datetime DATETIME NOT NULL COMMENT '创建时间',
	last_modified_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP	COMMENT '最后修改时间',
	PRIMARY KEY (id)
) ENGINE = InnoDB AUTO_INCREMENT = 100 DEFAULT CHARSET = utf8;

ALTER TABLE tbl_secret_key ADD INDEX tbl_secret_key_idx_key_code (`key_code`);

alter table hbird.tbl_user_info add job_addr varchar(64) Null;

