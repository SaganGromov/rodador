import pyperclip
import io
import sys

def checar(expressao):
    try:
        # Tenta avaliar a expressão para verificar se é uma expressão matemática válida
        eval(expressao)
        return True
    except:
        return False

# Obtém o conteúdo atual da área de transferência
conteudo_area_transferencia = pyperclip.paste()

if checar(conteudo_area_transferencia):
    try:
        # Avalia a expressão matemática
        resultado = eval(conteudo_area_transferencia)
        # Converte o resultado para um float e formata para 2 casas decimais
        conteudo_formatado = f"{float(resultado):.2f}"
        # Copia o conteúdo formatado de volta para a área de transferência
        pyperclip.copy(conteudo_formatado)
        # Imprime o conteúdo formatado (opcional, apenas para ver o resultado no terminal)
        print(conteudo_formatado)
    except Exception as erro:
        print(f"Erro ao avaliar a expressão: {erro}")
else:
    try:
        # Usa exec para executar o código e recuperar o valor da última expressão
        saida_capturada = io.StringIO()
        sys.stdout = saida_capturada
        codigo = conteudo_area_transferencia
        exec(codigo)
        sys.stdout = sys.__stdout__
        saida = saida_capturada.getvalue()
        # Copia a saída capturada para a área de transferência
        pyperclip.copy(saida)
        
    except Exception as erro:
        print(f"Erro ao executar o código: {erro}")
