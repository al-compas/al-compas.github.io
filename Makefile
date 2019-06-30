org-files:
	./elisp/publicar-org.el

clean-files:
	rm -r files/*

publicar: indice imagenes

clean-ltxpng:
	find . -type d -name ltxpng -exec rm -r {} +


imagenes: org
	./publicar-imagenes

indice:
	./indice.sh > org/index.org

