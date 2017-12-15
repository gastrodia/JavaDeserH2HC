#!/usr/bin/expect -f


set target 192.168.120.133
set target_username target
set target_password toor
set command [lindex $argv 0]
spawn scp -r $command $target_username@$target:~/$command
expect "assword:"
send "$target_password\r"
interact
spawn ssh $target_username@$target
expect "assword:"
send "$target_password\r"
expect "Welcome to"
send $command\r
send "rm $command\r"
send "exit\r"
interact