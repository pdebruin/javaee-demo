export DOCKER_TLS_VERIFY=1
export COMPOSE_TLS_VERSION=TLSv1_2
export DOCKER_CERT_PATH=$PWD
export DOCKER_HOST=tcp://52.232.25.95:443

if kubectl >/dev/null 2>&1; then
    unset KUBECONFIG
    kubectl config set-cluster ucp_52.232.25.95:6443_pieterd --server https://52.232.25.95:6443 --certificate-authority "$PWD/ca.pem" --embed-certs
    kubectl config set-credentials ucp_52.232.25.95:6443_pieterd --client-key "$PWD/key.pem" --client-certificate "$PWD/cert.pem" --embed-certs
    kubectl config set-context ucp_52.232.25.95:6443_pieterd --user ucp_52.232.25.95:6443_pieterd --cluster ucp_52.232.25.95:6443_pieterd
fi
export KUBECONFIG=$PWD/kube.yml

#
# Bundle for user pieterd
# UCP Instance ID qj6dsw0n2zqxgxix0tbsru5pg
#
# This admin cert will also work directly against Swarm and the individual
# engine proxies for troubleshooting.  After sourcing this env file, use
# "docker info" to discover the location of Swarm managers and engines.
# and use the --host option to override $DOCKER_HOST
#
# Run this command from within this directory to configure your shell:
# eval "$(<env.sh)"
