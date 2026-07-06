# Ajustes de produção — UPA

Arquivos ajustados em cima da versão atual enviada.

## O que foi alterado

1. **TV Sala de Espera em tempo real**
   - A TV agora escuta `eventos_chamada` via Supabase Realtime.
   - Também foi adicionado um polling de segurança a cada 3 segundos. Assim, mesmo se o Realtime do Supabase não estiver habilitado ou falhar, a TV ainda busca a última chamada.
   - A TV passa a considerar chamadas para Triagem, Consultório 1, Consultório 2 e Raio-X.

2. **Voz da chamada**
   - Mantido o botão de ativar som da TV.
   - Ao clicar, o sistema faz uma fala de teste: “Som das chamadas ativado.”
   - A voz só toca depois da ativação, respeitando a política de bloqueio de áudio automático do Chrome/Edge.
   - Ajustado texto específico para Triagem, Consultório e Raio-X.

3. **Banner da TV**
   - Removido o carrossel.
   - Removido o painel do Protocolo de Manchester da TV.
   - Banner inferior ficou fixo e menor.

4. **Relatórios**
   - Removidos os cálculos fictícios com `Math.random`.
   - KPIs, barras, prioridades e consultórios agora usam os dados carregados no `state`/Supabase.

## Importante no Supabase

Para o tempo real funcionar 100%, confirme se as tabelas abaixo estão habilitadas no Realtime do Supabase:

- `pacientes`
- `eventos_chamada`

No Supabase, vá em:

Database > Replication > Supabase Realtime

E habilite essas tabelas.

Se preferir via SQL, rode o arquivo `supabase_realtime.sql`.

## Teste recomendado

1. Abrir a URL da TV.
2. Clicar em “Toque aqui para ativar o som das chamadas”.
3. Em outra aba, chamar paciente para Triagem.
4. Confirmar se aparece na TV e fala.
5. Classificar e chamar no Consultório 1.
6. Encaminhar para Raio-X e chamar no Raio-X.
7. Concluir Raio-X e chamar retorno no consultório.
8. Validar se a TV sempre mostra apenas nome + destino.

## Observação sobre voz feminina

A Web Speech API depende das vozes instaladas no Windows e disponíveis no Chrome/Edge do PC da UPA. Por isso a voz pode variar entre computadores. Para uma voz 100% igual e mais profissional, o caminho seria integrar uma API externa, como ElevenLabs, mas isso envolve custo e chave de API.
