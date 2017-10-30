#!/bin/bash
case "$1" in
clean)
  echo "CLEANING..."
  rm -rf resume.odt resume.pdf
  exit
  ;;
# Note: most fonts change the page layout!
"")     FONT="Linux Libertine" ;;
comic)  FONT="Comic Sans MS" ;;
cabin)  FONT="Cabin" ;;
droid)  FONT="Droid Sans" ;;
lato)   FONT="Lato" ;;
bio)    FONT="Linux Biolinum" ;;
liber)  FONT="Linux Libertine" ;;
roboto) FONT="Roboto Condensed" ;;
acc)    FONT="Accanthis ADF Std" ;;
*)
  echo "Unrecognized font: $1"
  exit 1
  ;;
esac

case "$2" in
"")     FONT2="Linux Biolinum" ;;
comic)  FONT2="Comic Sans MS" ;;
cabin)  FONT2="Cabin" ;;
droid)  FONT2="Droid Sans" ;;
lato)   FONT2="Lato" ;;
bio)    FONT2="Linux Biolinum" ;;
liber)  FONT2="Linux Libertine" ;;
roboto) FONT2="Roboto Condensed" ;;
acc)    FONT2="Accanthis ADF Std" ;;
*)
  echo "Unrecognized font: $2"
  exit 1
  ;;
esac

echo "Using font: main = $FONT / header = $FONT2" && \
  sed "s/MAINFONT/$FONT/g;s/HEADERFONT/$FONT2/g" -i.orig styles.xml && \
  zip -r resume.odt content.xml manifest.rdf META-INF/ mimetype styles.xml && unoconv -f pdf resume.odt && \
  mv styles.xml.orig styles.xml
  echo 'Done.'
