#!/bin/zsh

# Captura o conteúdo atual da área de transferência
clipboard_content=$(xclip -selection clipboard -o)

# Tenta avaliar o conteúdo da área de transferência em Python
result=$(python3 -c '
import sys
import io

expr = """'$clipboard_content'"""
try:
    # Tenta avaliar como uma expressão matemática
    value = eval(expr)
    if isinstance(value, (int, float)):
        if isinstance(value, int):
            print(value)
        else:
            print(f"{value:.2f}")
except:
    # Se não for uma expressão matemática simples, executa como código Python
    try:
        # Captura stdout para lidar com saídas de print
        old_stdout = sys.stdout
        sys.stdout = io.StringIO()

        exec(expr)

        # Obtém a saída impressa
        printed_output = sys.stdout.getvalue().strip()
        sys.stdout = old_stdout

        if printed_output:
            print(printed_output)

    except Exception as e:
        print(f"Erro: {e}")
')

# Copia o resultado para a área de transferência
echo -n "$result" | xclip -selection clipboard
