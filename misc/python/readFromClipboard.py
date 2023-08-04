import win32clipboard

# Open the clipboard
win32clipboard.OpenClipboard()

try:
    # Start with the first format available
    format = win32clipboard.EnumClipboardFormats(0)
    
    while format:
        # Try to get the format name
        try:
            format_name = win32clipboard.GetClipboardFormatName(format)
            print(f'Format {format}: {format_name}')
        except Exception as e:
            print(f'Format {format}: no name available')

        # Get the next available format
        format = win32clipboard.EnumClipboardFormats(format)
finally:
    # Close the clipboard
    win32clipboard.CloseClipboard()


