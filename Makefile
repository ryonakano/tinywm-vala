VALAC?=valac
VALAFLAGS?=-X -Os -X -pedantic -X -Wall

all:
	$(VALAC) $(VALAFLAGS) tinywm.vala --pkg glib-2.0 --pkg x11 -o tinywm-vala

clean:
	rm -f tinywm-vala
