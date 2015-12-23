#!/bin/bash
[[ $1 == "clean" ]] && echo "CLEANING..." && rm -rf resume.odt resume.pdf styles.xml && exit
cp styles-template.xml styles.xml
[[ $1 == "serif" ]] && echo "Using SERIF" && sed 's/Linux Biolinum/Linux Libertine/g' -i styles.xml
[[ $1 == "roboto" ]] && echo "Using ROBOTO" && sed 's/Linux Biolinum/Roboto Condensed/g' -i styles.xml
[[ $1 == "lato" ]] && echo "Using LATO" && sed 's/Linux Biolinum/Lato/g' -i styles.xml
[[ $1 == "droid" ]] && echo "Using DROID" && sed 's/Linux Biolinum/Droid Sans/g' -i styles.xml
[[ $1 == "cabin" ]] && echo "Using CABIN" && sed 's/Linux Biolinum/Cabin/g' -i styles.xml
zip -r resume.odt content.xml manifest.rdf META-INF/ mimetype styles.xml && unoconv -f pdf resume.odt && echo 'Done.'
[[ $1 == "serif" ]] && mv styles.xml.orig styles.xml
