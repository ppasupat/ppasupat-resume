all: resume.pdf

resume.pdf: content.xml styles.xml
	@./run.sh

clean:
	@./run.sh clean
