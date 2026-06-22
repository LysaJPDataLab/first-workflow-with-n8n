-- =====================================================
-- BANCO DE DADOS - INSPEÇÃO DIÁRIA ELEVADOR AVANTI SHARK L02
-- Projeto: Chatbot de O&M com IA (RAG)
-- Banco: MySQL (Railway)
-- Autor: Lysara Pinheiro
-- =====================================================

-- =====================================================
-- TABELA: ELEVADORES
-- =====================================================

CREATE TABLE elevadores (
id INT AUTO_INCREMENT PRIMARY KEY,
codigo VARCHAR(50) NOT NULL UNIQUE,
modelo VARCHAR(50) NOT NULL,
fabricante VARCHAR(100) NOT NULL,
aerogerador VARCHAR(20) NOT NULL,
localizacao VARCHAR(100),
capacidade_kg INT,
capacidade_pessoas INT,
data_instalacao DATE,
status_ativo ENUM(
'OPERACIONAL',
'MANUTENCAO',
'INTERDITADO'
) DEFAULT 'OPERACIONAL'
);

INSERT INTO elevadores (
codigo,
modelo,
fabricante,
aerogerador,
localizacao,
capacidade_kg,
capacidade_pessoas,
data_instalacao
)
VALUES (
'SHARK-L02-T101',
'Shark L02',
'Avanti',
'T101',
'Complexo Eólico Tucano',
240,
2,
'2024-01-15'
);

-- =====================================================
-- TABELA: INSPETORES
-- =====================================================

CREATE TABLE inspetores (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
matricula VARCHAR(30) UNIQUE,
funcao VARCHAR(100),
empresa VARCHAR(100)
);

INSERT INTO inspetores
(nome, matricula, funcao, empresa)
VALUES
('Larissa Vitória Kich','AUR001','Analista WTG II','Auren Energia'),
('João Santos','AUR002','Técnico Eletromecânico','Auren Energia'),
('Maria Oliveira','AUR003','Mantenedora Operadora','Auren Energia'),
('Carlos Souza','AUR004','Técnico de Manutenção','Auren Energia'),
('Fernanda Lima','AUR005','Engenheira de O&M','Auren Energia');

-- =====================================================
-- TABELA: INSPEÇÕES
-- =====================================================

CREATE TABLE inspecoes (
id INT AUTO_INCREMENT PRIMARY KEY,

```
elevador_id INT NOT NULL,
inspetor_id INT NOT NULL,

data_inspecao DATE NOT NULL,
hora_inspecao TIME NOT NULL,

condicao_final ENUM(
    'LIBERADO',
    'LIBERADO_COM_RESTRICAO',
    'INTERDITADO'
) NOT NULL,

observacoes TEXT,

FOREIGN KEY (elevador_id)
    REFERENCES elevadores(id),

FOREIGN KEY (inspetor_id)
    REFERENCES inspetores(id)
```

);

INSERT INTO inspecoes
(
elevador_id,
inspetor_id,
data_inspecao,
hora_inspecao,
condicao_final,
observacoes
)
VALUES
(1,1,'2026-05-01','07:10:00','LIBERADO','Inspeção sem anomalias.'),
(1,2,'2026-05-02','07:08:00','LIBERADO','Equipamento normal.'),
(1,3,'2026-05-03','07:15:00','LIBERADO_COM_RESTRICAO','Ruído observado no sistema de tração.'),
(1,4,'2026-05-04','07:05:00','INTERDITADO','Falha no trava-quedas.'),
(1,5,'2026-05-05','07:11:00','LIBERADO','Após correção do trava-quedas.');

-- =====================================================
-- TABELA: ITENS DA CHECKLIST
-- =====================================================

CREATE TABLE itens_checklist (
id INT AUTO_INCREMENT PRIMARY KEY,
item VARCHAR(100) NOT NULL,
descricao TEXT
);

INSERT INTO itens_checklist (item)
VALUES
('Porta da cabine'),
('Botão de emergência'),
('Controles de subida'),
('Controles de descida'),
('Trava-quedas'),
('Detector de obstrução superior'),
('Detector de obstrução inferior'),
('Pontos de ancoragem'),
('Cabos de tração'),
('Cabos de segurança'),
('Guias de cabo'),
('Iluminação interna'),
('Indicador sonoro'),
('Indicador luminoso'),
('Limpeza geral');

-- =====================================================
-- TABELA: NÃO CONFORMIDADES
-- =====================================================

CREATE TABLE nao_conformidades (
id INT AUTO_INCREMENT PRIMARY KEY,

```
inspecao_id INT NOT NULL,

componente VARCHAR(100),
descricao TEXT NOT NULL,

severidade ENUM(
    'BAIXA',
    'MEDIA',
    'ALTA',
    'CRITICA'
),

acao_recomendada TEXT,

status_correcao ENUM(
    'ABERTA',
    'EM_ANDAMENTO',
    'ENCERRADA'
) DEFAULT 'ABERTA',

FOREIGN KEY (inspecao_id)
    REFERENCES inspecoes(id)
```

);

INSERT INTO nao_conformidades
(
inspecao_id,
componente,
descricao,
severidade,
acao_recomendada,
status_correcao
)
VALUES
(
3,
'Sistema de Tração',
'Ruído anormal durante deslocamento ascendente.',
'MEDIA',
'Inspecionar motor e caixa redutora.',
'ENCERRADA'
),
(
4,
'Trava-Quedas',
'Falha no teste funcional do dispositivo.',
'CRITICA',
'Retirar equipamento de operação imediatamente.',
'ENCERRADA'
),
(
4,
'Cabo de Segurança',
'Desgaste identificado próximo ao ponto de ancoragem.',
'ALTA',
'Substituir cabo antes do retorno à operação.',
'EM_ANDAMENTO'
);
