# Como buildear: estando en 'U:\repo\credicoop' ejecutar:
# oc new-app . --strategy=docker
# oc start-build jenkins --from-dir="." --follow --loglevel=10

#FROM registry.redhat.io/openshift3/jenkins-2-rhel7
#FROM jenkins-2-custom
#FROM jenkins:2
FROM registry.redhat.io/openshift3/jenkins-2-rhel7

#RUN ls -la ./dimesions-lib/*.jar
#RUN export DIMENSIONS_LIB_FOLDER=plugins/dimensionsscm/WEB-INF/lib/tessting/

# COPIAR LOS .jar OBTENIDOS EN <DM_ROOT>/java_api/lib/ or <DM_ROOT>/AdminConsole/lib/ (Credicoop Dimemnsions Server) EN EL DIR dimesions-lib 
RUN mkdir -p /var/lib/jenkins/plugins/dimensionsscm/WEB-INF/lib/
COPY ./dimensions-libs/*.jar $JENKINS_HOME/plugins/dimensionsscm/WEB-INF/lib/

RUN mkdir -p /var/lib/jenkins/configuration/
COPY ./openshift-pipelines/jenkins/configuration/*.xml $JENKINS_HOME/configuration/