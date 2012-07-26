PREFIX?=/opt/local
files=viszones viscores visdisks

all:
	cat src/lib/visusage.bash src/viszones > viszones
	cat src/lib/visusage.bash src/viscores > viscores
	cat src/lib/visusage.bash src/visdisks > visdisks
	chmod +x $(files)

clean:
	rm -f $(files)

install:
	mkdir -p "$(PREFIX)/bin"
	cp -f $(files) "$(PREFIX)/bin/"

uninstall:
	rm -f "$(PREFIX)/bin/viszones"
	rm -f "$(PREFIX)/bin/viscores"
	rm -f "$(PREFIX)/bin/visdisks"

.PHONY: all clean install uninstall
