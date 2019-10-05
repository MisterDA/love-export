arg1=$1
arg2=$2

SCRIPT_PATH=$(dirname `which $0`)
PROJECT_PATH=$(pwd)
if [ "$arg1" == "-W" ]; then
  mkdir -p releases
  "echo" "-e" "Converting project to .love file"
  zip -r ./releases/game.love . -x './releases/*'
  rm -rf $SCRIPT_PATH/temp
  cp -R $SCRIPT_PATH/win $SCRIPT_PATH/temp
  cp $PROJECT_PATH/releases/game.love $SCRIPT_PATH/temp
  cat $SCRIPT_PATH/temp/love.exe $SCRIPT_PATH/temp/game.love > $SCRIPT_PATH/temp/game.exe
  rm $SCRIPT_PATH/temp/game.love
  rm $SCRIPT_PATH/temp/love.exe
  cd $SCRIPT_PATH/temp/
  zip -r $PROJECT_PATH/releases/win.zip .
  rm -rf $SCRIPT_PATH/temp
  "echo" "-e" "FINISHED"
elif [ "$arg1" == "-M" ]; then
  "echo" "-e" "Converting project to .love file"
  zip -r ./releases/game.love . -x './releases/*'
  rm -rf $SCRIPT_PATH/temp
  cp -R $SCRIPT_PATH/mac $SCRIPT_PATH/temp
  cp $PROJECT_PATH/releases/game.love $SCRIPT_PATH/temp/Contents/Recources
  cd $SCRIPT_PATH/temp/
  zip -r $PROJECT_PATH/releases/mac.zip .
  rm -rf $SCRIPT_PATH/temp
  "echo" "-e" "FINISHED"
  exit 0
else
  "echo" "-e" "INVALID PARAMETER GIVEN"
  exit 0
fi
"echo" "-e" "$PROJECT_PATH"