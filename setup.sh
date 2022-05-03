#!/bin/bash

DIR="$(cd "$(dirname "$0")" && pwd)"

$DIR/setup_config.sh
$DIR/setup_vim.sh
