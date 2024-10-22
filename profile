#!/bin/bash

# TODO 后面应该使用app prefix环境变量，现在玲珑还没添加这个环境变量
export QML_IMPORT_PATH=/opt/apps/$LINGLONG_APPID/files
# 读取当前base的架构
tripletList=$(cat /etc/linglong-triplet-list)
for triplet in $tripletList; do
    export QT_QPA_PLATFORM_PLUGIN_PATH="/runtime/lib/$triplet/qt6/plugins/platforms"
    export QT_PLUGIN_PATH="/runtime/lib/$triplet/qt6/plugins"
    export QML_IMPORT_PATH="/runtime/lib/$triplet/qt6/qml:$QML_IMPORT_PATH"
    break
done
