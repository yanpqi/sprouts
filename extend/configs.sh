#!/bin/bash
# public variable define file.
# you should always include this file in other scripts use:
# . config.sh

if ["$SPROUTS_EXTEND_CONFIG"]; then
	return;
fi
set SPROUTS_EXTEND_CONFIG = $0

extend_path=/opt/