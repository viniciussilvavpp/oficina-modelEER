--  Listar todos os clientes e seus veículos
SELECT c.idCliente, c.Nome, c.Endereco, c.Telefone, 
       v.idVeiculo, v.Modelo, v.Placa, v.Ano 
FROM Cliente c
LEFT JOIN Veiculo v ON c.idCliente = v.Cliente_idCliente;

-- Buscar todas as ordens de serviço com informações do veículo e equipe
SELECT os.idOS, os.Data_emissao, os.Data_conclusao, os.Valor_Total, os.Status, 
       v.Modelo, v.Placa, 
       e.Nome_equipe
FROM Ordem_de_Servico os
JOIN Veiculo v ON os.Veiculo_idVeiculo = v.idVeiculo
JOIN Equipe e ON os.Equipe_idEquipe = e.idEquipe;

-- Listar todos os mecânicos e a equipe à qual pertencem
SELECT m.idMecanico, m.Nome, m.Endereco, m.Especialidade, e.Nome_equipe
FROM Mecanico m
JOIN Equipe e ON m.Equipe_idEquipe = e.idEquipe;

-- Buscar peças utilizadas em uma ordem de serviço específica
SELECT os.idOS, p.Descricao, osp.Quantidade, p.Valor_unitario, osp.Valor_total_peca
FROM OS_Peca_has_Ordem_de_Servico osp_rel
JOIN OS_Peca osp ON osp_rel.OS_Peca_idOS_Peca = osp.idOS_Peca
JOIN Peca p ON osp.idOS_Peca = p.OS_Peca_idOS_Peca
WHERE osp_rel.Ordem_de_Servico_idOS = 1;

-- Buscar serviços aplicados em uma ordem de serviço específica
SELECT os.idOS, s.Descricao, oss.Quantidade, s.Valor_mao_obra, oss.Valor_aplicado
FROM Ordem_de_Servico_has_OS_Servico oss_rel
JOIN OS_Servico oss ON oss_rel.OS_Servico_idOS_Servico = oss.idOS_Servico
JOIN Servico s ON oss.idOS_Servico = s.OS_Servico_idOS_Servico
WHERE oss_rel.Ordem_de_Servico_idOS = 1;

-- Listar ordens de serviço pendentes
SELECT os.idOS, os.Data_emissao, os.Status, v.Modelo, v.Placa, e.Nome_equipe
FROM Ordem_de_Servico os
JOIN Veiculo v ON os.Veiculo_idVeiculo = v.idVeiculo
JOIN Equipe e ON os.Equipe_idEquipe = e.idEquipe
WHERE os.Status = 'Pendente';

-- Total gasto por um cliente em ordens de serviço
SELECT c.idCliente, c.Nome, SUM(os.Valor_Total) AS Total_Gasto
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.Cliente_idCliente
JOIN Ordem_de_Servico os ON v.idVeiculo = os.Veiculo_idVeiculo
GROUP BY c.idCliente, c.Nome
ORDER BY Total_Gasto DESC;

