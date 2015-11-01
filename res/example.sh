COMMAND=""

function process() {
  echo "event: $1, file: $2"
}

while read -r line
do
  echo "line: $line"
  if [ -z "$COMMAND" ]
  then
    case "$line" in
      CREATE) ;&
      DELETE) ;&
      STATS) ;&
      RESET) ;&
      RESET) ;&
      CHANGE)
        COMMAND="$line"
        ;;
      *)
        COMMAND=""
        ;;
    esac
  else
    ACTUAL_COMMAND="$COMMAND"
    COMMAND=""
    FILE="$line"
    process $ACTUAL_COMMAND $FILE
  fi
done < <(../fsnotifier --roots $PWD --background)
