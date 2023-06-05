import curses
import subprocess

def draw_window(stdscr):
    k = 0
    cursor_x = 0
    cursor_y = 0

    # Clear and refresh the screen for a blank canvas
    stdscr.clear()
    stdscr.refresh()

    # Start colors in curses
    curses.start_color()
    curses.init_pair(1, curses.COLOR_CYAN, curses.COLOR_BLACK)

    while (k != ord('q')):
        # Initialization
        stdscr.clear()
        height, width = stdscr.getmaxyx()

        # Declaration of strings
        title = "ShellGPT TUI"[:width-1]
        subtitle = "Written by Assistant"[:width-1]
        keystr = "Last key pressed: {}".format(k)[:width-1]
        statusbarstr = "Press 'q' to exit | STATUS BAR | Press 'r' to run ShellGPT REPL"

        if k == 0:
            keystr = keystr + " No key press detected..."

        # Centering calculations
        start_x_title = int((width // 2) - (len(title) // 2) - len(title) % 2)
        start_x_subtitle = int((width // 2) - (len(subtitle) // 2) - len(subtitle) % 2)
        start_x_keystr = int((width // 2) - (len(keystr) // 2) - len(keystr) % 2)

        start_y = int((height // 2) - 2)

        # Rendering some text
        stdscr.attron(curses.color_pair(1))
        stdscr.attron(curses.A_BOLD)
        stdscr.addstr(start_y - 3, start_x_title, title)
        stdscr.addstr(start_y - 2, start_x_subtitle, subtitle)
        stdscr.addstr(start_y, start_x_keystr, keystr)
        stdscr.attroff(curses.color_pair(1))
        stdscr.attroff(curses.A_BOLD)

        # Render status bar
        stdscr.attron(curses.color_pair(3))
        stdscr.addstr(height - 1, 0, statusbarstr)
        stdscr.addstr(height - 1, len(statusbarstr), " " * (width - len(statusbarstr) - 1))
        stdscr.attroff(curses.color_pair(3))

        # Refresh the screen
        stdscr.refresh()

        # Wait for next input
        k = stdscr.getch()

        # Run shell-gpt REPL
        if k == ord('r'):
            command = "--repl"
            output = subprocess.check_output(["sgpt", command])
            stdscr.addstr(start_y + 2, 0, output)

def main():
    curses.wrapper(draw_window)

if __name__ == "__main__":
    main()
