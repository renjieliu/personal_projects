import curses

def main(stdscr):
    # Clear screen and set up curses settings
    curses.curs_set(0)
    stdscr.clear()
    height, width = stdscr.getmaxyx()

    # Initial state variables
    selected_button = 0  # 0 for "Say Something", 1 for "Cancel"
    message = ""
    name_prompt = False
    name_input = ""

    while True:
        stdscr.clear()

        # Title
        stdscr.addstr(1, width // 2 - 5, "My TUI App", curses.A_BOLD)

        # Buttons
        say_style = curses.A_REVERSE if selected_button == 0 else curses.A_NORMAL
        cancel_style = curses.A_REVERSE if selected_button == 1 else curses.A_NORMAL
        stdscr.addstr(height // 2, width // 2 - 10, "Say Something", say_style)
        stdscr.addstr(height // 2 + 1, width // 2 - 10, "Cancel", cancel_style)

        # Message display
        if message:
            stdscr.addstr(height // 2 + 3, width // 2 - len(message) // 2, message, curses.A_BOLD)

        # Handle name prompt if "Say Something" is selected
        if name_prompt:
            stdscr.addstr(height // 2 + 5, width // 2 - 10, "Enter your name: ")
            stdscr.addstr(height // 2 + 6, width // 2 - 10, name_input)
            stdscr.refresh()
            char = stdscr.get_wch()
            if char == '\n':
                # Complete the input and show the message
                message = f"Hello, {name_input}!"
                name_input = ""
                name_prompt = False
            elif char == '\x1b':  # Escape key to cancel
                name_input = ""
                name_prompt = False
            elif isinstance(char, str):
                name_input += char
            continue

        # Refresh screen to display updates
        stdscr.refresh()

        # Capture key press
        key = stdscr.getch()

        # Navigate buttons
        if key == curses.KEY_UP or key == curses.KEY_DOWN:
            selected_button = (selected_button + 1) % 2  # Toggle selection

        # Action for selected button
        elif key == curses.KEY_ENTER or key in [10, 13]:
            if selected_button == 0:  # "Say Something"
                name_prompt = True
                message = ""
            elif selected_button == 1:  # "Cancel"
                break  # Exit program

# Initialize curses
curses.wrapper(main)
