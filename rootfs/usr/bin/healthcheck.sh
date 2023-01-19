#!/bin/bash
# coding: utf-8
# Copyright (c) 2023
# Gmail: liuzheng712
#

set -ex
curl -XPOST http://47.110.135.238:8080/healthcheck -d '{"device_id":"NanoPi${USER}"}' -H 'Content-Type: application/json'
