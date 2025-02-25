#!/bin/bash
set -e  # 遇到错误立即退出

REPO_FILE=".github/diy/repos.txt"
PACKAGE_DIR="."

# 检查仓库列表文件是否存在
if [ ! -f "$REPO_FILE" ]; then
  echo "❌ 仓库列表文件 $REPO_FILE 未找到"
  exit 1
fi

# 读取非空行（忽略注释和空行）
REPO_LIST=$(grep -vE '^\s*(#|$)' "$REPO_FILE")

if [ -z "$REPO_LIST" ]; then
  echo "ℹ️ 未检测到有效的仓库配置"
  exit 0
fi

echo "📦 开始同步仓库..."
while IFS= read -r confline; do
  # 提取仓库名称
  read giturl gitdir <<< "$confline"
  repo_name=$(basename "$giturl" .git)
  target_dir="$PACKAGE_DIR/$gitdir"

  echo "🔄 处理仓库: $repo_name 目录：$target_dir"
  
  # 清理旧目录
  if [ -d "$target_dir" ]; then
    echo "🗑️ 删除旧目录: $target_dir"
    rm -rf "$target_dir"
  fi

  # 克隆仓库
  echo "⏬ 克隆仓库到: $target_dir"
  git clone --quiet --depth 1 --single-branch "$giturl" "$target_dir"
  
  # 移除.git历史记录
  echo "🧹 清理Git记录"
  rm -rf "$target_dir/.git"

done <<< "$REPO_LIST"

echo "✅ 同步完成"
