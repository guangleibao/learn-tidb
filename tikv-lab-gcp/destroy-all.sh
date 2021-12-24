#!/bin/bash
~/.tiup/bin/tiup cluster clean test-kv-gcp --all --yes
~/.tiup/bin/tiup cluster destroy test-kv-gcp --yes
