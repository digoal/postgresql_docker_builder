#!/bin/bash  
set -vx  
  
export ROOT_HOME=/root  
. $ROOT_HOME/.bashrc  
  
export TEMP_DIR=/tmp  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/jaiminpan/pg_jieba  
cd $TEMP_DIR/pg_jieba  
git submodule update --init --recursive --depth 1  
mkdir build  
cd $TEMP_DIR/pg_jieba/build  
cmake -DPostgreSQL_TYPE_INCLUDE_DIR=/usr/include/postgresql/14/server ..  
make && make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/ChenHuajun/pg_roaringbitmap  
cd $TEMP_DIR/pg_roaringbitmap  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/theirix/parray_gin  
cd $TEMP_DIR/parray_gin  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/jirutka/smlar  
cd $TEMP_DIR/smlar  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/alitrack/duckdb_fdw
# 14版本 bug fix 之前
# git clone  https://github.com/alitrack/duckdb_fdw
cd $TEMP_DIR/duckdb_fdw
# git checkout 87c66cf04243c7bc43e0e75d0b8ce5dd76d81cd5 
# wget -T 36000 -t 0 --waitretry=5 https://github.com/duckdb/duckdb/releases/download/v0.9.2/libduckdb-linux-amd64.zip  
# curl -Z --connect-timeout 120 -m 36000 --retry 12000 --retry-delay 5 --retry-max-time 1200 -L https://github.com/duckdb/duckdb/releases/download/v0.9.2/libduckdb-linux-amd64.zip -o libduckdb-linux-amd64.zip  
cp $TEMP_DIR/libduckdb-linux-amd64.zip $TEMP_DIR/duckdb_fdw/  
unzip -n -d . libduckdb-linux-amd64.zip  
cp libduckdb.so $(pg_config --libdir)  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/EnterpriseDB/hdfs_fdw  
cd $TEMP_DIR/hdfs_fdw/libhive  
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 JDK_INCLUDE=$JAVA_HOME/include INSTALL_DIR=/usr/lib/postgresql/14/lib PATH=/usr/lib/postgresql/14/bin:$PATH make  
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 JDK_INCLUDE=$JAVA_HOME/include INSTALL_DIR=/usr/lib/postgresql/14/lib PATH=/usr/lib/postgresql/14/bin:$PATH make install  
  
cd $TEMP_DIR/hdfs_fdw/libhive/jdbc  
javac MsgBuf.java  
javac HiveJdbcClient.java  
jar cf HiveJdbcClient-1.0.jar *.class  
cp HiveJdbcClient-1.0.jar /usr/lib/postgresql/14/lib  
  
cd $TEMP_DIR/hdfs_fdw  
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 JDK_INCLUDE=$JAVA_HOME/include INSTALL_DIR=/usr/lib/postgresql/14/lib PATH=/usr/lib/postgresql/14/bin:$PATH USE_PGXS=1 make  
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 JDK_INCLUDE=$JAVA_HOME/include INSTALL_DIR=/usr/lib/postgresql/14/lib PATH=/usr/lib/postgresql/14/bin:$PATH USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://gitlab.com/dalibo/postgresql_anonymizer.git  
cd $TEMP_DIR/postgresql_anonymizer  
make extension  
make install  
  
cd $TEMP_DIR  
git clone --depth 1 --branch stable https://github.com/jedisct1/libsodium  
cd $TEMP_DIR/libsodium  
./configure  
make  
make check  
make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/michelp/pgsodium  
cd $TEMP_DIR/pgsodium  
C_INCLUDE_PATH=/usr/include/postgresql/14/server PG_LDFLAGS=-L/usr/lib/postgresql/14/lib USE_PGXS=1 make  
C_INCLUDE_PATH=/usr/include/postgresql/14/server PG_LDFLAGS=-L/usr/lib/postgresql/14/lib USE_PGXS=1 make install  
  
