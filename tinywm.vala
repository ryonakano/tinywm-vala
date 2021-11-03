/*
 * SPDX-License-Identifier: Unlicense
 * SPDX-FileCopyrightText: 2021 Ryo Nakano <ryonakaknock3@gmail.com>
 *
 * A Vala-fork of mackstann/tinywm.
 */

public static int main (string[] args) {
    var dpy = new X.Display ();
    if (dpy == null) {
        return 1;
    }

    X.Window root = dpy.default_root_window ();
    dpy.grab_key (dpy.keysym_to_keycode (X.string_to_keysym ("F1")), X.KeyMask.Mod1Mask, root, true, X.GrabMode.Async, X.GrabMode.Async);
    dpy.grab_button (1, X.KeyMask.Mod1Mask, root, true, X.EventMask.ButtonPressMask|X.EventMask.ButtonReleaseMask|X.EventMask.PointerMotionMask, X.GrabMode.Async, X.GrabMode.Async, X.None, (uint)X.None);
    dpy.grab_button (3, X.KeyMask.Mod1Mask, root, true, X.EventMask.ButtonPressMask|X.EventMask.ButtonReleaseMask|X.EventMask.PointerMotionMask, X.GrabMode.Async, X.GrabMode.Async, X.None, (uint)X.None);

    var attr = X.WindowAttributes ();
    var start = X.ButtonEvent ();
    var ev = X.Event ();
    start.subwindow = X.None;
    while (true) {
        dpy.next_event (ref ev);
        switch (ev.type) {
            case X.EventType.KeyPress:
                if (ev.xkey.subwindow != X.None) {
                    dpy.raise_window (ev.xkey.subwindow);
                }

                break;
            case X.EventType.ButtonPress:
                if (ev.xbutton.subwindow != X.None) {
                    dpy.get_window_attributes (ev.xbutton.subwindow, out attr);
                    start = ev.xbutton;
                }

                break;
            case X.EventType.MotionNotify:
                if (start.subwindow != X.None) {
                    int xdiff = ev.xbutton.x_root - start.x_root;
                    int ydiff = ev.xbutton.y_root - start.y_root;
                    dpy.move_resize_window (start.subwindow,
                        attr.x + (start.button == 1 ? xdiff : 0),
                        attr.y + (start.button == 1 ? ydiff : 0),
                        uint.max (1, attr.width + (start.button == 3 ? xdiff : 0)),
                        uint.max (1, attr.height + (start.button == 3 ? ydiff : 0))
                    );
                }

                break;
            case X.EventType.ButtonRelease:
                start.subwindow = X.None;
                break;
        }
    }
}
