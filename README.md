# postgresql_docker_builder
Build PostgreSQL (with 200+ extenstions and tools) DuckDB MySQL and so on into One docker image. It used for learn database easily only.
    
Scripts in pg14_arm64 directory is used for build docker image with ARM64 chip.    
    
Scripts in pg14_amd64 directory is used for build docker image with AMD64 chip.   
    
# How to use the image?
## AMD64 chip
```
# 拉取镜像, 第一次拉取一次即可. 或者需要的时候执行, 将更新到最新镜像版本.  
docker pull registry.cn-hangzhou.aliyuncs.com/digoal/opensource_database:pg14_with_exts  
  
# 启动容器  
docker run --platform linux/amd64 -d -it -P --cap-add=SYS_PTRACE --cap-add SYS_ADMIN --privileged=true --name pg --shm-size=1g registry.cn-hangzhou.aliyuncs.com/digoal/opensource_database:pg14_with_exts

##### 如果你想学习备份恢复、修改参数等需要重启数据库实例的case, 换个启动参数, 使用参数--entrypoint将容器根进程换成bash更好. 如下: 
docker run -d -it -P --cap-add=SYS_PTRACE --cap-add SYS_ADMIN --privileged=true --name pg --shm-size=1g --entrypoint /bin/bash registry.cn-hangzhou.aliyuncs.com/digoal/opensource_database:pg14_with_exts
##### 以上启动方式需要进入容器后手工启动数据库实例: su - postgres; pg_ctl start;  
  
# 进入容器  
docker exec -ti pg bash  
  
# 连接数据库  
psql  
```

## ARM64 chip
```
# 拉取镜像, 第一次拉取一次即可. 或者需要的时候执行, 将更新到最新镜像版本.  
docker pull registry.cn-hangzhou.aliyuncs.com/digoal/opensource_database:pg14_with_exts_arm64  
  
# 启动容器  
docker run -d -it -P --cap-add=SYS_PTRACE --cap-add SYS_ADMIN --privileged=true --name pg --shm-size=1g registry.cn-hangzhou.aliyuncs.com/digoal/opensource_database:pg14_with_exts_arm64

##### 如果你想学习备份恢复、修改参数等需要重启数据库实例的case, 换个启动参数, 使用参数--entrypoint将容器根进程换成bash更好. 如下: 
docker run -d -it -P --cap-add=SYS_PTRACE --cap-add SYS_ADMIN --privileged=true --name pg --shm-size=1g --entrypoint /bin/bash registry.cn-hangzhou.aliyuncs.com/digoal/opensource_database:pg14_with_exts_arm64  
##### 以上启动方式需要进入容器后手工启动数据库实例: su - postgres; pg_ctl start;  
  
# 进入容器  
docker exec -ti pg bash  
  
# 连接数据库  
psql  
```
  
# The detail info for this docker builder script?
The info contain how to build docker image, and PostgreSQL extensions and tools description.   
  