cd $TEMP_DIR  
wget -T 36000 -t 0 --waitretry=5 https://github.com/libgd/libgd/archive/refs/tags/gd-2.3.3.tar.gz  
tar -zxvf gd-2.3.3.tar.gz  
cd $TEMP_DIR/libgd-gd-2.3.3  
mkdir build  
cd $TEMP_DIR/libgd-gd-2.3.3/build  
cmake ..  
make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/digoal/imgsmlr  
# git clone --depth 1 https://github.com/postgrespro/imgsmlr  
cd $TEMP_DIR/imgsmlr  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/postgrespro/vops  
cd $TEMP_DIR/vops  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 -b PG14 https://github.com/ossc-db/pg_hint_plan  
cd $TEMP_DIR/pg_hint_plan  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
apt-get install -y libselinux1-dev libpam0g-dev libkrb5-dev liblz4-dev  
git clone --depth 1 https://github.com/ossc-db/pg_bulkload  
cd $TEMP_DIR/pg_bulkload  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 -b 1.6.1 https://github.com/ossc-db/pg_store_plans  
cd $TEMP_DIR/pg_store_plans  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
# cd $TEMP_DIR  
# git clone --depth 1 -b REL-5_5_0 https://github.com/EnterpriseDB/mongo_fdw  
# cd $TEMP_DIR/mongo_fdw  
# ./autogen.sh --with-master  
# apt-get install -y libmongoc-dev  
# # C_INCLUDE_PATH="/include/libmongoc-1.0/mongoc:/include/libbson-1.0" USE_PGXS=1 make  
# # C_INCLUDE_PATH="/include/libmongoc-1.0/mongoc:/include/libbson-1.0" USE_PGXS=1 make install  
# USE_PGXS=1 make  
# USE_PGXS=1 make install

cd $TEMP_DIR  
git clone --depth 1 -b REL-5_5_1 https://github.com/EnterpriseDB/mongo_fdw  
cd $TEMP_DIR/mongo_fdw  
cp $TEMP_DIR/mongo-c-driver-1.17.3.tar.gz ./
tar -xzvf mongo-c-driver-1.17.3.tar.gz
rm -rf mongo-c-driver
mv mongo-c-driver-1.17.3 mongo-c-driver
cd $TEMP_DIR/mongo_fdw/mongo-c-driver
cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF -DENABLE_SSL=AUTO .
make install 

cd $TEMP_DIR/mongo_fdw  
cp $TEMP_DIR/json-c-0.15-20200726.tar.gz ./ 
tar -xzvf json-c-0.15-20200726.tar.gz
rm -rf json-c
mv json-c-json-c-0.15-20200726 json-c
cd $TEMP_DIR/mongo_fdw/json-c
cmake .
make -j 2
make install

apt-get install -y libmongoc-dev  

cd $TEMP_DIR/mongo_fdw
echo "#ifdef __CONFIG__" >> config.h 
echo "#define META_DRIVER" >> config.h 
echo "#endif" >> config.h 
export PKG_CONFIG_PATH=mongo-c-driver/src/libmongoc/src:mongo-c-driver/src/libbson/src
mv Makefile Makefile.origin 
cp Makefile.meta Makefile 
# C_INCLUDE_PATH="/include/libmongoc-1.0/mongoc:/include/libbson-1.0" USE_PGXS=1 make  
# C_INCLUDE_PATH="/include/libmongoc-1.0/mongoc:/include/libbson-1.0" USE_PGXS=1 make install  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/neondatabase/neon  
cd $TEMP_DIR/neon/pgxn/hnsw  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
curl https://install.citusdata.com/community/deb.sh > add-citus-repo.sh  
bash add-citus-repo.sh  
apt-get install -y postgresql-14-citus-11.3  
  
