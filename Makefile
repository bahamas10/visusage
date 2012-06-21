PREFIX?=/opt/local

all:
	cat src/lib/visusage.bash src/viszones > viszones
	chmod +x viszones
	cat src/lib/visusage.bash src/viscores > viscores
	chmod +x viscores

clean:
	rm -f viszones
	rm -f viscores

install:
	mkdir -p $(PREFIX)/bin
	cp -f viszones $(PREFIX)/bin/viszones
	cp -f viscores $(PREFIX)/bin/viscores

uninstall:
	rm -f $(PREFIX)/bin/viszones
	rm -f $(PREFIX)/bin/viscores
