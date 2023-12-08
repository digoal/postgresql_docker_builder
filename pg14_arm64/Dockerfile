FROM --platform=$TARGETPLATFORM debian:11.7  
MAINTAINER digoal zhou "dege.zzz@alibaba-inc.com"  
ARG TARGETPLATFORM  
ARG BUILDPLATFORM  
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"  
ENV DEBIAN_FRONTEND=noninteractive TEMP_DIR=/tmp ROOT_HOME=/root PG_HOME=/var/lib/postgresql PG_DATA=/var/lib/postgresql/14/pgdata PGHOME=/usr/lib/postgresql/14  
STOPSIGNAL SIGINT  
COPY --chmod=555 1.sh 2.sh 3.sh 4.sh 5.sh $TEMP_DIR/  
COPY GraphBLAS-3.1.1.tar.gz libduckdb-linux-aarch64.zip duckdb_cli-linux-aarch64.zip cmake-3.27.4.tar.gz mongo-c-driver-1.17.3.tar.gz json-c-0.15-20200726.tar.gz pg_tiktoken--0.0.1.sql pg_tiktoken.control pg_tiktoken.so lantern_extras--0.0.3.sql lantern_extras.control lantern_extras.so lantern-cli onnxruntime-linux-aarch64-1.15.1.tgz node-v14.21.3.tar.gz pg_bm25.control pg_bm25.so pg_bm25--0.0.0.sql pg_search.control pg_search.so pg_search--0.0.0.sql pg_sparse.so pg_sparse.control pg_sparse--0.0.0.sql  pg_task.so pg_task.index.bc pg_task.control pg_task--1.0.sql $TEMP_DIR/
RUN mkdir /tmp/pg_task
COPY pg_task /tmp/pg_task
  
RUN $TEMP_DIR/1.sh  
RUN $TEMP_DIR/2.sh  
RUN $TEMP_DIR/3.sh  
  
# WORKDIR $TEMP_DIR  
# RUN apt-get install -y libtinfo5 build-essential ninja-build python3  
# RUN git clone --depth 1 -b v3.1.7 https://github.com/plv8/plv8  
# WORKDIR $TEMP_DIR/plv8  
# RUN USE_ICU=1 USE_PGXS=1 make  
# RUN USE_ICU=1 USE_PGXS=1 make install  
#  
# WORKDIR $TEMP_DIR  
# RUN git clone --depth 1 -b apache-arrow-12.0.1 https://github.com/apache/arrow.git  
# WORKDIR $TEMP_DIR/arrow/cpp  
# RUN mkdir build-release  
# WORKDIR $TEMP_DIR/arrow/cpp/build-release  
# RUN cmake -DARROW_DEPENDENCY_SOURCE=BUNDLED ..  
# RUN make -j4  
# RUN make install  
#  
# WORKDIR $TEMP_DIR  
# RUN apt-get install -y libcurl4-openssl-dev uuid-dev libpulse-dev  
# RUN git clone --depth 1 -b 1.9.263 https://github.com/aws/aws-sdk-cpp  
# WORKDIR $TEMP_DIR/aws-sdk-cpp  
# RUN git submodule update --init --recursive --depth 1  
# RUN mkdir build  
# WORKDIR $TEMP_DIR/aws-sdk-cpp/build  
# RUN cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_ONLY="s3;core"  
# RUN make -j4  
# RUN make install  
#  
# WORKDIR $TEMP_DIR  
# RUN git clone --depth 1 -b v1.0.0 https://github.com/pgspider/parquet_s3_fdw  
# WORKDIR $TEMP_DIR/parquet_s3_fdw  
# RUN PG_CPPFLAGS="-Wno-register -D_GLIBCXX_USE_CXX11_ABI=0" USE_PGXS=1 make  
# RUN PG_CPPFLAGS="-std=c++17 -Wno-register -D_GLIBCXX_USE_CXX11_ABI=0" USE_PGXS=1 make  
# RUN PG_CPPFLAGS="-std=c++17 -Wno-register -D_GLIBCXX_USE_CXX11_ABI=0" USE_PGXS=1 make install  
# RUN echo "/usr/local/lib" >>/etc/ld.so.conf  
# RUN ldconfig  
  
  
ENV ORACLE_BASE /usr/lib/postgresql/14/lib  
WORKDIR $ORACLE_BASE  
COPY instantclient_19_19/libclntsh.so.19.1 .  
RUN ln -s libclntsh.so.19.1 libclntsh.so  
RUN mkdir -p oracle/network/admin  
COPY instantclient_19_19 ./oracle  
RUN echo "export LD_LIBRARY_PATH=\$PGHOME/lib/oracle:\$LD_LIBRARY_PATH" >>$PG_HOME/.bash_profile  
RUN echo "export ORACLE_HOME=\$PGHOME/lib/oracle" >>$PG_HOME/.bash_profile  
RUN echo "export TNS_ADMIN=\$ORACLE_HOME/network/admin/" >>$PG_HOME/.bash_profile  
RUN echo "export LD_LIBRARY_PATH=\$PGHOME/lib/oracle:\$LD_LIBRARY_PATH" >>$ROOT_HOME/.bashrc  
RUN echo "export ORACLE_HOME=\$PGHOME/lib/oracle" >>$ROOT_HOME/.bashrc  
RUN echo "export TNS_ADMIN=\$ORACLE_HOME/network/admin/" >>$ROOT_HOME/.bashrc  
RUN . $ROOT_HOME/.bashrc  
  
