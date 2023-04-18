# MinIO docker compose CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/minio"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Example CI/CD pipeline showing how to deploy a MinIO instance to elestio.

# Once deployed ...

You can open MinIO web UI here:

    https://[CI_CD_DOMAIN]/
    Login: root
    password: [SOFTWARE_PASSWORD] (set in env var)

You can also connect to the API with the same credentials using any S3 compatible client:
    URL: https://[CI_CD_DOMAIN]:34256
    Access Key: root
    Secret Key: [SOFTWARE_PASSWORD] (set in env var)

Minio Client:
    https://docs.min.io/docs/minio-client-complete-guide.html

Official AWS SDK to connect to Minio with the S3 protocol:
    https://docs.min.io/docs/how-to-use-aws-sdk-for-javascript-with-minio-server.html



Sample usage in Node.js with AWS S3 SDK

    var AWS = require('aws-sdk');

    var s3 = new AWS.S3({
        accessKeyId: 'root',
        secretAccessKey: '[SOFTWARE_PASSWORD]',
        endpoint: 'https://[CI_CD_DOMAIN]:34256',
        s3ForcePathStyle: true,
        signatureVersion: 'v4'
    });

    // putObject operation.

    var params = {
        Bucket: 'testbucket',
        Key: 'testobject',
        Body: 'Hello from MinIO!!'
    };

    s3.putObject(params, function(err, data) {
        if (err)
            console.log(err)
        else
            console.log("Successfully uploaded data to testbucket/testobject");
    });

    // getObject operation.

    var params = {
        Bucket: 'testbucket',
        Key: 'testobject'
    };

    var file = require('fs').createWriteStream('/tmp/mykey');

    s3.getObject(params).
    on('httpData', function(chunk) {
        file.write(chunk);
    }).
    on('httpDone', function() {
        file.end();
    }).
    send();




Install the minio client for linux and preconfigure it:

    wget https://dl.min.io/client/mc/release/linux-amd64/mc;
    chmod +x mc;
    mv mc /bin/mc;
    mc alias set minio https://[CI_CD_DOMAIN]:34256 root [SOFTWARE_PASSWORD] --api S3v4
