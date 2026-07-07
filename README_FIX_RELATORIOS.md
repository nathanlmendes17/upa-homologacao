# Ajuste de Relatórios em Tempo Real

## O que foi corrigido

A tela de Relatórios estava calculando os dados somente no carregamento inicial da página. Quando o fluxo era executado depois disso, o Supabase atualizava as filas, mas o relatório não recalculava automaticamente.

Foi ajustado para:

- recalcular o relatório ao entrar na aba Relatórios;
- recalcular o relatório sempre que o estado do sistema for atualizado pelo Supabase/Realtime;
- manter um polling leve a cada 5 segundos quando a aba Relatórios estiver aberta;
- manter os dados baseados no state real carregado do Supabase;
- corrigir os números do PDF/CSV para usar médias reais em vez de valores fixos.

## Como testar

1. Abrir a homologação.
2. Abrir a aba Relatórios e deixar aberta.
3. Em outra janela, cadastrar um paciente com nome `RELATORIO TESTE 01`.
4. Passar o paciente pelo fluxo:
   - Recepção > cadastro;
   - Triagem > chamar;
   - Triagem > classificar;
   - Consultório > chamar;
   - Finalizar.
5. Voltar/observar a aba Relatórios.

Resultado esperado:

- o paciente aparece no relatório;
- os KPIs mudam;
- a prioridade aparece correta;
- o consultório aparece correto após a finalização;
- ao dar F5, os dados continuam.

Se o Realtime não disparar, o polling de 5 segundos deve atualizar a aba Relatórios enquanto ela estiver aberta.
