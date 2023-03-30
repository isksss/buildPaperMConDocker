#!/usr/bin/env bash

# javaが存在するか確認
if ! type java > /dev/null 2>&1; then
    echo "java is not installed"
    exit 1
fi

# javaのバージョンを確認
JAVA_VERSION=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
if [ "$JAVA_VERSION" \< "1.17" ]; then
    echo "java version is too old"
    exit 1
fi

# jarファイルが存在するか確認
if [ ! -f "paper.jar" ]; then
    echo "paper.jar is not found"
    exit 1
fi

# サーバーを起動
java -Xms2G -Xmx2G -jar paper.jar nogui