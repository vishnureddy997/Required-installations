#!/bin/bash
DIR=`date +%d-%m-%y`
DEST=~/postgres_backup/$DIR

#Get the postgres db password from aws secret manager
postgres_password=$(aws secretsmanager get-secret-value \
   --region us-east-1 \
   --secret-id calque-prod \
   --query 'SecretString' \
   --output text | jq .POSTGRES_PASSWORD | tr -d '"')


PGPASSWORD=$postgres_password pg_dump --inserts --column-inserts --username=calqueuser   --host=localhost --port=5432 calquedb > calque_$DIR.sql

#Copy generated sql file to s3
aws s3 cp calque_$DIR.sql s3://calque-db-bucket

#Removing backup file
sudo rm calque_$DIR.sql