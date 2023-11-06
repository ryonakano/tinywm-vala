# tinywm-vala
![screenshot](screenshot.png)

A port of [TinyWM](https://github.com/mackstann/tinywm) written in Vala.

You'll need the following dependencies to build:

* libglib2.0-dev
* libx11-dev
* meson (or make)
* valac

You may need the following dependencies to run:

* xterm

Build with meson:

```bash
meson setup builddir
ninja -C builddir
```

Alternatively build with make:

```bash
make
```
