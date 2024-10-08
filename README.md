<div id="top"></div>


<!-- CI Badge -->
<a href="https://github.com/caard0s0/vanguard-server/actions/workflows/ci.yml">
    <img src="https://github.com/caard0s0/vanguard-server/actions/workflows/ci.yml/badge.svg?branch=main" alt="Build Status">
</a>

<!-- Build & Publish Docker Badge -->
<a href="https://github.com/caard0s0/vanguard-server/actions/workflows/deploy.yml">
    <img src="https://github.com/caard0s0/vanguard-server/actions/workflows/deploy.yml/badge.svg?branch=main" alt="Build Status">
</a>

&nbsp;


<!-- About the Project -->
<div align="center">
    <h2>Vanguard - API Server</h2>
    <p>A complete RESTful API for Financial Institutions, developed with <a href="https://go.dev/">Go</a>.</p>
    <a href="https://github.com/caard0s0/vanguard-server/issues">Report Bugs</a>
    &nbsp;&bull;&nbsp;
    <a href="https://github.com/caard0s0/vanguard-server/actions">Actions</a>
    &nbsp;&bull;&nbsp;
    <a href="https://github.com/caard0s0/vanguard-server/pulls">Pull Requests</a>
</div>

&nbsp;

![bank](https://github.com/user-attachments/assets/69e542a3-1b9f-4479-81ea-cea3fa5eb6ed)

A Financial Software specialized in the intermediation of money between savers and those in need of loans, as well as in the custody of that money.

This API was written following SOLID principles and Clean Code guidelines, for better scalability and code maintenance.

Using PostgreSQL as a database ensures durability and consistency in financial records.

The application was deployed on AWS, efficiently orchestrated by Kubernetes. This choice allows for dynamic scalability and simplified container management.

The implementation of automated tests, integrated into the continuous integration (CI) process, ensures code stability at all phases of development.
 
Additionally, monitoring is a priority. Prometheus and Grafana work together to provide detailed insights into application performance. This proactive approach, through metrics and dashboards, allows a quick response to any anomaly, maintaining system reliability and availability.

&nbsp;

<h3>Built With</h3>

[![Tech Tools](https://skillicons.dev/icons?i=go,postgres,docker,aws,kubernetes,githubactions,postman,grafana,prometheus)](https://skillicons.dev)


<!-- Table of Contents -->
<details>
  <summary>Table of Contents</summary>
    <ol>
        <li>
            <a href="#getting-started">Getting Started</a>
            <ul>
                <li><a href="#installation">Installation</a></li>
                <li><a href="#usage">Usage</a></li>
                <li><a href="#tests">Tests</a></li>
            </ul>
        </li>
        <li><a href="#grafana-dashboard">Grafana Dashboard</a></li>
        <li><a href="#api-documentation">API Documentation</a></li>
        <li><a href="#license">License</a></li>
        <li><a href="#contact">Contact</a></li>
    </ol>
</details>

&nbsp;


<!-- Getting Started -->
<h2 id="getting-started">Getting Started</h2>

<p>To get started, You need to have <strong>Go 1.22+</strong> installed on your machine, for more information visit <a href="https://go.dev/dl/">Go Downloads</a>. You also need to have <strong>Docker Desktop</strong> installed, for more information visit <a href="https://www.docker.com/products/docker-desktop/">Docker Desktop Install</a>.</p>

<p><strong>OBS:</strong> This guide is designed to run this project locally (Local Development), on Linux-based systems.</p>


<!-- Installation -->
<h3 id="installation">Installation</h3>

1. Clone the repository.
    ```bash
    git clone https://github.com/caard0s0/vanguard-server.git
    ```

2. Install <strong>Golang-Migrate</strong> as CLI. for more information visit <a href="https://github.com/golang-migrate/migrate/tree/master/cmd/migrate">Golang CLI Documentation</a>.

3. Create an `app.env` file with environment variables.

    <strong>WARNING:</strong> The values ​​below are for testing purposes only, please change them in the future.

    ```bash
    cat > app.env << EOF
    DB_DRIVER=postgres
    DB_SOURCE=postgresql://root:secret@postgres:5432/bank?sslmode=disable
    HTTP_SERVER_ADDRESS=0.0.0.0:80
    HTTP_CLIENT_ADDRESS=http://localhost:3000

    TOKEN_SYMMETRIC_KEY=12345678901234567890123456789012
    ACCESS_TOKEN_DURATION=30m

    EMAIL_SENDER_NAME=
    EMAIL_SENDER_ADDRESS=
    EMAIL_SENDER_PASSWORD=
    EOF
    ```

4. Install <strong>GoMock</strong> and be able to use the <strong>MockGen</strong> tool.

    * Framework installation.

        ```bash
        go install github.com/golang/mock/mockgen@v1.6.0
        ```

    * add this PATH to your <strong>go/bin</strong> folder in the `~/.zshrc` file or another Shell.

        <strong>WARNING:</strong> This PATH below is just an example.

        ```bash
        export PATH=$PATH:~/.asdf/installs/golang/1.22.5/packages/bin
        ```

5. Install <strong>SQLC</strong>. for more information visit <a href="https://docs.sqlc.dev/en/latest/index.html">SQLC Documentation</a>.

<strong>WARNING:</strong> To install and use the <strong>Full Application</strong>, click on the <strong>Link</strong> below.

6. Install the <strong>Client Side</strong>. for more information visit <a href="https://github.com/caard0s0/vanguard-client">Vanguard - Web Version</a>.


<!-- Usage -->
<h2 id="usage">Usage</h2>

<p>After completing the installation, you can run the project.</p>

1. Create and run the <strong>Containers</strong>.

    ```cmd
    docker compose up -d
    ```


<!-- Tests -->
<h2 id="tests">Tests</h2>

<p>To be able to run all the tests, follow the command below.</p>

1. Run all the <strong>Tests</strong>.

    ```cmd
    go test -v -cover ./...
    ```


<br>

<!-- Grafana Dashboard -->
<h2 id="grafana-dashboard">Grafana Dashboard</h2>

<p>A dashboard created with Grafana to view all the main information about <strong>Docker Containers</strong> and <strong>Requests</strong>.</p>

![docker_dashboard](https://github.com/caard0s0/united-atomic-bank-server/assets/95318788/77bb2774-20ff-4d0e-b652-2d9b72be5618)
&nbsp;
![api_dashboard](https://github.com/caard0s0/united-atomic-bank-server/assets/95318788/dfde683d-24db-4841-a960-89db31114446)

<br>

<!-- API Documentation -->
<h2 id="api-documentation">API Documentation</h2>

<p>A complete and detailed documentation of the API using <strong>Swagger</strong>. To view, visit <a href="https://uab-api.onrender.com/docs/index.html#/">API Documentation</a>.</p>

![swagger_docs](https://github.com/user-attachments/assets/3b62e9d7-efde-47fa-9a92-a9adcf8b0d98)

<br>


<!-- License -->
<h2 id="license">License</h2>

This project is being distributed under the <strong>MIT License</strong>, see ```LICENSE.txt``` for more information.


<br>


<!-- Contact -->
<h2 id="contact">Contact</h2>

* Software Engineer  
* Vinicius Cardoso - <a href="mailto:cardoso.business.ctt@gmail.com">Email</a>

<p align="right">
    <a href="#top"> &uarr; back to top</a>
</p> 
