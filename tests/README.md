<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# MinIO, verified and packaged by Elestio

[MinIO](https://github.com/minio/minio) is a cloud-native object store built to run on any infrastructure - public, private or edge clouds. Primary use cases include data lakes, databases, AI/ML, SaaS applications and fast backup & recovery.

<img src="https://github.com/elestio-examples/minio/raw/master/screenshot.png" alt="minio" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/minio">fully managed minio</a> on <a target="_blank" href="https://elest.io/">elest.io</a> if you want automated backups, reverse proxy with SSL termination, firewall, automated OS & Software updates, and a team of Linux experts and open source enthusiasts to ensure your services are always safe, and functional.

[![deploy](https://github.com/elestio-examples/minio/raw/master/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/minio)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/minio.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Create data folders with correct permissions

    mkdir -p ./data
    chown -R 1000:1000 ./data

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:9001`

## Docker-compose

Here are some example snippets to help you get started creating a container.

    version: '3.3'
    services:
    minio:
        image: elestio4test/minio:${SOFTWARE_VERSION_TAG}
        restart: always
        dns:
            - 8.8.8.8
        ports:
            - "172.17.0.1:9000:9000"
            - "172.17.0.1:9001:9001"
        volumes:
            - ./data:/data
        environment:
            MINIO_ROOT_USER: ${ADMIN_EMAIL}
            MINIO_ROOT_PASSWORD: ${ADMIN_PASSWORD}
            MINIO_BROWSER_REDIRECT_URL: https://${DOMAIN}
            MINIO_SERVER_URL: https://${DOMAIN}:34256 
        command: server --address ":9000" --console-address ":9001" /data

# Maintenance

## Logging

The Elestio MinIO Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://github.com/minio/minio">MinIO Github repository</a>

- <a target="_blank" href="https://min.io/docs/minio/linux/index.html">MinIO documentation</a>

- <a target="_blank" href="https://github.com/elestio-examples/minio">Elestio/MinIO Github repository</a>
