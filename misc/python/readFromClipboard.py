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


#######################################
# below code is to get the file paths#
#######################################


# import win32clipboard

# # Open the clipboard
# win32clipboard.OpenClipboard()

# try:
#     # Try to get the data in the CF_HDROP format
#     # The CF_HDROP format is identified by the number 15
#     file_paths = win32clipboard.GetClipboardData(15)
# finally:
#     # Close the clipboard
#     win32clipboard.CloseClipboard()

# # Print the file paths
# for path in file_paths:
#     print(path)


