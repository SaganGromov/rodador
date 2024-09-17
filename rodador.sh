#!/bin/zsh

# Capture the current clipboard content
clipboard_content=$(xclip -selection clipboard -o)

# Try to evaluate the clipboard content in Python
result=$(python3 -c "
import sys
import io

expr = '''$clipboard_content'''
try:
    # Attempt to evaluate as a mathematical expression
    value = eval(expr)
    if isinstance(value, (int, float)):
        if isinstance(value, int):
            print(value)
        else:
            print(f'{value:.2f}')
except:
    # If it's not a simple mathematical expression, execute it as Python code
    try:
        # Capture stdout to handle print outputs
        old_stdout = sys.stdout
        sys.stdout = io.StringIO()

        exec(expr)

        # Get printed output
        printed_output = sys.stdout.getvalue().strip()
        sys.stdout = old_stdout

        if printed_output:
            print(printed_output)

    except Exception as e:
        print(f'Error: {e}')
")

# Copy the result to the clipboard
echo -n "$result" | xclip -selection clipboard
