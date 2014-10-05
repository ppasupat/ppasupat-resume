#!/bin/bash
[[ $1 == "clean" ]] && echo "CLEANING..." && rm -rf resume.odt resume.pdf && exit
[[ $1 == "serif" ]] && echo "Using SERIF" && sed 's/Linux Biolinum/Linux Libertine/g' -i.orig styles.xml
zip -r resume.odt content.xml manifest.rdf META-INF/ mimetype styles.xml && unoconv -f pdf resume.odt && echo 'Done.'
[[ $1 == "serif" ]] && mv styles.xml.orig styles.xml
