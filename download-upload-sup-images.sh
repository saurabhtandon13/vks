export registry_url=harborsupervisor.corp.internal

export supervisor_service=supervisor-images

docker login ${registry_url}


tanzu imgpkg copy -b projects.packages.broadcom.com/vsphere/iaas/tkg-service/3.2.0/tkg-service:3.2.0  --to-tar tkg-service:3.2.0.tar --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt 

tanzu imgpkg copy -b projects.packages.broadcom.com/vcf_cci_service/cci-supervisor-service-package:v1.0.2 --to-tar cci-supervisor-service-package:v1.0.2.tar --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt

tanzu imgpkg copy -b projects.registry.vmware.com/vsphere/ca-clusterissuer-bundle:v0.0.2 --to-tar ca-clusterissuer-bundle:v0.0.2.tar --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt

tanzu imgpkg copy -b projects.packages.broadcom.com/tkg/packages/standard/harbor:v2.9.1_vmware.1-tkg.1 --to-tar harbor:v2.9.1_vmware.1-tkg.1.tar --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt


tanzu imgpkg copy -b projects.packages.broadcom.com/tkg/packages/standard/contour:v1.28.2_vmware.1-tkg.1 --to-tar contour:v1.28.2_vmware.1-tkg.1.tar --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt


tanzu imgpkg copy -b projects.registry.vmware.com/tkg/packages/standard/external-dns:v0.13.4_vmware.2-tkg.1 --to-tar external-dns:v0.13.4_vmware.2-tkg.1.tar --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt


tanzu imgpkg copy -b projects.packages.broadcom.com/vsphere-labs/argocd-operator@sha256:850cc1f1253f2f898c61d8305b6004373c2f9422faaf562afb26456b790a3155 --to-tar argocd-operator:v0.12.0.tar --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt


tanzu imgpkg copy -b projects.registry.vmware.com/vsphere-labs/external-secrets-operator@sha256:ff797c8624e4c87c36fd97a65bf99d48c8f3e6da13fe15819d9c599fe8daa3c0 --to-tar external-secrets-operator:v0.9.14.tar --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt

echo "Uploading the Images to Registry"

tanzu imgpkg copy --tar tkg-service:3.2.0.tar --to-repo ${registry_url}/${supervisor_service}/tkg-service --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt

tanzu imgpkg copy --tar cci-supervisor-service-package:v1.0.2.tar --to-repo ${registry_url}/${supervisor_service}/cci-supervisor-service-package --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt

tanzu imgpkg copy --tar ca-clusterissuer-bundle:v0.0.2.tar --to-repo ${registry_url}/${supervisor_service}/ca-clusterissuer-bundle --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt

tanzu imgpkg copy --tar harbor:v2.9.1_vmware.1-tkg.1.tar --to-repo ${registry_url}/${supervisor_service}/harbor --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt

tanzu imgpkg copy --tar contour:v1.28.2_vmware.1-tkg.1.tar --to-repo ${registry_url}/${supervisor_service}/contour --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt

tanzu imgpkg copy --tar external-dns:v0.13.4_vmware.2-tkg.1.tar --to-repo ${registry_url}/${supervisor_service}/external-dns --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt

tanzu imgpkg copy --tar argocd-operator:v0.12.0.tar --to-repo ${registry_url}/${supervisor_service}/argocd-operator --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt

tanzu imgpkg copy --tar external-secrets-operator:v0.9.14.tar --to-repo ${registry_url}/${supervisor_service}/external-secrets-operator --cosign-signatures --registry-ca-cert-path=/etc/docker/certs.d/${registry_url}/ca.crt

