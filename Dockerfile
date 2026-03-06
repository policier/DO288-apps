FROM default-route-openshift-image-registry.apps.rm2.thpm.p1.openshiftapps.com/openshift/httpd:2.4-ubi10
LABEL "io.openshift.s2i.build.source-location"="s2i-scripts" \
      "io.k8s.display-name"="httpd24-app" \
      "io.openshift.s2i.build.image"="default-route-openshift-image-registry.apps.rm2.thpm.p1.openshiftapps.com/openshift/httpd:2.4-ubi10"

USER root
# Copying in source code
COPY upload/src /tmp/src
# Change file ownership to the assemble user. Builder image must support chown command.
RUN chown -R 1001:0 /tmp/src
USER 1001
# Assemble script sourced from builder image based on user input or image metadata.
# If this file does not exist in the image, the build will fail.
RUN /usr/libexec/s2i/assemble
# Run script sourced from builder image based on user input or image metadata.
# If this file does not exist in the image, the build will fail.
CMD /usr/libexec/s2i/run