cd $TEMP_DIR  
apt-get install -y libboost-all-dev  
wget -T 36000 -t 0 --waitretry=5 https://api.pgxn.org/dist/datasketches/1.7.0/datasketches-1.7.0.zip  
unzip datasketches-1.7.0.zip  
cd $TEMP_DIR/datasketches-1.7.0  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
# get GraphBLAS, compile with debug symbols  
# curl --connect-timeout 120 -m 36000 --retry 12000 --retry-delay 5 --retry-max-time 1200 -s -L http://faculty.cse.tamu.edu/davis/GraphBLAS/GraphBLAS-3.1.1.tar.gz | tar zxvf - && cd GraphBLAS-3.1.1 && make library CMAKE_OPTIONS='-DCMAKE_BUILD_TYPE=Debug' && make install  
tar -zxvf GraphBLAS-3.1.1.tar.gz  
cd GraphBLAS-3.1.1  
make library CMAKE_OPTIONS='-DCMAKE_BUILD_TYPE=Debug'  
make install  
cd $TEMP_DIR  
git clone --depth 1 --branch 22July2019 https://github.com/GraphBLAS/LAGraph.git && cd LAGraph && make -j4 library && make install  
cd $TEMP_DIR  
curl --connect-timeout 120 -m 36000 --retry 12000 --retry-delay 5 --retry-max-time 1200 -s -L https://github.com/theory/pgtap/archive/v0.99.0.tar.gz | tar zxvf - && cd pgtap-0.99.0 && make -j4 && make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/michelp/pggraphblas  
cd $TEMP_DIR/pggraphblas  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 -b REL1_2_STABLE https://github.com/pgbigm/pg_bigm  
cd $TEMP_DIR/pg_bigm  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/percona/pg_stat_monitor  
cd $TEMP_DIR/pg_stat_monitor  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/neondatabase/pg_embedding  
cd $TEMP_DIR/pg_embedding  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/cybertec-postgresql/pgfaceting  
cd $TEMP_DIR/pgfaceting  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/pgexperts/pg_plan_filter  
cd $TEMP_DIR/pg_plan_filter  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/postgrespro/pg_variables  
cd $TEMP_DIR/pg_variables  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
apt-get install -y libcurl-ocaml-dev  
wget -T 36000 -t 0 --waitretry=5 https://api.pgxn.org/dist/pg_curl/2.2.2/pg_curl-2.2.2.zip  
unzip pg_curl-2.2.2.zip  
cd $TEMP_DIR/pg_curl-2.2.2  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
apt-get install -y systemtap-sdt-dev
mkdir -p /usr/lib/postgresql/14/lib
mkdir -p /usr/lib/postgresql/14/lib/bitcode
mkdir -p /usr/share/postgresql/14/extension
mv pg_task.so /usr/lib/postgresql/14/lib/
mv pg_task.index.bc /usr/lib/postgresql/14/lib/bitcode/
mv pg_task /usr/lib/postgresql/14/lib/bitcode/
mv pg_task.control /usr/share/postgresql/14/extension/
mv pg_task--1.0.sql /usr/share/postgresql/14/extension/
cd $TEMP_DIR  
git clone --depth 1 -b extension https://github.com/RekGRpth/pg_task
# OR
# git clone --depth 1 -b extension https://github.com/RekGRpth/pg_task  
# cd $TEMP_DIR/pg_task  
# USE_PGXS=1 make install
# OR
# pgxn install pg_task
# OR
# wget -T 36000 -t 0 --waitretry=5 https://api.pgxn.org/dist/pg_task/2.0.41/pg_task-2.0.41.zip  
# unzip pg_task-2.0.41.zip  
# cd $TEMP_DIR/pg_task-2.0.41  
# USE_PGXS=1 make install  
  
cd $TEMP_DIR  
wget -T 36000 -t 0 --waitretry=5 https://api.pgxn.org/dist/temporal_tables/1.2.2/temporal_tables-1.2.2.zip  
unzip temporal_tables-1.2.2.zip  
cd $TEMP_DIR/temporal_tables-1.2.2  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 -b v3.1 https://github.com/darold/pgtt  
cd $TEMP_DIR/pgtt  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
wget -T 36000 -t 0 --waitretry=5 https://api.pgxn.org/dist/pg_query_rewrite/0.0.5/pg_query_rewrite-0.0.5.zip  
unzip pg_query_rewrite-0.0.5.zip  
cd $TEMP_DIR/pg_query_rewrite-0.0.5  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
wget -T 36000 -t 0 --waitretry=5 https://api.pgxn.org/dist/pg_track_settings/2.1.2/pg_track_settings-2.1.2.zip  
unzip pg_track_settings-2.1.2.zip  
cd $TEMP_DIR/pg_track_settings-2.1.2  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
wget -T 36000 -t 0 --waitretry=5 https://api.pgxn.org/dist/aggs_for_vecs/1.3.0/aggs_for_vecs-1.3.0.zip  
unzip aggs_for_vecs-1.3.0.zip  
cd $TEMP_DIR/aggs_for_vecs-1.3.0  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
wget -T 36000 -t 0 --waitretry=5 https://api.pgxn.org/dist/quantile/1.1.7/quantile-1.1.7.zip  
unzip quantile-1.1.7.zip  
cd $TEMP_DIR/quantile-1.1.7  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
wget -T 36000 -t 0 --waitretry=5 https://api.pgxn.org/dist/pg_utility_trigger_functions/1.9.1/pg_utility_trigger_functions-1.9.1.zip  
unzip pg_utility_trigger_functions-1.9.1.zip  
cd $TEMP_DIR/pg_utility_trigger_functions-1.9.1  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
wget -T 36000 -t 0 --waitretry=5 https://api.pgxn.org/dist/pg_safer_settings/0.8.10/pg_safer_settings-0.8.10.zip  
unzip pg_safer_settings-0.8.10.zip  
cd $TEMP_DIR/pg_safer_settings-0.8.10  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
wget -T 36000 -t 0 --waitretry=5 https://api.pgxn.org/dist/ddlx/0.27.0/ddlx-0.27.0.zip  
unzip ddlx-0.27.0.zip  
cd $TEMP_DIR/ddlx-0.27.0  
USE_PGXS=1 make install

