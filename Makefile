.PHONY: html docbook pdf epub build clean

# Consider Docker https://github.com/asciidoctor/docker-asciidoctor

build b:
	@make clean
	@make html
	@make docbook
	@make pdf

html h:
	@mkdir -p docs/book/
	@rm -rf docs/index.html
	@cp -R assets/highlight docs/
	@cp -R book/images docs/book/images
	asciidoctor book.adoc -o docs/index.html

docbook d:
	@mkdir -p docs
	@rm -rf docs/book.xml
	asciidoctor -b docbook book.adoc -o docs/book.xml

pdf p:
	@mkdir -p docs
	@rm -rf docs/book.pdf
	asciidoctor-pdf -a allow-uri-read=true -a source-highlighter=rouge -a rouge-style=monokai_sublime book.adoc -o docs/book.pdf

# Epub is in beta. Maybe try using docbook for best resuts.
epub e:
	@mkdir -p docs
	@rm -rf docs/book.epub
	asciidoctor-epub3 -D docs/book.epub -a allow-uri-read -a ebook-validate -a source-highlighter=rouge -a rouge-style=monokai_sublime book.adoc

clean c:
	@rm -rf docs
