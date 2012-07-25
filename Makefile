PREFIX?=/opt/local

all:
	cat src/lib/visusage.bash src/viszones > viszones
	chmod +x viszones
	cat src/lib/visusage.bash src/viscores > viscores
	chmod +x viscores
	cat src/lib/visusage.bash src/visdisks > visdisks
	chmod +x visdisks

clean:
	rm -f viszones
	rm -f viscores
	rm -f visdisks

install:
	mkdir -p $(PREFIX)/bin
	cp -f viszones $(PREFIX)/bin/viszones
	cp -f viscores $(PREFIX)/bin/viscores
	cp -f visdisks $(PREFIX)/bin/visdisks

uninstall:
	rm -f $(PREFIX)/bin/viszones
	rm -f $(PREFIX)/bin/viscores
	rm -f $(PREFIX)/bin/visdisks

.PHONY: all clean install uninstall