cd $TEMP_DIR  
wget -T 36000 -t 0 --waitretry=5 https://api.pgxn.org/dist/pgtelemetry/1.6.0/pgtelemetry-1.6.0.zip
unzip pgtelemetry-1.6.0.zip  
cd $TEMP_DIR/pgtelemetry-1.6.0
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 -b REL14_0 https://github.com/ossc-db/pg_dbms_stats  
cd $TEMP_DIR/pg_dbms_stats  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
apt-get install -y libzlcore-dev  
git clone --depth 1 -b REL_14_STABLE https://github.com/ossc-db/pg_rman  
cd $TEMP_DIR/pg_rman  
make install  

# http://sigaev.ru/ 和 http://www.sigaev.ru/git/gitweb.cgi 需要开网络授权, 否则无法访问导致build image报错. 
cd $TEMP_DIR  
git clone --depth 1 git://sigaev.ru/online_analyze  
cd $TEMP_DIR/online_analyze/  
USE_PGXS=1 make  
USE_PGXS=1 make install  

# http://sigaev.ru/ 和 http://www.sigaev.ru/git/gitweb.cgi 需要开网络授权, 否则无法访问导致build image报错. 
cd $TEMP_DIR  
git clone --depth 1 git://sigaev.ru/plantuner  
cd $TEMP_DIR/plantuner/  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/digoal/gevel  
cd $TEMP_DIR/gevel  
. ./install.sh  
  
cd $TEMP_DIR  
git clone --depth 1 -b 4.3 https://github.com/zubkov-andrei/pg_profile  
cd $TEMP_DIR/pg_profile  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
# git clone --depth 1 https://github.com/s-hironobu/pg_plan_inspector  
# cd $TEMP_DIR/pg_plan_inspector
# bug 修复之前 :  https://github.com/s-hironobu/pg_plan_inspector/issues/1 
git clone https://github.com/s-hironobu/pg_plan_inspector  
cd $TEMP_DIR/pg_plan_inspector  
git checkout fa845045ed5a776779f2d5308608ac18ed045aad
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
# apt-get install -y libhealpix-cxx-dev  
# cd $TEMP_DIR  
# git clone --depth 1 -b 1.2.3 https://github.com/postgrespro/pgsphere  
# cd $TEMP_DIR/pgsphere  
# USE_PGXS=1 make  
# USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/sraoss/pg_ivm  
cd $TEMP_DIR/pg_ivm  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/pgvector/pgvector  
cd $TEMP_DIR/pgvector  
USE_PGXS=1 make  
USE_PGXS=1 make install  
  
cd $TEMP_DIR  
git clone --depth=1 https://github.com/vyruss/pg_statviz.git  
cd $TEMP_DIR/pg_statviz  
USE_PGXS=1 make install  
  
apt-get install -y python3-pip  
pip install pg_statviz  
  
cd $TEMP_DIR  
# curl -Z --connect-timeout 120 -m 36000 --retry 12000 --retry-delay 5 --retry-max-time 1200 -L https://github.com/Kitware/CMake/releases/download/v3.27.4/cmake-3.27.4.tar.gz -o cmake-3.27.4.tar.gz  
tar -zxvf cmake-3.27.4.tar.gz  
cd $TEMP_DIR/cmake-3.27.4  
env CC=clang CXX=clang++ ./bootstrap -- -DCMAKE_BUILD_TYPE:STRING=Release  
make -j2  
make install  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/zachasme/h3-pg  
cd $TEMP_DIR/h3-pg  
USE_PGXS=1 make all  
USE_PGXS=1 make install  
  
  
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static  
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup  
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o ./rust.sh  
chmod 500 rust.sh  
./rust.sh -y  
source "$HOME/.cargo/env"  
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/postgresml/pgcat  
cd $TEMP_DIR/pgcat  
cargo build --release  
  
cd $TEMP_DIR
git clone --depth 1 https://github.com/chimpler/postgres-aws-s3
cd $TEMP_DIR/postgres-aws-s3
USE_PGXS=1 make install

cd $TEMP_DIR
git clone --depth 1 -b PG14 https://github.com/apache/age
cd $TEMP_DIR/age
USE_PGXS=1 make
USE_PGXS=1 make install

apt-get install -y npm 
# cd $TEMP_DIR
# tar -zxvf node-v14.21.3.tar.gz
# cd node-v14.21.3
# ./configure
# CC=clang CXX=clang++ make -j 4
# CC=clang CXX=clang++ make install
npm config set registry https://registry.npmmirror.com
npm config set fetch-retries 100
npm config set fetch-retry-mintimeout 120000
npm config set fetch-retry-maxtimeout 60000000
npm config set cache-min 3600
npm i pm2
cd $TEMP_DIR
git clone --depth 1 https://github.com/apache/age-viewer
cd $TEMP_DIR/age-viewer
npm run setup

