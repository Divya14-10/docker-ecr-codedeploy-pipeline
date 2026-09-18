#!/bin/bash
# Purana container (agar hai) force stop + remove karo
docker rm -f web-app 2>/dev/null || true
exit 0
