import pandas as pd

# Função simples para validação de dados de performance
def limpar_dados_aerogerador(tabela):
    dados_limpos = tabela.dropna()
    return dados_limpos

print("Script de validação inicializado.")
