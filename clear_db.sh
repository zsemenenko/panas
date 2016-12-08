#!/bin/bash
/usr/bin/docker cp ~/plastun/server/db/db.sql postgres:/
/usr/bin/docker exec -it postgres bash truncate.sh

exit 0
