#function heroku_run_with_exit
#  set tmp_file "/tmp/heroku_deploy.log"
#  heroku run -r $argv[1] "$argv[2]; echo \$?" > $tmp_file
#  cat $tmp_file
#  set exit_code (cat $tmp_file | tail -n 1)
#  rm -f $tmp_file
#  return $exit_code
#end
#
#function deploy
#  if test (echo $argv | wc -w) -ge 1
#    set branch "master"
#    set remote $argv[1]
#  else
#    set branch $argv[1]
#    set remote $argv[2]
#  end
#
#  heroku maintenance:on -r $remote
#  and git push $remote $branch:$remote
#
#  if test $status -eq 0
#    heroku_run_with_exit $remote "rake db:migrate"
#    and heroku ps:restart -r $remote
#    echo "Deployment was successful!"
#  else
#    echo -e "\e[1;107;101m Deploy failed \e[0m"
#  end
#  heroku maintenance:off -r $remote
#end

function deploy
  /usr/bin/heroku deploy $argv
end
