@echo off
TITLE PocketMine-MP Update
setlocal

pushd "%~dp0"

set TARGET_FILE=PocketMine-MP.phar
set TARGET_BASE=https://jenkins.pmmp.io/job/PocketMine-MP/lastSuccessfulBuild/artifact/PocketMine-MP.phar
set CURL_CMD=%TARGET_BASE% -o %TARGET_FILE% -#
set OLD_DIR=old


IF EXIST %TARGET_FILE% (

    IF NOT EXIST %OLD_DIR% (
        echo ^> %OLD_DIR%を作成します
        mkdir %OLD_DIR%
    )
    move %TARGET_FILE% %OLD_DIR%/%TARGET_FILE%
    echo ^> %TARGET_FILE% をコピーしました
    echo ^> %TARGET_BASE% にアクセスします
    echo ^> %TARGET_FILE%を取得しています
    curl %CURL_CMD%
    echo ^> アップデートが完了しました
) ELSE (
    echo ^> %TARGET_FILE%がありません
)
popd

pause