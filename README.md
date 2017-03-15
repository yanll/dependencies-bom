# dependencies-bom

    项目依赖定义




### 简介：
    * 功能：
    * 项目构建、管理、持续集成的工具
    * 提供了帮助管理、构建、文档、报告、依赖、SCMS、发布、分发等支持
    * 将项目过程规范化、自动化、高效化

    * 对比：
	* Ant：功能强大，配置复杂，无仓库概念
	* Maven：配置简单，仓库，强标准化
	* Gradle：配置简单，仓库，语法灵活，弱标准化
	* 总结：标准的好处，自由的代价


### 图示中央仓库、私服仓库、本地仓库、target：
    关系
    编译、依赖顺序
    依赖安装、部署

### Maven conf/settings.xml、.m2/settings.xml、pom.xml
    三者配置关系
    顺序
    配置建议
    settings.xml：结合实际项目配置讲解
        profile：JDK、编码等提取到项目pom中，解耦
        server：
        mirrors：
        repositories:
        activeProfiles:


### 约定优于配置：
    约定俗成，强标准化
    优先配置pom而非IDE，与IDE及开发环境解耦


### 图示生命周期：
    clean、compile、package、install、deploy
    jar、war、ear...

### 特点（图示）：
    工程聚合
        module
    依赖传递与排除依赖
        就近原则，优先使用依赖关系最短的引用
        排除传递依赖（依赖冲突）
    配置继承
        关键点：*Management，带Management与不带Management的场景
    filter机制（变量编译）
    	    二机制文件排除方案（公钥私钥文件、dat数据等文件应禁止filter）：
    	    1.assembly.xml:fileSet filter=false
    	    2.resources:配置文件排除
    插件机制（摆放）


### pom.xml配置关键点：
    <modelVersion>4.0.0</modelVersion>
    坐标：
    <groupId>com.yanll</groupId>
    <artifactId>dependencies-bom</artifactId>
    <version>1.0-SNAPSHOT</version>
    类型：
    <packaging>pom</packaging>

	parent
	profiles
	modules
	distributionManagement
	repositories
    properties
    dependencyManagement 定义但不限制必须使用
    dependencies
	build
	    plugins
        <finalName>${finalName}</finalName>
        <defaultGoal>install</defaultGoal>
        <resources>
            <resource>
                <directory>src/main/resources</directory>
                <filtering>true</filtering>
            </resource>
        </resources>


### 标准插件：
    maven-war-plugin、maven-jar-plugin、maven-compile-plugin、maven-resources-plugin
    与packaging、Lifecycle的绑定关系

### 常用插件：
    spring-boot-maven-plugin
    结合当前项目讲解以下插件
    http://www.infoq.com/cn/profile/许晓斌

### 单元测试：

### 结合当前项目讲解自动化构建及部署：



### 扩展：
    基于maven的插件开发
    基于Mybatis-generator的插件开发
    
### 小技巧：
	脱离IDE，自动构建，管理
	全局执行，检测配置
	shell配置全局依赖部署
    多src（非标准化，尽量避免），build-helper-maven-plugin
    如何搜索所需依赖
    Intellij IDEA：
        空项目+子项目
        导入pom而非项目
	    导入顺序，若ide导入，环境改变将导致配置失效，不会干预pom，应优先配置pom
    重复即考虑自动化部署
    标准规范模版
    顺藤摸瓜式熟悉自动化环境部署









### Intellij IDEA：






### 附：

	强烈推荐Maven专家极有价值的经验总结：
	http://www.infoq.com/cn/profile/许晓斌

	推荐文章：
	http://www.tuicool.com/articles/f2yemaF
	http://blog.csdn.net/wang379275614/article/details/43938011

	中央仓库：
	http://maven.aliyun.com/
	http://mvnrepository.com/

	推荐书籍：
	maven权威指南
    maven实战




### jenkins讲解：
    注：不推荐外网使用

### shell简单使用：
    maven+git+jenkins+shell
    maven+git+shell（去jenkins化）


### 结合当前项目总结优化及重构：
    pom优化（项目层级、深度）
    代码标准化（生成、规范）
    网络带宽相关的外部依赖优化（重构、下沉）
    缓存
    分页对比及使用
        <!--
        <plugin interceptor="com.github.pagehelper.PageInterceptor">
            <property name="rowBoundsWithCount" value="false"/>
        </plugin>
        -->
        <plugin interceptor="com.github.miemiedev.mybatis.paginator.OffsetLimitInterceptor">
            <property name="dialectClass" value="com.github.miemiedev.mybatis.paginator.dialect.MySQLDialect"/>
        </plugin>
    高内聚低耦合
        代码层面
        项目管理层面
    service与service关系
    deploy与impl关系
    service与节点关系
    VO DO DOMAIN关系
        
    避免选择与思考（接口设计原则）
    
    业务拆分
        易分不易合，分布式结合业务实际按需求拆分






### 项目依赖关系：

#### platform-dependencies
* ----framework
* --------financial-platform
* ------------business
* ------------api
* ------------console
* ------------schedule
* ------------deploy
* --------data-platform
* ------------business
* ------------console
* ------------deploy
* --------operation-platform（运营系统平台）
* ------------business
* ----------------coupon-service（卡券系统）
* ----------------coupon-service-impl（卡券系统）
* ------------console
* ----------------coupon-console（卡券系统）
* ------------schedule
* ----------------coupon-job（卡券系统）
* ------------deploy
* ----------------deploy-coupon（卡券系统）
* ----某项目（个别项目若较简单，不需要用到framework，则直接依赖platform-dependencies）


#### platform-dependencies：
* 全局依赖管理项目，仅pom文件
* 在dependencyManagement定义各个依赖的版本号，具体是否引用由子项目的dependencies定义
* 在pluginManagement定义插件版本号，具体是否引用由子项目的plugins定义
* 在plugins定义全局插件（所有项目均会使用到的，例如build节点的finalName、resources配置，maven-compiler-plugin等公共插件）
* 在distributionManagement配置全局nexus私服配置
* 在properties配置全局属性，如版本、JDK、字符编码
* 在profiles配置全局部署环境，如dev、test、pro


* framework：
* parent：platform-dependencies
* 定义全局依赖，如log、common组件、spring、json，将financial-platform大部分移到这里



* financial-platform、data-platform、peration-platform：
* parent：framework
* 定义各自子项目的全局配置


* deploy：配置maven-assembly-plugin、maven-antrun-plugin
* consol、api：配置maven-antrun-plugin


* 原则：
* 1.依赖关系自上而下，不产生逆向依赖。
* 2.共用性越强，抽取至越高级别的项目中。


* message-server和GenerateID-server暂时按现有不动，后期根据上面的结构慢慢调过来


