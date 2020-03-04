# Como buildear: estando en 'U:\repo\credicoop' ejecutar:
# oc new-app . --strategy=docker
# oc start-build jenkins --from-dir="." --follow --loglevel=10
# oc start-build jenkins (apuntando a un repo Git)

FROM registry.redhat.io/openshift3/jenkins-2-rhel7
#FROM jenkins-2-custom
#FROM jenkins:2
#FROM registry.redhat.io/openshift4/ose-jenkins:latest

# COPIAR LOS .jar OBTENIDOS EN <DM_ROOT>/java_api/lib/ or <DM_ROOT>/AdminConsole/lib/ (Credicoop Dimemnsions Server) EN EL DIR dimesions-lib 
COPY ./dimensions-libs/*.jar /opt/lib/jenkins/plugins/dimensionsscm/WEB-INF/lib/

COPY ./openshift-pipelines/jenkins/configuration/*.xml /opt/lib/jenkins/configuration/
