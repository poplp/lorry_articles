#!/usr/bin/expect
set SOURCE_FILE [lindex $argv 0]
set PASSWORD [lindex $argv 1]
set ALIYUN_HOST_PATH "root@116.62.206.98:/usr/share/nginx/html/"

spawn scp -r $SOURCE_FILE/ $ALIYUN_HOST_PATH
expect {
    "password"
    {
        send "$PASSWORD\r"
    }
    eof
    {
        sleep 5
        send_user "eof\n"
    }
}
send "exit\r"
expect eof