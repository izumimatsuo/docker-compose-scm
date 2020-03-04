#!/bin/sh

docker run --rm --volumes-from gitlab -v `pwd`/backups:/backup busybox tar -zcvf /backup/gitlab_config_`date "+%Y%m%d_%H%M%S"`.tar.gz /etc/gitlab
docker run --rm --volumes-from gitlab -v `pwd`/backups:/backup busybox tar -zcvf /backup/gitlab_data_`date "+%Y%m%d_%H%M%S"`.tar.gz /var/opt/gitlab
docker run --rm --volumes-from runner -v `pwd`/backups:/backup busybox tar -zcvf /backup/runner_config_`date "+%Y%m%d_%H%M%S"`.tar.gz /etc/gitlab-runner
