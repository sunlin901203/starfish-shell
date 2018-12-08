# 下载
mkdir /opt
curl -L -k -C - -O "http://mirrors.hust.edu.cn/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz"

# 安装
tar zxvf apache-maven-3.6.0-bin.tar.gz
ln -s apache-maven-3.6.0 maven
mv apache-maven-3.6.0-bin.tar.gz /opt/tmp

# 设置环境变量
cat >> /etc/profile << EOF
export MAVEN_HOME=/opt/maven
export PATH=$PATH:${MAVEN_HOME}/bin
EOF
source /etc/profile

# 启动

# 验证
mvn -v

# 备注
