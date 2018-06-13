#!/usr/bin/env bash
# 

# 开启调试模式
set -xe

# 检查是否安装Docker和Docker-Compose


# 输出环境信息
echo 'Docker版本'
docker --version

echo '环境变量'
env | sort

# 构建Docker镜像
if [ -n "${PHP_VERSION}" ]; then
    cp env-example .env
    sed -i -- "s/PHP_VERSION=.*/PHP_VERSION=${PHP_VERSION}/g" .env
    sed -i -- 's/=false/=true/g' .env
    cat .env
    docker-compose build ${BUILD_SERVICE}
    docker images
fi