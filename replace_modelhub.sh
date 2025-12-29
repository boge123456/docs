#!/bin/bash

# 替换域名和品牌名称的脚本
# 将 TokenOPS.AI 相关内容替换为 ModelHub 相关内容

DOCS_DIR="./docs"

# 检查目录是否存在
if [ ! -d "$DOCS_DIR" ]; then
    echo "错误: 目录 $DOCS_DIR 不存在"
    exit 1
fi

echo "开始替换..."

# 替换函数：查找包含模式的文件，执行替换，并打印文件名
# 只处理 .mdx 和 .json 后缀的文件
replace_and_print() {
    local pattern="$1"
    local replacement="$2"
    local description="$3"

    echo ""
    echo "[$description]"

    # 查找包含模式的 .mdx 和 .json 文件并替换
    local files=$(grep -rl "$pattern" "$DOCS_DIR" --include="*.mdx" --include="*.json" 2>/dev/null)
    if [ -n "$files" ]; then
        echo "$files" | while read -r file; do
            sed -i "s|$pattern|$replacement|g" "$file"
            echo "  已替换: $file"
        done
    else
        echo "  (无匹配文件)"
    fi
}

# 所有文件替换域名，将https://api.tokenops.ai替换为https://model-api.skyengine.com.cn
replace_and_print "https://api.tokenops.ai" "https://model-api.skyengine.com.cn" "api.tokenops.ai -> model-api.skyengine.com.cn"

# 所有文件替换域名，将https://www.tokenops.ai替换为https://model.skyengine.com.cn
replace_and_print "https://www.tokenops.ai" "https://model.skyengine.com.cn" "www.tokenops.ai -> model.skyengine.com.cn"

# 精确替换 TokenOPS.AI 为 ModelHub
replace_and_print "TokenOPS\.AI" "ModelHub" "TokenOPS.AI -> ModelHub"

# 替换logo
replace_and_print "tokenopsai.svg" "modelhub.png" "tokenopsai.svg -> modelhub.png"

replace_and_print "tokenopsai-d.svg" "modelhub-d.png" "tokenopsai-d.svg -> modelhub-d.png"

echo ""
echo "替换完成!"
