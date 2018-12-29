#查找commit message包含<message>的提交并强制reset至此次提交，该方法方便多仓库批处理操作
$ git log --grep=<message> --pretty="%H"|xargs git reset --hard
