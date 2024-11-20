#!/bin/bash
cd /home/ec2-user/app
java -jar messageUtil-1.0.jar &
echo $! > application.pid
