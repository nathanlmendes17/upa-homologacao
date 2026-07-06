-- Habilitar Realtime para as tabelas usadas na sincronização da TV e filas.
-- Rode no SQL Editor do Supabase se as tabelas ainda não estiverem habilitadas em Database > Replication.

alter publication supabase_realtime add table public.pacientes;
alter publication supabase_realtime add table public.eventos_chamada;

-- Se der erro dizendo que a tabela já faz parte da publicação, pode ignorar.
