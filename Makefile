PREFIX?=/opt/local
files=viszones viscores visdisks visnet

all: viszones viscores visdisks visnet

viszones: src/lib/visusage.bash src/viszones
	cat $^ > $@
	chmod +x $@
viscores: src/lib/visusage.bash src/viscores
	cat $^ > $@
	chmod +x $@
visdisks: src/lib/visusage.bash src/visdisks
	cat $^ > $@
	chmod +x $@
visnet: src/lib/visusage.bash src/visnet
	cat $^ > $@
	chmod +x $@

clean:
	rm -f $(files)

install:
	mkdir -p "$(PREFIX)/bin"
	cp -f $(files) "$(PREFIX)/bin/"

uninstall:
	rm -f "$(PREFIX)/bin/viszones"
	rm -f "$(PREFIX)/bin/viscores"
	rm -f "$(PREFIX)/bin/visdisks"
	rm -f "$(PREFIX)/bin/visnet"

.PHONY: all clean install uninstall
