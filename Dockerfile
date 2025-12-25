FROM docker.io/antora/antora:3.1.14

# We have yarn.tar.gz with all these deps
# This was needed because javascript dependencies tend to rot with time
# So we have static deps that works for this specific antora version

COPY ./yarn.tar.gz /usr/local/share/.config/yarn/global
RUN tar -xzvf /usr/local/share/.config/yarn/global/yarn.tar.gz -C /usr/local/share/.config/yarn/global
RUN rm /usr/local/share/.config/yarn/global/yarn.tar.gz

# Update to the same antora version
#RUN yarn global add @antora/cli@3.1.14 @antora/site-generator@3.1.14

# You can install deps manually if you want
#RUN yarn global add asciidoctor-kroki@0.18.1
#RUN yarn global add asciidoctor-emoji@0.5.0
#RUN yarn global add @antora/lunr-extension@1.0.0-alpha.10
#RUN yarn global add @djencks/asciidoctor-mathjax@0.0.9
