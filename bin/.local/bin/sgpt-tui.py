import curses
import pexpect
import os
import subprocess
import threading

def parse_chats(chats_output):
    lines = chats_output.decode().split('\n')
    chats = [os.path.basename(line.strip()) for line in lines if line.strip()]
    return chats

def start_chat_repl(chat_name):
    child = pexpect.spawn('sgpt --repl ' + chat_name, timeout=1, encoding='utf-8')
    return child

def main(stdscr):
    stdscr.clear()

    chats_output = subprocess.check_output(['sgpt', '--list-chats'])
    chats = parse_chats(chats_output)

    current_chat = 0
    chat_proc = start_chat_repl(chats[current_chat])

    # Separate loop to read the output of the sgpt REPL
    def read_chat_output():
        while True:
            try:
                chat_proc.expect('\n')
                line = chat_proc.before
                if line is not None:
                    stdscr.addstr(line + '\n')
            except pexpect.TIMEOUT:
                stdscr.addstr("\n> ")
                stdscr.refresh()
                continue

    # Start the read_chat_output function in a separate thread
    threading.Thread(target=read_chat_output).start()

    while True:
        for i, chat in enumerate(chats):
            stdscr.addstr(i, 0, chat)

        key = stdscr.getch()
        if 32 <= key <= 126:
            chat_proc.send(chr(key))
        elif key == curses.KEY_UP and current_chat > 0:
            current_chat -= 1
            chat_proc = start_chat_repl(chats[current_chat])
        elif key == curses.KEY_DOWN and current_chat < len(chats) - 1:
            current_chat += 1
            chat_proc = start_chat_repl(chats[current_chat])

        stdscr.refresh()
curses.wrapper(main)
