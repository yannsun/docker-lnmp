#!/usr/bin/env bash
# 工具脚本

# 开启调试模式
if [ -n "$SHELL_DEBUG" ]; then
    set -xe;
fi

# 输出错误消息
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')] :" "$@" >&2;
}