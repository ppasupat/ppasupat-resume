#!/bin/bash
case "$1" in
clean)
  echo "CLEANING..."
  rm -rf resume.odt resume.pdf
  exit
  ;;
# Note: most fonts change the page layout!
"")     FONT="Linux Biolinum" ;;    # Default
comic)  FONT="Comic Sans MS" ;;     # Because why not?
cabin)  FONT="Cabin" ;;
droid)  FONT="Droid Sans" ;;
lato)   FONT="Lato" ;;
liber)  FONT="Linux Libertine" ;;
roboto) FONT="Roboto Condensed" ;;
*)
  echo "Unrecognized font: $1"
  exit 1
  ;;
esac
echo "Using font: $FONT" && \
  sed "s/Linux Biolinum/$FONT/g" -i.orig styles.xml && \
  zip -r resume.odt content.xml manifest.rdf META-INF/ mimetype styles.xml && unoconv -f pdf resume.odt && \
  mv styles.xml.orig styles.xml
  echo 'Done.'
