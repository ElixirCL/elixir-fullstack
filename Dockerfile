FROM docker.io/antora/antora:3.1.12

RUN yarn global add asciidoctor-kroki
RUN yarn global add asciidoctor-emoji
RUN yarn global add @antora/lunr-extension
