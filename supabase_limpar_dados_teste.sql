-- ZERA DADOS DE TESTE SEM APAGAR AS UNIDADES
-- Rodar no SQL Editor do Supabase antes do uso oficial.

delete from triagem_historico;
delete from eventos_chamada;
delete from pacientes;

update unidades
set proxima_senha = 1;

-- Conferência após limpar
select count(*) as total_pacientes from pacientes;
select count(*) as total_eventos_chamada from eventos_chamada;
select count(*) as total_triagem_historico from triagem_historico;

select nome, slug, proxima_senha
from unidades
order by nome;
