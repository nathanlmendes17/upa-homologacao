-- Conferência das unidades cadastradas.
-- Rode no SQL Editor do Supabase para confirmar os slugs usados nas URLs.

select id, nome, slug, proxima_senha
from public.unidades
order by nome;

-- Slugs sugeridos para produção:
-- upa-centro
-- ubs-taquara-lisa
-- ubs-pavaozinho
-- ubs-centro

-- Exemplo de ajuste de slug/nome, adapte o WHERE ao registro correto antes de rodar:
-- update public.unidades set nome = 'UBS Taquara Lisa', slug = 'ubs-taquara-lisa' where slug = 'upa-2';
-- update public.unidades set nome = 'UBS Pavãozinho', slug = 'ubs-pavaozinho' where slug = 'upa-3';
-- update public.unidades set nome = 'UBS Centro', slug = 'ubs-centro' where slug = 'upa-4';
-- update public.unidades set nome = 'UPA Centro', slug = 'upa-centro' where slug = 'upa-agudos-do-sul';

-- Conferência de isolamento por unidade nas filas:
select u.nome, u.slug, p.status, count(*) as total
from public.pacientes p
join public.unidades u on u.id = p.unidade_id
group by u.nome, u.slug, p.status
order by u.nome, p.status;

-- Conferência de chamadas por unidade:
select u.nome, u.slug, e.destino, e.tipo, count(*) as total
from public.eventos_chamada e
join public.unidades u on u.id = e.unidade_id
group by u.nome, u.slug, e.destino, e.tipo
order by u.nome, e.destino, e.tipo;
