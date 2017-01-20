#!/bin/bash
/setup-database.sh
exec supervisord -n
