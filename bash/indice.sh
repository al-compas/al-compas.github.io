#!/bin/bash


echo "#+TITLE: Al compás"
echo "#+HTML_HEAD: <link rel="stylesheet" type="text/css" href="css/stylesheet.css" />"
echo
echo "[[https://github.com/al-compas/al-compas.github.io.git][repositorio con la pagina]]"
echo
echo Aquí me pongo a cantar, al compás de mi vigüela...
echo
echo
for f in $(find org/docs -name "*.org"); do
    x=${f//org\//./}
    url=${x//org/html}
    name=${f//.org/}
    name=${name/org\/docs\//}
    printf "+ [[${url}][${name}]]\n"

done 
