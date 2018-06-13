#!/usr/bin/env bash
# 安装Docker和Docker-Compose

# 导入工具脚本
if [ -f "./common.sh" ]; then
    source ./common.sh;
else
    echo >&2 "缺少工具脚本common.sh";
    exit 1;
fi

# 检查系统信息
type uname >/dev/null 2>&1 || { err "uname 命令不存在"; exit 1; };
type getconf >/dev/null 2>&1 || { err "getconf 命令不存在"; exit 1; };
if [ "$(getconf WORD_BIT)" == "32" ] && [ "$(getconf LONG_BIT)" == "64" ]; then
    OS_BIT="64"
else
    OS_BIT="32"
fi
if [ "$OS_BIT" = "32" ]; then
    err "docker 不支持32位操作系统";
    exit 1;
fi

# 卸载老版本docker
sudo apt-get remove docker docker-engine docker.io;

# 安装docker和docker-compose