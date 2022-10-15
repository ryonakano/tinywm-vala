VC=valac
PROGRAM=tinywm-vala
SRC=tinywm.vala

$(PROGRAM): $(SRC)
	$(VC) --debug -o $(PROGRAM) --pkg glib-2.0 --pkg x11 $^

.PHONY: all
all: clean $(PROGRAM)

.PHONY: install
install:
	cp $(PROGRAM) /usr/bin

.PHONY: uninstall
uninstall:
	$(RM) /usr/bin/$(PROGRAM)

.PHONY: clean
clean:
	$(RM) $(PROGRAM)
