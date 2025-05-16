import tkinter as tk
from tkinter import messagebox

def pop_up_message():
    root = tk.Tk()
    root.withdraw()  # Hide the main window (we only need the popup)
    
    while True:
        response = messagebox.askyesno("Message", "I am an idiot")
        if response == 'yes':
            break  # Exit the loop if the user clicks 'Yes'
    
    root.destroy()  # Close the Tkinter window

if __name__ == "__main__":
    pop_up_message()
