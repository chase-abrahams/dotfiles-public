" autocmd BufWritePost *.py call flake8#Flake8()
" autocmd BufWritePost *.py :Black
autocmd TermOpen * startinsert

fun! RunTestInFile()
  let file = substitute(substitute(bufname("%"), "/", ".", "g"), "\.py", "", "")
  let cmd_string = "./manage.py test --keepdb " . file
  call setreg('a', cmd_string)
  exec "sp | terminal! docker-compose exec app bash"
  call feedkeys(cmd_string)
endfun

fun! RunTestUnderCursor()
  let file = substitute(substitute(bufname("%"), "/", ".", "g"), "\.py", "", "")
  norm! ^wviwy
  let function = "." . getreg('"')
  norm [[0wviwy''
  let class = "." . getreg('"')
  let cmd_string = "./manage.py test --keepdb " . file . class . function
  call setreg('a', cmd_string)
  exec "sp | terminal! docker-compose exec app bash"
  call feedkeys(cmd_string)
endfun

fun! LoadReverseMigrationCommands()
  " Open a newtab and load all the migration files that differ from develop into the buffer
  exec ":sp | :ene | :r !git diff develop --name-only -- **/migrations/0*"
  " Replace lines in the format parent/app/migrations/migration with ./manage.py migrate app migration_number
  exec ":%s/\\w\\+\\/\\(\\w\\+\\)\\/migrations\\/\\(\\d\\{4\\}\\).*/.\\/manage.py migrate \\1 \\2/"
  " Delete all the lines that are initial migrations
  " We don't really care about initial migrations, since they won't cause any problems
  exec ":g/.*0001/d" 
  " Delete empty lines
  exec ":g/^$/d"
  "Right now we assume that there is only migration file for each
  exec ":% :norm! ^3W"

  let confirmation = input("These commands will be run. Enter \"Yes\" to confirm")


endfun


command! RunTest :echom RunTestUnderCursor()
command! RunTests :echom RunTestInFile()
command! ReloadConfig source ~/.config/nvim/init.vim
command! BuildTags !ctags -R shareforce db site-packages custom
command! UndoMigrations :echom LoadReverseMigrationCommands()