[《amd64》](https://github.com/digoal/blog/blob/master/202307/20230710_03.md)  
  
[《arm64》](https://github.com/digoal/blog/blob/master/202308/20230814_02.md)  

### image infomation until 20231208
extensions:
```
Display all 195 possibilities? (y or n)
address_standardizer                            intagg                                          pg_prewarm                                      plr
"address_standardizer-3"                        intarray                                        pg_proctab                                      pointcloud
address_standardizer_data_us                    ip4r                                            pg_profile                                      pointcloud_postgis
"address_standardizer_data_us-3"                isn                                             pg_qualstats                                    postgis
adminpack                                       jsonb_plpython3u                                pg_query_rewrite                                "postgis-3"
age                                             jsquery                                         pg_rational                                     postgis_raster
aggs_for_vecs                                   lantern                                         pg_repack                                       "postgis_raster-3"
amcheck                                         lantern_extras                                  pgroonga                                        postgis_sfcgal
anon                                            lo                                              pgroonga_database                               "postgis_sfcgal-3"
autoinc                                         ltree                                           pgrouting                                       postgis_tiger_geocoder
aws_s3                                          ltree_plpython3u                                pgrowlocks                                      "postgis_tiger_geocoder-3"
bloom                                           mimeo                                           pg_safer_settings                               postgis_topology
btree_gin                                       moddatetime                                     pg_safer_settings_table_dependent_extension     "postgis_topology-3"
btree_gist                                      mongo_fdw                                       pg_safer_settings_table_dependent_subextension  postgres_fdw
citext                                          mysql_fdw                                       pg_search                                       powa
citus                                           ogr_fdw                                         pgsentinel                                      prefix
citus_columnar                                  old_snapshot                                    pg_show_plans                                   pre_prepare
columnar                                        oracle_fdw                                      pg_similarity                                   prioritize
credcheck                                       orafce                                          pgsodium                                        q3c
cube                                            pageinspect                                     pg_sparse                                       quantile
datasketches                                    parquet_fdw                                     pg_sphere                                       rdkit
dblink                                          parray_gin                                      pg_squeeze                                      refint
dblink_plus                                     pgagent                                         pg_stat_kcache                                  roaringbitmap
ddlx                                            pgaudit                                         pg_stat_monitor                                 rum
decoderbufs                                     pgautofailover                                  pg_stat_statements                              seg
dict_int                                        pg_bigm                                         pgstattuple                                     smlar
dict_xsyn                                       pg_bm25                                         pg_statviz                                      sqlite_fdw
duckdb_fdw                                      pg_buffercache                                  pg_store_plans                                  sslinfo
earthdistance                                   pg_bulkload                                     pg_surgery                                      tablefunc
embedding                                       pg_cron                                         pgtap                                           table_log
extra_window_functions                          pgcrypto                                        pg_task                                         tcn
file_fdw                                        pg_curl                                         pgtelemetry                                     tdigest
first_last_agg                                  pg_dbms_stats                                   pg_tiktoken                                     tds_fdw
fuzzystrmatch                                   pg_dirtyread                                    pg_track_settings                               temporal_tables
gevel                                           pgfaceting                                      pg_trgm                                         timescaledb
h3                                              pgfincore                                       pgtt                                            timescaledb_toolkit
h3_postgis                                      pg_freespacemap                                 pg_utility_trigger_functions                    toastinfo
hdfs_fdw                                        pggraphblas                                     pg_uuidv7                                       tsm_system_rows
hll                                             pg_hint_plan                                    pg_variables                                    tsm_system_time
hnsw                                            pg_ivm                                          pg_visibility                                   uint
hstore                                          pg_jieba                                        pg_wait_sampling                                unaccent
hstore_pllua                                    pgjwt                                           pldbgapi                                        unit
hstore_plluau                                   pgmemcache                                      pljava                                          "uuid-ossp"
hstore_plpython3u                               pgmp                                            pllua                                           vector
http                                            pg_net                                          plluau                                          vops
hypopg                                          pg_onnx                                         plpgsql_check                                   xml2
icu_ext                                         pgpool_adm                                      plprofiler                                      zhparser
imgsmlr                                         pgpool_recovery                                 plproxy                                         zson
insert_username                                 pgpool_regclass                                 plpython3u
```

### tools and extensions description

#### 集成了哪些插件?  
插件的详细功能和用法请参考:  
- [《未来数据库方向 - 以及PostgreSQL 有价值的插件、可改进功能、开放接口 (202005)》](../202005/20200527_06.md)  
  
1、PG 14自带的所有插件.  
  
2、额外安装的插件或工具  
  
类型增强
- pgmp, PostgreSQL Multiple Precision Arithmetic extension, 支持GMP library, 高性能表达decimal类型.
- unit, 支持很多国际单位的类型
- pg_uuidv7, A tiny Postgres extension to create version 7 UUIDs
- zson, ZSON is a PostgreSQL extension for transparent JSONB compression
- uint, 无符号整型
  
函数增强  
- extra-window-functions, 扩展窗口函数  
- first-last-agg, 扩展聚合函数  
- tdigest, 扩展窗口、聚合函数  
- rational, 扩展插值算法和函数  
- orafce, 扩展Oracle兼容性  
- aggs_for_vecs, 数组类型聚合函数扩展.  
- quantile, 统计分析相关聚合函数扩展.
- pgjwt, JSON 值转储格式: JSON Web Tokens
  
近似统计分析  
- hll, 近似分析, 例如滑动窗口UV, 短视频场景存储已读列表+快速过滤已读视频  
- datasketches, 近似统计算法库  
  
标签圈选  
- smlar, 标签相似搜索  
- roaringbitmap, 标签圈选  
- pgfaceting, 基于rb index的快速降维分析插件(例如任意条件的UV分析, 滑动窗口分析等)  
  
存储引擎、分析加强:  
- citus, 分布式和列存储  
- columnar, Hydra Columnar extension. 列存储引擎. 
- vops, 瓦片存储和向量化计算  
- orioledb, 基于UNDO机制的存储引擎.    (未集成.)  
- zedstore, 行列混合存储引擎.          (未集成.)  
- pg_cryogen, appendonly的压缩存储引擎.   (未集成.)  
- pg_ivm, 增量刷新物化视图  
  
多值列索引扩展加速  
- rum, 多值列+标量复合搜索加速  
- parray_gin, 多值列元素值模糊搜索  
  
多模型业务场景  
- rdkit, 化学类型+算法+索引  
- timescaledb, 时序  
- pggraphblas, 图式关系加速搜索  
- age, 图式关系搜索(兼容cypherQL语法).    
- madlib, 机器学习分析库  
- pg_variables, 会话或事务级内存变量, 例如用于计数器、需要在会话|事务中存储临时值的场景.  
- temporal_tables, 自动按字段时间归档历史数据.  
- pgtt, 全局临时表, 类似Oracle 全局临时表的风格.  
  
空间业务场景  
- pgrouting, 路由算法  
- pgrouting-doc  
- pgrouting-scripts  
- pgsphere, 空间类型+索引  
- pointcloud, 点云  
- q3c, 空间类型+索引  
- postgis-3, 丰富的空间类型+算法+函数接口+索引  
- postgis-3-scripts  
- ip4r, IP转地理位置信息  
- h3, h3_postgis, uber开源的基于H3模型的地图相关插件.  
  
向量搜索  
- similarity, 近似算法, 类型+索引  
- imgsmlr, 图像搜索, 类型+索引  
- pgvector, 向量搜索, 类型+索引(ivfflat、hnsw)
- pg_sparse, paradedb开源. 稀疏向量搜索 
- hnsw, 向量搜索, 类型+索引(hnsw)  
- pg_embedding, 向量搜索, 类型+索引(hnsw)  
- lantern, 向量搜索, 类型+索引(usearch implemented hnsw)
- lantern_extras, lantern辅助插件: 数据库内置大模型, 外接大模型, 文本|图像向量化, 加速向量索引build等. 
  
文本场景增强  
- prefix, 前缀范围模型  
- groonga, 支持wchar的任意模糊搜索  
- pg_bigm, 增强pg_trgm模糊搜索  
- pg_jieba, 结巴中文分词
- zhparser, scws中文分词
- pg_bm25, paradedb开源. bm25(elastic search目前使用的相关算法)支持, 大数据量文本搜索比传统tsvector,tsrank提升20x性能.
- pg_search, paradedb开源. 通过 bm25+hnsw 支持bm25和向量相似文本搜索
  
数据融合, 冷热分离  
- mongo_fdw, 读写mongo数据源  
- parquet_s3_fdw, 读写s3,oss对象存储和parquet文件.  (未集成, 通过duckdb_fdw可以读写s3, aliyun oss, 更加快捷)  
- mysql-fdw, 读写mysql数据源  
- ogr-fdw, 基于ogr的通用数据源读写插件  
- oracle-fdw, 读写oracle数据源  
- tds-fdw, 读写ms sql数据源  
- dblink_plus, mysql,sqlite3,oracle的dblink  
- duckdb_fdw, 读写duckdb数据源. 通过duckdb_fdw还可以读写存放在s3的csv, parquet文件. 
- sqlite_fdw, 读写sqlite3
- parquet_fdw, 读parquet文件. 
- hdfs_fdw, 读写hive, spark数据源  
- pgmemcache, 直接的memcache控制函数库  
- pg_curl, 通过curl支持http,ftp,https等网络协议. 将远程数据加载到数据库中.
- pg_net, 异步HTTP调用接口.
- pgsql-http, HTTP 调用接口.
- pg2arrow , 将pg sql结果转换为arrow格式的数据文件. 适合与其他arrow生态的数据分析产品、DB交换数据, 融入大数据生态, 加速数据分析.
- aws_s3, 读写aws s3对象存储.
- decoderbufs, 逻辑复制decoding, logical decoder output plugin to deliver data as Protocol Buffers
  
扩展协议, 兼容其他产品
- FerretDB, 支持mongodb协议, 可使用mongodb客户端连接. (未集成)
- babelfish, 支持sql server协议, 可使用sqlserver客户端连接. (未集成)
- Apache Arrow Flight SQL adapter, arrow 协议, 可使用arrow driver连接. (未集成, 需PG 15及以上版本.)
  
存储过程和函数语言增强  
- jsquery, 增强json语法查询库  
- pldebugger, 调试plpgsql函数  
- plpgsql-check, 预检查plpgsql函数  
- pljava, java存储过程和函数语言  
- pllua, lua存储过程和函数语言  
- plproxy, 代理(通常用于sharding和并行数据聚合访问场景)  
- plv8, google v8存储过程和函数语言.    (未集成, 未来可以通过apt安装)  
- plpython3, python存储过程和函数语言  
- plr, R存储过程和函数语言  
- plprofiler, 存储过程和函数的性能分析功能  
  
安全增强  
- postgresql_anonymizer, 敏感信息遮蔽  
- pgsodium, 敏感信息遮蔽以及sodium加密库函数
- credcheck, 强制约束用户密码复杂度
  
数据库管理、审计、性能优化等  
- powa, 索引推荐, 等待事件分析, 命中率, 配置变更跟踪等  
- hypopg, 虚拟索引, 索引推荐  
- pg-qualstats, 索引推荐  
- pg-stat-kcache, 跟踪cpu、文件系统真实读写行为  
- pg-wait-sampling, 等待事件采样分析  
- show-plans, 执行过程中的SQL执行计划查询  
- pg_hint_plan, 强制设定SQL执行计划  
- plantuner, 增加了一些参数用来控制SQL执行计划  
- pg_store_plans, 保存SQL执行计划  
- pg_plan_inspector, 复杂SQL执行计划优化修正插. 使用机器学习的方法对收集到的SQL和执行计划等信息进行分析, 从而提升性能.  通过sql安装, 没有extension control file
- pg_stat_monitor, 保存数据库运行时统计信息快照, 用于分析性能  
- pg_statviz, 保存统计信息快照, 使用matplotlib绘图.  
- pg_profile, 使用pg_stat_statements, pg_stat_kcache的统计信息打快照并对快照进行分析. 类似[awr](https://zubkov-andrei.github.io/pg_profile/report_examples/pg15.html). 不过我觉得perf insight和pg_stat_monitor更好用.  
- pg_statsinfo, PG数据库监控工具, 支持按快照选取分析系统运行状态, 类似Oracle statspark.  
- pg_stats_reporter, pg_statsinfo报告的网页呈现, 更加美观, 类似awr效果.
- pgtelemetry, 一些DBA常用的监控数据库和操作系统运行状态的视图. 
- pgfincore, 修改数据文件的page cache行为  
- repack, 几乎不影响业务的收缩膨胀的表和索引浪费的存储空间
- squeeze, 几乎不影响业务的收缩膨胀的表和索引浪费的存储空间, 支持设置阈值, 自动调度.
- pgagent, 定时任务  
- pg_cron, 定时任务  
- pg_task, 数据库后台任务管理. 类似oracle dbms_jobs  
- pgaudit, 审计用户行为  
- tablelog, 审计表的修改过程  
- dirtyread, 脏读  
- wal2json, WAL日志转换为json  
- pg_bulkload, 高速导入数据  
- sqlbench, 压测tpc-c  
- pgxnclient, pgxn插件管理  
- icu-ext, 扩展的icu字符集  
- pg_plan_filter, 基于cbo的限制插件, 例如限制某些用户执行cost大于指定值的SQL. 防止用户"捣乱".  
- pg_query_rewrite, 自定义查询重写规则的插件.  
- pg_track_settings, 跟踪审计GUC参数设置.  
- pg_utility_trigger_functions, 常用功能场景的触发器函数.  
- pg_safer_settings, 记录guc参数设置, 并增加一些基于角色的guc 参数setting权限控制和审计.  
- ddlx, 生成数据库对象的create语句的插件  
- pg_dbms_stats, 统计信息快照, 使用统计信息快照生成执行计划. 类似基线, 确保执行计划的普遍最优性.  
- pg_rman, 块级别数据库增量备份, 根据数据块的LSN判断自上次备份后是否被修改. 类似Oracle incremental backup.  
- online_analyze, 事务中分析DML后的统计信息, 适合OLAP跑复杂任务场景的及时统计信息刷新, 用于确保复杂SQL的执行计划正确性.  
- gevel, 观察gin,gist,sp-gist索引内部结构的插件.
- toastinfo, 观察toast存储结构
- pg_later, PG 异步SQL执行插件.
- mimeo, 表级别复制(逻辑复制前的方法, 现在不建议使用)
- pre_prepare, 数据库端prepared statement自动保存, 便于pool调用.
- prioritize, 结合OS PID task优先级功能, 设置pg backend pid cpu调度优先级
- pgsentinel, postgresql extension providing Active session history
- pgwatch2, PostgreSQL metrics monitor/dashboard. 暂未集成
- pg_top, postgresql的top命令, 类似linux top. 
- pgcenter, 类似pg_top, 可一屏显示多个实例的top情况.  pgCenter is a command line admin tool for PostgreSQL. 
- pg_proctab, 配合pg_top使用, 观察远程postgresql的top资源.
- pgbadger, A fast PostgreSQL Log Analyzer. http://pgbadger.darold.net/ 
- pg_auto_failover, Postgres extension and service for automated failover and high-availability. https://github.com/hapostgres/pg_auto_failover
- pghero, A performance dashboard for Postgres. https://github.com/ankane/pghero
- ora2pg, oracle,mysql迁移到postgresql的工具
- pgloader, 使用fdw读取其他数据库的数据, 并快速迁移到PostgreSQL的迁移工具
  
连接池和读写分离  
- pgpool2, 连接池和读写分离  
- pgagroal, 高性能连接池  
- pgbouncer, 高性能连接池  
- pgcat, 连接池和读写分离,sharding等特性, 未来发展前景比较可观  
  
嵌入式OLAP数据库  
- DuckDB, 嵌入式的OLAP库, 功能非常强大性能非常好. 兼容SQLite3语法和PostgreSQL语法.  
  
未来可能还会新增的插件或产品(你有什么想要的插件可以在issue中留言):  
```  
https://neon.tech/docs/extensions/pg-extensions  

PostgreSQL协议兼容分布式数据库: 
https://yugabyte.com/
https://github.com/cockroachdb/cockroach

类似aws aurora架构的云原生开源数据库, 修改了pg的page server, fd, wal等接口. 
https://neon.tech/

OrioleDB is an attempt to improve PostgreSQL by using lock-free page reading, undo logging, row-level WAL and more.  
https://www.orioledata.com/
  
https://github.com/supabase/postgres
  
Postgres extension for ulid  
https://github.com/pksunkara/pgx_ulid  
  
PostgreSQL implementation of JWT (JSON Web Tokens)  
https://github.com/michelp/pgjwt  
  
Short unique id generator for PostgreSQL, using hashids  
https://github.com/iCyberon/pg_hashids  
  
GraphQL support for PostgreSQL  
https://github.com/supabase/pg_graphql  
  
PostgreSQL extension providing JSON Schema validation  
https://github.com/supabase/pg_jsonschema  
  
A tiny Postgres extension to create version 7 UUIDs  
https://github.com/fboulnois/pg_uuidv7  
  
Build Postgres Extensions with Rust!  
https://github.com/pgcentralfoundation/pgrx  
  
Parquet S3 Foreign Data Wrapper for PostgresSQL  
https://github.com/pgspider/parquet_s3_fdw  
  
PostgresML  
https://github.com/postgresml/postgresml  
  
supavisor, A cloud-native, multi-tenant Postgres connection pooler.  
https://github.com/supabase/supavisor  
  
FerretDB, 前端使用mongo 协议, 后端使用PostgreSQL或SQLite3的数据库  
https://github.com/FerretDB/FerretDB  
  
Apache Arrow Flight SQL adapter for PostgreSQL   
https://arrow.apache.org/blog/2023/09/13/flight-sql-postgresql-0.1.0-release/  
https://github.com/apache/arrow-flight-sql-postgresql  
  
babelfish, sql server wire protocol  
https://babelfishpg.org/  
https://github.com/babelfish-for-postgresql/babelfish_compass/releases    
  
Ora2Pg, 迁移Oracle, MySQL到PostgreSQL的工具  
https://github.com/darold/ora2pg  
  
pg_later, PG 异步SQL执行插件.  
https://github.com/tembo-io/pg_later

PGMQ, pg消息队列
https://github.com/tembo-io/pgmq
https://tembo.io/blog/introducing-pgmq/#using-pgmq

hydra, PG列存储. 
已集成到docker image
https://hydra-so.notion.site/Hydra-1-0-beta-318504444825401e8ce21796dcadd589
https://github.com/hydradatabase/hydra

俄罗斯航空数据集, Demonstration Database 
https://postgrespro.com/community/demodb

在PostgreSQL中运行wasm binary.  
https://github.com/wasmerio/wasmer-postgres
  
使用wasm技术, 将PostgreSQL运行在浏览器虚拟机中. (About A PostgresQL server running in your browser)
https://github.com/snaplet/postgres-wasm
https://supabase.com/blog/postgres-wasm

lsm3, LSM tree implementation based on standard B-Tree
https://github.com/postgrespro/lsm3

sr_plan, Save and restore query plans in PostgreSQL
https://github.com/postgrespro/sr_plan

pg_onnx, 开放的神经网络集市(onnx)在PG中的调用接口.  类似postgresml, 阿里云灵积这样的大模型集市, 在PG内部通过封装好的函数调用AI能力.
已集成到docker image
https://github.com/kibae/pg_onnx
  
onnx model, 已有大模型
已集成到docker image
https://github.com/onnx/models
https://onnxruntime.ai/

pg4ml, 开放的神经网络算法库. 郭铁成老师主导, 内容非常丰富. 即将集成
https://gitee.com/seanguo_007/plpgsql_pg4ml

orc_fdw, 访问ORC格式列存储文件
https://github.com/HighgoSoftware/orc_fdw

zombodb, 使用elastic search作为外部索引. 
https://github.com/zombodb/zombodb

pgwatch2, PostgreSQL metrics monitor/dashboard 
https://github.com/cybertec-postgresql/pgwatch2

pg_timetable, Advanced scheduling for PostgreSQL
https://www.cybertec-postgresql.com/en/products/pg_timetable/
https://github.com/cybertec-postgresql/pg_timetable/releases
https://github.com/cybertec-postgresql/pg_timetable
https://www.cybertec-postgresql.com/en/introducing-pg_timetable-v5-6-delayed-chains-and-error-handling/

partoni, A template for PostgreSQL High Availability with Etcd, Consul, ZooKeeper, or Kubernetes
https://github.com/zalando/patroni  
```  
  
