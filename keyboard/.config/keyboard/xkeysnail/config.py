import re 
from xkeysnail.transform import *

# define timeout for multipurpose_modmap
define_timeout(1)

# [Global modemap] Change modifier keys as in xmodmap
# define_modmap({
#     Key.CAPSLOCK: Key.LEFT_CTRL
# })

# define_keymap(re.compile("Firefox|Google-chrome|Brave"), {
#     # Ctrl+Alt+j/k to switch next/previous tab
#     K("C-M-j"): K("C-TAB"),
#     K("C-M-k"): K("C-Shift-TAB"),
# }, "Firefox and Chrome")

# define_keymap(lambda wm_class: wm_class not in ("Emacs", "URxvt"), {
#     # Cancel
#     K("C-g"): [K("esc"), set_mark(False)],
#     # Escape
#     K("C-q"): escape_next_key,
#     # C-x YYY
#     K("C-x"): {
#         # C-x h (select all)
#         K("h"): [K("C-home"), K("C-a"), set_mark(True)],
#         # C-x C-f (open)
#         K("C-f"): K("C-o"),
#         # C-x C-s (save)
#         K("C-s"): K("C-s"),
#         # C-x k (kill tab)
#         K("k"): K("C-f4"),
#         # C-x C-c (exit)
#         K("C-c"): K("M-f4"),
#         # cancel
#         K("C-g"): pass_through_key,
#         # C-x u (undo)
#         K("u"): [K("C-z"), set_mark(False)],
#     }
# }, "Emacs-like keys")
