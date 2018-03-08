$Env:DOCKER_TLS_VERIFY = 1
$Env:DOCKER_CERT_PATH = Split-Path $script:MyInvocation.MyCommand.Path
$Env:DOCKER_HOST = "tcp://ucppieterd-ee3.westeurope.cloudapp.azure.com:443"

$d = Split-Path $script:MyInvocation.MyCommand.Path
if (Get-Command kubectl -ErrorAction Ignore) {
        $Env:KUBECONFIG = $null
        kubectl config set-cluster ucp_ucppieterd-ee3.westeurope.cloudapp.azure.com:6443_pieterd --server https://ucppieterd-ee3.westeurope.cloudapp.azure.com:6443 --certificate-authority "$(Join-Path $d ca.pem)" --embed-certs
        kubectl config set-credentials ucp_ucppieterd-ee3.westeurope.cloudapp.azure.com:6443_pieterd --client-key "$(Join-Path $d key.pem)" --client-certificate "$(Join-Path $d cert.pem)" --embed-certs
        kubectl config set-context ucp_ucppieterd-ee3.westeurope.cloudapp.azure.com:6443_pieterd --user ucp_ucppieterd-ee3.westeurope.cloudapp.azure.com:6443_pieterd --cluster ucp_ucppieterd-ee3.westeurope.cloudapp.azure.com:6443_pieterd
}
$Env:KUBECONFIG = Join-Path $d kube.yml

#
# Bundle for user pieterd
# UCP Instance ID xjfywgqfkqd6313ow7n1v00kb
#
# This admin cert will also work directly against Swarm and the individual
# engine proxies for troubleshooting.  After sourcing this env file, use
# "docker info" to discover the location of Swarm managers and engines.
# and use the --host option to override $DOCKER_HOST
#
# Run this command from within this directory to configure your shell:
# Import-Module .\env.ps1
