@echo off
set DOCKER_TLS_VERIFY=1
set COMPOSE_TLS_VERSION=TLSv1_2
set DOCKER_CERT_PATH=%~dp0
set DOCKER_HOST=tcp://52.232.25.95:443

kubectl >nul 2>&1
if %ERRORLEVEL% == 0 (
    set KUBECONFIG=
    kubectl config set-cluster ucp_52.232.25.95:6443_pieterd --server https://52.232.25.95:6443 --certificate-authority "%~dp0ca.pem" --embed-certs
    kubectl config set-credentials ucp_52.232.25.95:6443_pieterd --client-key "%~dp0key.pem" --client-certificate "%~dp0cert.pem" --embed-certs
    kubectl config set-context ucp_52.232.25.95:6443_pieterd --user ucp_52.232.25.95:6443_pieterd --cluster ucp_52.232.25.95:6443_pieterd
)
set KUBECONFIG=%~dp0kube.yml

REM
REM Bundle for user pieterd
REM UCP Instance ID qj6dsw0n2zqxgxix0tbsru5pg
REM
REM This admin cert will also work directly against Swarm and the individual
REM engine proxies for troubleshooting.  After sourcing this env file, use
REM "docker info" to discover the location of Swarm managers and engines.
REM and use the --host option to override $DOCKER_HOST
REM
REM Run this command from within this directory to configure your shell:
REM .\env.cmd
