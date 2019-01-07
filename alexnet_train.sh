#!/usr/bin/env sh
set -e


INFO=/H/Tensorflow_Log/tensor_info
LOGS=/H/Tensorflow_Log/log

GLOG_logtostderr=0 \
GLOG_log_dir=$INFO \
python -u train.py > $LOGS/alexnet_train.log 2>&1 \
$@