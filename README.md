# 📌 Modelagem do Banco de Dados - Oficina de Veículos 🚗🔧  

Este banco de dados foi projetado para gerenciar as operações de uma **oficina mecânica**, incluindo **clientes, veículos, ordens de serviço, peças, serviços e equipes de trabalho**. A modelagem segue um **modelo relacional**, garantindo integridade e eficiência no armazenamento e recuperação dos dados.  

---

## 🏗️ Estrutura do Banco de Dados  

### 🏠 Clientes e Veículos  
- Cada **cliente** pode possuir **um ou mais veículos**.  
- A tabela `Cliente` armazena informações básicas como **nome, endereço e telefone**.  
- A tabela `Veiculo` registra os veículos, vinculando cada um ao seu respectivo cliente.  

### 🔧 Ordem de Serviço (OS)  
- As ordens de serviço são registradas na tabela `Ordem_de_Servico`, contendo informações como **data de emissão, conclusão, status e valor total**.  
- Cada OS está associada a um **veículo** e a uma **equipe de mecânicos**.  

### 👨‍🔧 Equipe e Mecânicos  
- A oficina possui **equipes de mecânicos** registradas na tabela `Equipe`.  
- Cada mecânico, armazenado na tabela `Mecanico`, faz parte de uma única equipe e possui uma **especialidade**.  

### 🛠️ Serviços e Peças Aplicadas  
- A oficina pode aplicar **serviços e peças** às ordens de serviço.  
- A tabela `Servico` registra os serviços disponíveis, incluindo a **descrição e o valor da mão de obra**.  
- A tabela `Peca` contém o **estoque de peças**, com valores unitários e descrição.  
- As tabelas intermediárias `OS_Servico` e `OS_Peca` registram a **quantidade e o valor total aplicado** de cada serviço e peça.  

### 🔗 Relacionamentos Chave  
- Cada OS pode conter **várias peças e serviços**.  
- A relação entre **OS e peças** é armazenada em `OS_Peca_has_Ordem_de_Servico`.  
- A relação entre **OS e serviços** é armazenada em `Ordem_de_Servico_has_OS_Servico`.  

---

## 📊 Consultas Úteis  
✅ **Listar clientes e seus veículos**  
✅ **Buscar ordens de serviço pendentes**  
✅ **Calcular o total gasto por um cliente**  
✅ **Consultar serviços e peças aplicadas em uma OS**  
✅ **Ver mecânicos e suas equipes**  

Este banco de dados permite um **controle eficiente** das operações da oficina, garantindo **rastreamento preciso das ordens de serviço, controle de estoque de peças e gerenciamento das equipes**.  

---

## ⚡ Tecnologia  
- **Banco de Dados:** MySQL  
- **Modelo:** Relacional  
- **Objetivo:** Gestão de oficina mecânica  

🚀 **Contribuições são bem-vindas!**  