RUN echo "/usr/lib/postgresql/14/lib/oracle" >> /etc/ld.so.conf  
RUN echo "/usr/local/lib" >> /etc/ld.so.conf  
RUN echo "/usr/lib/postgresql/14/lib" >> /etc/ld.so.conf  
RUN ldconfig  
  
WORKDIR $TEMP_DIR  
# RUN apt-get install -y libsqlite3-dev  
RUN git clone --depth 1 https://github.com/ossc-db/dblink_plus  
WORKDIR $TEMP_DIR/dblink_plus  
RUN cp -r /usr/lib/postgresql/14/lib/oracle/sdk/include/* ./  
RUN PG_CFLAGS=-I/usr/lib/postgresql/14/lib/oracle/sdk/include PG_LDFLAGS=-L/usr/lib/postgresql/14/lib/oracle USE_PGXS=1 make  
RUN PG_CFLAGS=-I/usr/lib/postgresql/14/lib/oracle/sdk/include PG_LDFLAGS=-L/usr/lib/postgresql/14/lib/oracle USE_PGXS=1 make install  
  
  
# RUN rm -rf $TEMP_DIR/*  
  
RUN $TEMP_DIR/4.sh  
  
USER postgres  
RUN $TEMP_DIR/5.sh  
  
WORKDIR $PG_HOME  
# RUN wget -T 36000 -t 0 --waitretry=5 https://github.com/duckdb/duckdb/releases/download/v0.9.1/duckdb_cli-linux-aarch64.zip  
# RUN curl -Z --connect-timeout 120 -m 36000 --retry 12000 --retry-delay 5 --retry-max-time 1200 -L https://github.com/duckdb/duckdb/releases/download/v0.9.1/duckdb_cli-linux-aarch64.zip -o duckdb_cli-linux-aarch64.zip  
RUN cp $TEMP_DIR/duckdb_cli-linux-aarch64.zip $PG_HOME/  
RUN unzip -d . duckdb_cli-linux-aarch64.zip  
  
USER root  
WORKDIR $ROOT_HOME  

EXPOSE 1921  
EXPOSE 3000 
EXPOSE 8080 
EXPOSE 80
EXPOSE 3306
ENTRYPOINT ["su", "-", "postgres", "-c", "/usr/lib/postgresql/14/bin/postgres -D \"/var/lib/postgresql/14/pgdata\""]  