cd $TEMP_DIR 
git clone --depth 1 https://github.com/michelp/pgjwt
cd $TEMP_DIR/pgjwt 
USE_PGXS=1 make install

cd $TEMP_DIR
git clone --depth 1 https://github.com/supabase/pg_net
cd $TEMP_DIR/pg_net
USE_PGXS=1 make install
# bug : ERROR:  extension "pg_net" has no installation script nor update path for version "0.7.3" 
# cd $TEMP_DIR/pg_net/sql
# cp -f -n ./pg_net.sql ./pg_net--0.7.3.sql /usr/share/postgresql/14/extension/

cd $TEMP_DIR
wget -q -O - http://www.xunsearch.com/scws/down/scws-1.2.3.tar.bz2 | tar jxf -
cd $TEMP_DIR/scws-1.2.3 
./configure 
make install 

cd $TEMP_DIR
git clone --depth 1 https://github.com/amutu/zhparser.git
cd $TEMP_DIR/zhparser 
PG_CONFIG=/usr/lib/postgresql/14/bin/pg_config make && make install

cd $TEMP_DIR
git clone --depth 1 https://github.com/pramsey/pgsql-http
cd $TEMP_DIR/pgsql-http
USE_PGXS=1 make install

cd $TEMP_DIR
git clone --depth 1 https://github.com/pgsentinel/pgsentinel
cd $TEMP_DIR/pgsentinel/src
USE_PGXS=1 make install

cd $TEMP_DIR
git clone --depth 1 https://github.com/postgrespro/zson
cd $TEMP_DIR/zson
USE_PGXS=1 make install

cd $TEMP_DIR
cp pg_tiktoken--0.0.1.sql /usr/share/postgresql/14/extension/
cp pg_tiktoken.control /usr/share/postgresql/14/extension/
cp pg_tiktoken.so /usr/lib/postgresql/14/lib/

cd $TEMP_DIR 
git clone --depth 1 --recursive https://github.com/lanterndata/lantern.git
cd $TEMP_DIR/lantern
mkdir build
cd $TEMP_DIR/lantern/build
cmake ..
make install

cd $TEMP_DIR
cp lantern_extras--0.0.3.sql /usr/share/postgresql/14/extension/
cp lantern_extras.control /usr/share/postgresql/14/extension/
cp lantern_extras.so /usr/lib/postgresql/14/lib/
cp lantern-cli /var/lib/postgresql/
chown postgres:postgres /var/lib/postgresql/lantern-cli
   
cd $TEMP_DIR
git clone --depth 1 -b v1.1.0 https://github.com/hydradatabase/hydra
cd $TEMP_DIR/hydra/columnar
./configure
USE_PGXS=1 make install
  
cd $TEMP_DIR
mkdir -p /usr/local/onnxruntime
tar vzxf onnxruntime-linux-x64-1.15.1.tgz -C /usr/local/onnxruntime --strip-components=1
echo "/usr/local/onnxruntime/lib" > /etc/ld.so.conf.d/onnxruntime.conf
ldconfig

cd $TEMP_DIR
git clone --depth 1 https://github.com/kibae/onnxruntime-server
cd $TEMP_DIR/onnxruntime-server
cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
cmake --build build --parallel 4
cmake --install build --prefix /usr/local/onnxruntime-server

