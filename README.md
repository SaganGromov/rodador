
# Rodador de Expressões

Este é um script em Python que avalia expressões matemáticas ou executa código Python copiado na área de transferência. Ele verifica se o conteúdo da área de transferência é uma expressão matemática válida e, em caso afirmativo, avalia a expressão e copia o resultado formatado de volta para a área de transferência. Se não for uma expressão matemática, ele executa o código e copia a saída para a área de transferência.

## Funcionalidades

- Avalia expressões matemáticas diretamente da área de transferência.
- Formata o resultado da expressão com duas casas decimais.
- Executa código Python e captura a saída.
- Copia o resultado ou a saída de volta para a área de transferência.

## Como Usar

1. **Pré-requisitos**: Certifique-se de ter o Python e o módulo `pyperclip` instalado.
   ```bash
   pip install pyperclip
   ```

2. **Executando o Script**: 
   - Copie uma expressão matemática ou código Python para a área de transferência.
   - Execute o script:
     ```bash
     python rodador.py
     ```
   - O resultado formatado ou a saída do código será copiado automaticamente para a área de transferência.

## Exemplo de Uso

### Avaliando uma Expressão Matemática

1. Copie a expressão matemática `5 + 3 * 2` para a área de transferência.
2. Execute o script.
3. O resultado `11.00` será copiado para a área de transferência.

### Executando Código Python

1. Copie um trecho de código Python como:
   ```python
   for i in range(3):
       print(i)
   ```
2. Execute o script.
3. A saída:
   ```
   0
   1
   2
   ```
   será copiada para a área de transferência.

## Observações

- **Segurança**: Tenha cuidado ao executar código Python dessa forma, especialmente se não souber a origem do código copiado para a área de transferência. Executar código arbitrário pode ser perigoso.
- **Limitações**: Este script não suporta entradas interativas ou código que requer entradas adicionais do usuário durante a execução.

## Erros Comuns

- Se a expressão ou o código não puder ser avaliado ou executado, uma mensagem de erro será exibida no terminal.

