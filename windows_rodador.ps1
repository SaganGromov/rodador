# Capture the current clipboard content
$clipboardContent = Get-Clipboard

try {
    # Attempt to evaluate the clipboard content as a mathematical expression
    $result = [ScriptBlock]::Create("param(\$clipboardContent) $($clipboardContent)") | Invoke-Command -ArgumentList $clipboardContent

    # Check if the result is a number
    if ($result -is [int]) {
        $output = $result
    } elseif ($result -is [float]) {
        $output = "{0:N2}" -f $result
    } else {
        throw "Not a simple mathematical expression."
    }
} catch {
    try {
        # If it's not a simple mathematical expression, execute it as Python code
        $output = python -c $clipboardContent
    } catch {
        $output = "Error: $_"
    }
}

# Copy the result to the clipboard
$output | Set-Clipboard

