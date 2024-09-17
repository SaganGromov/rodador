
# Documentação do Script `rodador.sh`

## Descrição
Este script é um script `zsh` que interage com a área de transferência e tenta avaliar seu conteúdo usando Python. O script realiza as seguintes etapas:

1. Captura o conteúdo atual da área de transferência.
2. Tenta avaliar esse conteúdo como uma expressão Python.
3. Se a avaliação for bem-sucedida e resultar em um valor numérico, formata e imprime o valor.
4. Se não for uma expressão matemática simples, tenta executar o conteúdo como código Python e capturar qualquer saída.
5. Finalmente, copia o resultado de volta para a área de transferência.

## Detalhes do Funcionamento

### Captura do Conteúdo da Área de Transferência
```zsh
clipboard_content=$(xclip -selection clipboard -o)
```
Esta linha captura o conteúdo atual da área de transferência usando o comando `xclip` e armazena em `clipboard_content`.

### Avaliação do Conteúdo com Python
```zsh
result=$(python3 -c "
...
")
```
O script passa o conteúdo da área de transferência para um script Python embutido. Este script Python tenta primeiro avaliar o conteúdo como uma expressão matemática usando `eval`. Se isso falhar, tenta executar o conteúdo como código Python.

#### Avaliação como Expressão Matemática
```python
value = eval(expr)
if isinstance(value, (int, float)):
    if isinstance(value, int):
        print(value)
    else:
        print(f'{value:.2f}')
```
Se o conteúdo puder ser avaliado como uma expressão matemática e resultar em um inteiro ou ponto flutuante, ele imprime o valor formatado.

#### Execução como Código Python
Se a avaliação falhar, o script tenta executar o conteúdo como código Python:
```python
exec(expr)
```
Ele captura qualquer saída produzida por `print` e a imprime.

### Tratamento de Erros
```python
except Exception as e:
    print(f'Erro: {e}')
```
Se a execução do código Python falhar, o script captura a exceção e imprime uma mensagem de erro.

### Copia o Resultado para a Área de Transferência
```zsh
echo -n "$result" | xclip -selection clipboard
```
O resultado da avaliação ou execução é então copiado de volta para a área de transferência.

## Requisitos
- `zsh`
- `xclip`
- `python3`

## Como Usar
1. Copie um texto ou expressão Python para a área de transferência.
2. Execute o script.
3. O resultado será automaticamente copiado para a área de transferência.

## Observações

O fluxo de execução do script pode ser significativamente melhorado com o uso de atalhos de teclado personalizados. No Pop!_OS, por exemplo, é possível definir atalhos que executam scripts diretamente, facilitando a execução sem a necessidade de abrir um terminal manualmente. 

Para criar um atalho no Pop!_OS:
1. Acesse **Configurações** > **Teclado** > **Atalhos personalizados**.
2. Adicione um novo atalho com o comando para executar o script.
