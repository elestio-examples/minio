#set env vars
set -o allexport; source .env; set +o allexport;

#Install MC (minio client) and preconfigure it
#wget https://dl.min.io/client/mc/release/linux-amd64/mc;
#chmod +x mc;
#mv mc /bin/mc;
#mc alias set minio http://172.17.0.1:9000 root ${SOFTWARE_PASSWORD} --api S3v4
