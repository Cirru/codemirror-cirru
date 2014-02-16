
bash = require("calabash")

bash.do "complie",
  "pkill -f doodle"
  "coffee -o src/ -cw coffee/"
  "doodle src/ index.html log:yes"