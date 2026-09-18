#!/bin/bash
for i in 1 2 3 4 5; do
  if curl -sf http://localhost:80 > /dev/null; then
    echo "Health check passed"
    exit 0
  fi
  echo "Attempt $i failed, retrying in 3 seconds..."
  sleep 3
done

echo "Health check failed"
docker logs web-app || true
exit 1
