testfile=$1
split-window -n testJest
send-keys "npm test ${testfile}" ENTER

