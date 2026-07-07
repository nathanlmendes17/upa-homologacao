# Ajuste final — unidades, TV e relatórios

## O que foi ajustado

- A tela da TV agora mostra o nome da unidade carregada pelo slug da URL, e não mais texto fixo "UPA Agudos do Sul".
- O subtítulo da tela de relatórios também usa o nome da unidade atual.
- Exportação PDF/CSV do relatório usa a unidade atual.
- Mantido relatório calculado com dados reais do Supabase/state.
- Incluído SQL `supabase_limpar_dados_teste.sql` para zerar pacientes, chamadas e histórico sem apagar unidades.

## Como validar

1. Abrir `/ubs-pavaozinho/tv` e confirmar se o topo mostra `UBS Pavãozinho`.
2. Abrir `/ubs-centro/tv` e confirmar se o topo mostra `UBS Centro`.
3. Abrir `/ubs-taquara-lisa/tv` e confirmar se o topo mostra `UBS Taquara Lisa`.
4. Abrir Relatórios de cada unidade e confirmar que o subtítulo também muda conforme a unidade.
5. Rodar o SQL de limpeza antes da entrega oficial.

## Observação

Os relatórios só zeram quando os dados de teste forem apagados do Supabase. Se existirem pacientes/eventos/histórico no banco, o relatório vai continuar mostrando números.
