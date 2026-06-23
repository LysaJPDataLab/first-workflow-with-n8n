# 🤖 AI Assistant for Lift Maintenance

Assistente inteligente para manutenção industrial desenvolvido com **n8n**, **Cohere**, arquitetura **RAG (Retrieval-Augmented Generation)**, **MySQL** e **Telegram**, projetado para centralizar conhecimento técnico e operacional do **Elevador de Serviço Avanti Shark L02** em uma única interface conversacional.

A solução permite que técnicos, inspetores e operadores consultem informações em linguagem natural diretamente pelo Telegram, combinando documentação técnica, memória conversacional e dados estruturados armazenados em banco de dados.

---

# 📌 Sobre o Projeto

Em ambientes industriais, informações importantes costumam estar distribuídas entre manuais técnicos, relatórios de inspeção, planilhas e bancos de dados. Isso dificulta o acesso rápido ao conhecimento necessário para atividades de operação, manutenção e diagnóstico.

Este projeto foi desenvolvido para transformar essas fontes de informação em um assistente conversacional especializado, capaz de responder perguntas técnicas e operacionais de forma rápida, contextualizada e fundamentada em dados reais.

O sistema utiliza uma arquitetura híbrida que combina:

* 📚 Base de conhecimento documental (RAG)
* 🧠 Inteligência Artificial Generativa
* 💬 Memória de contexto da conversa
* 🗄️ Banco de dados relacional MySQL
* 📱 Interface via Telegram

---

# 🚀 Funcionalidades

## 📖 Consulta à Documentação Técnica

Permite realizar perguntas sobre:

* Especificações técnicas;
* Componentes do elevador;
* Procedimentos operacionais;
* Manutenção preventiva;
* Dispositivos de segurança;
* Restrições de utilização;
* Orientações do fabricante.

### Exemplos

> Qual a capacidade máxima do elevador?

> Como realizar a descida manual em caso de emergência?

> Como funciona o sistema trava-quedas?

---

## 🛠️ Consulta de Dados Operacionais

Permite acessar informações armazenadas no banco de dados:

* Histórico de inspeções;
* Não conformidades;
* Ações corretivas;
* Dados cadastrais;
* Checklists de manutenção;
* Registro de inspeções realizadas.

### Exemplos

> Quem realizou a última inspeção?

> Existem não conformidades abertas?

> Qual foi a última ação corretiva registrada?

---

## 💬 Conversação com Contexto

O agente mantém memória da conversa, permitindo interações mais naturais.

### Exemplo

**Usuário:** Quem realizou a última inspeção?

**Assistente:** João Silva realizou a inspeção em 15/06/2026.

**Usuário:** E quais não conformidades ele encontrou?

O agente compreende que a segunda pergunta se refere à inspeção mencionada anteriormente.

---

# 🔄 Workflows Desenvolvidos

## 1️⃣ Ingestão de Documentos

Workflow responsável por:

* Coletar documentos técnicos hospedados no GitHub;
* Processar o conteúdo;
* Gerar embeddings utilizando Cohere;
* Armazenar os vetores em uma Vector Store.

**Objetivo:** Transformar documentação técnica em conhecimento pesquisável semanticamente.

---

## 2️⃣ Agente RAG

Workflow responsável por:

* Receber perguntas dos usuários;
* Consultar a base vetorial;
* Recuperar contexto relevante;
* Gerar respostas fundamentadas nos documentos.

**Objetivo:** Permitir consultas inteligentes sobre o manual do equipamento.

---

## 3️⃣ Integração com MySQL

Workflow responsável por:

* Consultar dados estruturados;
* Executar consultas SQL dinamicamente;
* Recuperar informações operacionais.

**Objetivo:** Complementar a documentação técnica com dados reais de manutenção.

---

## 4️⃣ Assistente via Telegram

Workflow final que integra toda a solução.

### Fluxo

```text
Telegram
    ↓
AI Agent
    ↓
RAG + Banco de Dados
    ↓
Resposta
    ↓
Telegram
```

**Objetivo:** Disponibilizar o assistente para uso prático em dispositivos móveis.

---

# 🧠 Tecnologias Utilizadas

| Tecnologia          | Finalidade                          |
| ------------------- | ----------------------------------- |
| n8n                 | Orquestração dos workflows          |
| Cohere Chat Model   | Modelo de linguagem                 |
| Cohere Embeddings   | Geração de embeddings               |
| Simple Vector Store | Armazenamento vetorial              |
| MySQL               | Armazenamento de dados estruturados |
| Railway             | Hospedagem do banco de dados        |
| Telegram Bot API    | Interface conversacional            |
| BotFather           | Criação e gerenciamento do bot      |

---

# 📊 Benefícios da Solução

* Centralização do conhecimento técnico e operacional;
* Redução do tempo de busca por informações;
* Consulta em linguagem natural;
* Menor dependência de documentação física;
* Respostas fundamentadas em dados reais;
* Arquitetura escalável e modular;
* Atualização da base de conhecimento sem retreinamento do modelo;
* Acesso remoto através do Telegram.

---

# 🎯 Aplicação

O projeto foi desenvolvido como prova de conceito para aplicação de Inteligência Artificial Generativa na manutenção industrial, utilizando o **Elevador de Serviço Avanti Shark L02** como ativo de referência.

A solução demonstra como combinar documentação técnica, dados operacionais e agentes inteligentes para criar um copiloto digital capaz de apoiar atividades de inspeção, manutenção, operação e gestão do conhecimento em ambientes industriais.
