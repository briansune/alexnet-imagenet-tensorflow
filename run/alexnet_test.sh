#!/usr/bin/env sh
set -e


INFO=######/Tensorflow_Log/tensor_info
LOGS=######/Tensorflow_Log/log

GLOG_logtostderr=0 \
GLOG_log_dir=$INFO \
python -u ../test.py > $LOGS/alexnet_test_######.log 2>&1 \
$@
