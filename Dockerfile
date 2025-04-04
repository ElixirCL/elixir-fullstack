FROM docker.io/antora/antora

RUN yarn global add asciidoctor-kroki
RUN yarn global add asciidoctor-emoji
RUN yarn global add @antora/lunr-extension