cd $TEMP_DIR
git clone --depth 1 -b v1.15.1 https://github.com/microsoft/onnxruntime
cp /tmp/onnxruntime/include/onnxruntime/core/session/* /usr/local/onnxruntime/

cd $TEMP_DIR
git clone --depth 1 --recursive https://github.com/kibae/pg_onnx.git
cd $TEMP_DIR/pg_onnx
cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
cmake --build build --target pg_onnx --parallel 4 
cmake --install build/pg_onnx
  
cd $TEMP_DIR
# curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
# apt-get install -y git-lfs
for ((i=1;i>=0;i=1))
do
  curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
  if [ $? -eq 0 ]; then
    break 
  fi
done
  
for ((i=1;i>=0;i=1))
do
  apt-get install -y git-lfs
  if [ $? -eq 0 ]; then
    break 
  fi
done
  
cd $TEMP_DIR
GIT_LFS_SKIP_SMUDGE=1 git clone --depth 1 https://github.com/onnx/models
cd $TEMP_DIR/models
git lfs install

cd $TEMP_DIR
git clone --depth 1 https://github.com/fboulnois/pg_uuidv7
cd $TEMP_DIR/pg_uuidv7
USE_PGXS=1 make install

# apt-get install -y libcurl4-openssl-dev uuid-dev libpulse-dev 
#  cd $TEMP_DIR
# # git clone --depth 1 -b apache-arrow-12.0.1 https://github.com/apache/arrow.git
# git clone --depth 1 -b apache-arrow-14.0.2 https://github.com/apache/arrow.git 
# cd $TEMP_DIR/arrow/cpp  
# mkdir build-release  
# cd $TEMP_DIR/arrow/cpp/build-release  
# 
# # build选项: https://arrow.apache.org/docs/developers/cpp/building.html 
# for ((i=1;i>=0;i=1))
# do
#   # cmake -DARROW_DEPENDENCY_SOURCE=BUNDLED -DARROW_PARQUET=ON -DARROW_ORC=ON -DARROW_S3=ON -DARROW_WITH_LZ4=ON -DARROW_WITH_SNAPPY=ON -DARROW_WITH_ZLIB=ON -DARROW_WITH_ZSTD=ON -DPARQUET_REQUIRE_ENCRYPTION=ON  ..
#   cmake -DARROW_DEPENDENCY_SOURCE=BUNDLED -DARROW_PARQUET=ON .. 
#   if [ $? -eq 0 ]; then
#     break 
#   fi
# done
# 
# for ((i=1;i>=0;i=1))
# do
#   make -j4  
#   if [ $? -eq 0 ]; then
#     break 
#   fi
# done
# 
# make install  
# ldconfig 

# https://arrow.apache.org/install/
cd $TEMP_DIR
apt-get install -y libcurl4-openssl-dev uuid-dev libpulse-dev 
for ((i=1;i>=0;i=1))
do
  apt-get update
  if [ $? -eq 0 ]; then
    break 
  fi
done
apt install -y -V ca-certificates lsb-release 
for ((i=1;i>=0;i=1))
do
  wget -T 36000 -t 0 --waitretry=5 https://apache.jfrog.io/artifactory/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb
  if [ $? -eq 0 ]; then
    break 
  fi
done
apt-get install -y -V ./apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb
for ((i=1;i>=0;i=1))
do
  apt-get update
  if [ $? -eq 0 ]; then
    break 
  fi
done
apt-get install -y -V libarrow-dev # For C++
apt-get install -y -V libarrow-glib-dev # For GLib (C)
apt-get install -y -V libarrow-dataset-dev # For Apache Arrow Dataset C++
apt-get install -y -V libarrow-dataset-glib-dev # For Apache Arrow Dataset GLib (C)
apt-get install -y -V libarrow-acero-dev # For Apache Arrow Acero
apt-get install -y -V libarrow-flight-dev # For Apache Arrow Flight C++
apt-get install -y -V libarrow-flight-glib-dev # For Apache Arrow Flight GLib (C)
apt-get install -y -V libarrow-flight-sql-dev # For Apache Arrow Flight SQL C++
apt-get install -y -V libarrow-flight-sql-glib-dev # For Apache Arrow Flight SQL GLib (C)
apt-get install -y -V libgandiva-dev # For Gandiva C++
apt-get install -y -V libgandiva-glib-dev # For Gandiva GLib (C)
apt-get install -y -V libparquet-dev # For Apache Parquet C++
apt-get install -y -V libparquet-glib-dev # For Apache Parquet GLib (C)

cd $TEMP_DIR
git clone --depth 1 https://github.com/adjust/parquet_fdw 
cd $TEMP_DIR/parquet_fdw
make install 
  
cd $TEMP_DIR  
git clone --depth 1 https://github.com/pgspider/sqlite_fdw
cd $TEMP_DIR/sqlite_fdw
USE_PGXS=1 make  
USE_PGXS=1 make install

cd $TEMP_DIR
cp pg_bm25--0.4.3.sql /usr/share/postgresql/14/extension/
cp pg_bm25.control /usr/share/postgresql/14/extension/
cp pg_bm25.so /usr/lib/postgresql/14/lib/

cd $TEMP_DIR
cp pg_search--0.0.0.sql /usr/share/postgresql/14/extension/
cp pg_search.control /usr/share/postgresql/14/extension/
cp pg_search.so /usr/lib/postgresql/14/lib/

cd $TEMP_DIR
cp pg_sparse--0.0.0.sql /usr/share/postgresql/14/extension/
cp pg_sparse.control /usr/share/postgresql/14/extension/
cp pg_sparse.so /usr/lib/postgresql/14/lib/
  
cd $TEMP_DIR  
git clone --depth 1 -b 14.3 https://github.com/ossc-db/pg_statsinfo  
cd $TEMP_DIR/pg_statsinfo  
PG_LDFLAGS=-L/usr/lib/postgresql/14/lib make  
PG_LDFLAGS=-L/usr/lib/postgresql/14/lib make install  
  
cd /usr/lib/postgresql/14  
git clone --depth 1 -b 14.0 https://github.com/ossc-db/pg_stats_reporter

cd $TEMP_DIR/
git clone --depth 1 https://gitlab.com/pg_proctab/pg_proctab
cd $TEMP_DIR/pg_proctab
USE_PGXS=1 make install

apt-get install -y libelf-dev
cd $TEMP_DIR/
git clone --depth 1 https://gitlab.com/pg_top/pg_top
cd $TEMP_DIR/pg_top
cmake CMakeLists.txt
USE_PGXS=1 make install

cd $TEMP_DIR/
wget https://golang.org/dl/go1.17.linux-amd64.tar.gz
tar -zxvf go1.17.linux-amd64.tar.gz -C /usr/local/
export PATH=/usr/local/go/bin:${PATH}
echo "export PATH=/usr/local/go/bin:${PATH}" >>/root/.bashrc 
echo "export PATH=/usr/local/go/bin:${PATH}" >>/var/lib/postgresql/.bash_profile  
cd $TEMP_DIR/
git clone --depth 1 https://github.com/lesovsky/pgcenter
cd $TEMP_DIR/pgcenter
make dep
make build
make install

# pgadmin4 apt 安装目前仅支持x86. arm需要源码安装
cd $TEMP_DIR/
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'
for ((i=1;i>=0;i=1))
do
  apt-get update
  if [ $? -eq 0 ]; then
    break 
  fi
done
  
for ((i=1;i>=0;i=1))
do
  apt-get install -y pgadmin4-web
  if [ $? -eq 0 ]; then
    break 
  fi
done

# apt-get install -y pgadmin4
# apt-get install -y pgadmin4-web
# docker内不支持systemctl, 需要修改 /usr/pgadmin4/bin/setup-web.sh systemctl 控制的apache2服务全部改成如下: 
#     /etc/init.d/apache2 start 
#     /etc/init.d/apache2 restart
# #COMMAND="systemctl restart ${APACHE}"
# /etc/init.d/apache2 restart
# #if ! systemctl enable ${APACHE}; then
# if ! /etc/init.d/apache2 start; then
# if ! systemctl start ${APACHE}; then
# if ! /etc/init.d/apache2 start; then
# 启动pgadmin4 web: 
#     /usr/pgadmin4/bin/setup-web.sh --yes 
# 在主机查看80端口映射, docker inspect pg 
# 在主机chrome中打开  127.0.0.1:port/pgadmin
# 注意pgadmin在docker容器中, 连接容器中的pg数据库地址是 127.0.0.1:1921 
# 拿泰森多边形练手: https://github.com/digoal/blog/blob/master/201904/20190421_01.md 

cd $TEMP_DIR
git clone --depth 1 https://github.com/petere/pguint
cd $TEMP_DIR/pguint
USE_PGXS=1 make install

cd $TEMP_DIR 
git clone --depth 1 -b v0.4.3 https://github.com/paradedb/paradedb
cd $TEMP_DIR/paradedb/pg_sparse
USE_PGXS=1 make install
chmod 644 ./sql/svector--0.4.1.sql
cp ./sql/svector--0.4.1.sql /usr/share/postgresql/14/extension/

cd $TEMP_DIR 
git clone --depth 1 https://github.com/bdrouvot/pg_subtrans_infos
cd $TEMP_DIR/pg_subtrans_infos
USE_PGXS=1 make install

cd $TEMP_DIR 
git clone --depth 1 https://github.com/bdrouvot/pg_subxact_counters
cd $TEMP_DIR/pg_subxact_counters/c
USE_PGXS=1 make install
  
cd $TEMP_DIR
cp pg_idkit--0.2.1.sql /usr/share/postgresql/14/extension/
cp pg_idkit.control /usr/share/postgresql/14/extension/
cp pg_idkit.so /usr/lib/postgresql/14/lib/
  
cd $TEMP_DIR    
apt-get install -y build-essential libproj-dev libjson-c-dev libgsl-dev libgeos-dev
git clone --depth 1 https://github.com/MobilityDB/MobilityDB    
cd $TEMP_DIR/MobilityDB    
mkdir build    
cd $TEMP_DIR/MobilityDB/build    
cmake ..    
make -j 4   
make install    
  
cd $TEMP_DIR    
cp pgdd--0.5.2.sql /usr/share/postgresql/14/extension/    
cp pgdd.control /usr/share/postgresql/14/extension/    
cp pgdd.so /usr/lib/postgresql/14/lib/

cd $TEMP_DIR
git clone --depth 1 https://github.com/PGer/pipelinedb_pg14.git
cd $TEMP_DIR/pipelinedb_pg14
apt-get install -y libczmq4 libczmq-dev
USE_PGXS=1 make install

cd $TEMP_DIR
git clone --depth 1 https://github.com/jaiminpan/pg_nanoid.git
cd $TEMP_DIR/pg_nanoid
USE_PGXS=1 make install

cd $TEMP_DIR
git clone --depth 1 https://github.com/andrielfn/pg-ulid.git
cd $TEMP_DIR/pg-ulid
USE_PGXS=1 make install
  
cd $TEMP_DIR 
git clone --depth 1 https://github.com/phillbaker/pg_migrate.git  
cd $TEMP_DIR/pg_migrate/  
USE_PGXS=1 make install  
  
cd $TEMP_DIR 
git clone --depth 1 https://github.com/df7cb/pg_filedump.git
cd $TEMP_DIR/pg_filedump/  
USE_PGXS=1 make install

cd $TEMP_DIR
git clone --depth 1 https://github.com/petere/pgpcre
cd $TEMP_DIR/pgpcre
USE_PGXS=1 make install

cd $TEMP_DIR
git clone --depth 1 https://github.com/omniti-labs/pg_jobmon
cd $TEMP_DIR/pg_jobmon
USE_PGXS=1 make install

cd $TEMP_DIR
git clone --depth 1 https://github.com/pgpartman/pg_partman
cd $TEMP_DIR/pg_partman
USE_PGXS=1 make install

# rustup版本必须和plrust需要的rust版本一致, 这里是1.72.0
su - postgres -c "export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static ; export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup ; curl --connect-timeout 120 -m 36000 --retry 12000 --retry-delay 5 --retry-max-time 1200 --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile minimal --default-toolchain 1.72.0 --no-modify-path -y ; source /var/lib/postgresql/.cargo/env ; rustup component add rustc-dev"
echo "source /var/lib/postgresql/.cargo/env" >> /var/lib/postgresql/.bash_profile 
dpkg -i /tmp/plrust-trusted-1.2.7_1.72.0-debian-pg14-amd64.deb 

cd $TEMP_DIR
git clone --depth 1 https://gitee.com/seanguo_007/plpgsql_pg4ml.git
cd $TEMP_DIR/plpgsql_pg4ml
USE_PGXS=1 make install

cd $TEMP_DIR    
cp pgmq--1.1.1.sql /usr/share/postgresql/14/extension/    
cp pgmq.control /usr/share/postgresql/14/extension/    
cp pgmq.so /usr/lib/postgresql/14/lib/
    
cd $TEMP_DIR    
cp pg_later--0.0.13.sql /usr/share/postgresql/14/extension/    
cp pg_later.control /usr/share/postgresql/14/extension/    
cp pg_later.so /usr/lib/postgresql/14/lib/

cd $TEMP_DIR    
cp vectorize--0.7.0.sql /usr/share/postgresql/14/extension/    
cp vectorize.control /usr/share/postgresql/14/extension/    
cp vectorize.so /usr/lib/postgresql/14/lib/

cd $TEMP_DIR 
git clone --depth 1 https://github.com/pgEdge/snowflake
cd $TEMP_DIR/snowflake
USE_PGXS=1 make install
  
cd /usr/lib/postgresql/14  
git clone --depth 1 https://github.com/swida/sqlbench  
cd /usr/lib/postgresql/14/sqlbench  
autoreconf -if  
./configure --with-postgresql="$PGHOME"  
C_INCLUDE_PATH=/usr/include/postgresql make  
C_INCLUDE_PATH=/usr/include/postgresql make install  
  
apt-get install -y libpcap-dev libnl-genl-3-dev  
cd /tmp  
git clone --depth 1 -b 8.4.0-stable https://github.com/ntop/PF_RING  
cd /tmp/PF_RING/userland/lib  
./configure && make  
make install  
cd /tmp  
git clone --depth 1 https://github.com/heterodb/pg-strom  
cd /tmp/pg-strom/arrow-tools  
PG_CONFIG=/usr/lib/postgresql/14/bin/pg_config C_INCLUDE_PATH=/tmp/PF_RING/kernel make  
PG_CONFIG=/usr/lib/postgresql/14/bin/pg_config C_INCLUDE_PATH=/tmp/PF_RING/kernel make install  
  
cd /usr/lib/postgresql/14  
git clone --depth 1 https://github.com/apache/madlib  
cd /usr/lib/postgresql/14/madlib  
mkdir build  
cd /usr/lib/postgresql/14/madlib/build  
cmake ..  
make -j 4  
# $BUILD_ROOT/src/bin/madpack -s madlib -p postgres -c [user[/password]@][host][:port][/database] install  
