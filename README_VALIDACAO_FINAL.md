# Ajuste final — TV, voz e separação por unidade

## O que foi ajustado nesta versão

1. A TV Sala de Espera só reage quando a própria tela de TV estiver ativa.
   - Isso evita áudio duplicado em Recepção/Triagem/Consultórios quando o som foi ativado no mesmo navegador.
   - A TV continua escutando `eventos_chamada` em tempo real e também possui polling de segurança.

2. O fluxo de chamadas foi preservado:
   - Fala/aparece na TV: chamar Triagem, chamar Consultório 1/2, rechamar Consultório 1/2, chamar Raio-X, rechamar Raio-X e chamar retorno do Raio-X pelo consultório.
   - Não fala/não aparece na TV: cadastro, classificação da triagem, encaminhar para Raio-X, concluir Raio-X/voltar para retorno e finalizar consulta.

3. Separação das unidades validada no código:
   - A unidade é carregada pelo primeiro trecho da URL, por exemplo `/ubs-taquara-lisa/tv`.
   - Depois disso, todas as buscas principais usam `.eq('unidade_id', UNIDADE_ID)`.
   - Os eventos de chamada também gravam `unidade_id`.
   - Isso permite usar o mesmo sistema e o mesmo banco, desde que cada link use um slug diferente cadastrado na tabela `unidades`.

## URLs esperadas

Trocar o domínio pelo domínio real do Vercel:

- `/upa-centro/recepcao`
- `/upa-centro/tv`
- `/upa-centro/triagem`
- `/upa-centro/consultorio1`
- `/upa-centro/consultorio2`
- `/upa-centro/raiox`

- `/ubs-taquara-lisa/recepcao`
- `/ubs-taquara-lisa/tv`

- `/ubs-pavaozinho/recepcao`
- `/ubs-pavaozinho/tv`

- `/ubs-centro/recepcao`
- `/ubs-centro/tv`

## Teste obrigatório antes da instalação

Para cada unidade, testar pelo menos:

1. Abrir a TV da unidade e clicar em **Ativar voz das chamadas**.
2. Cadastrar um paciente na recepção da mesma unidade.
3. Chamar na triagem: deve aparecer e falar na TV.
4. Classificar: não deve falar na TV, apenas voltar para fila médica.
5. Chamar pelo Consultório 1: deve aparecer e falar na TV.
6. Rechamar pelo Consultório 1: deve aparecer e falar na TV.
7. Encaminhar para Raio-X: não deve falar na TV.
8. Chamar pelo Raio-X: deve aparecer e falar na TV.
9. Concluir Raio-X: não deve falar na TV, apenas voltar para retorno.
10. Médico chamar retorno do Raio-X: deve aparecer e falar na TV.
11. Repetir rapidamente em outra unidade e confirmar que uma unidade não aparece na TV da outra.

## Observação sobre voz

A voz usa Web Speech API do navegador. No Chrome/Windows, o áudio automático só funciona depois de uma interação do usuário na tela. Por isso o botão de ativação deve ser clicado na TV quando abrir o painel.

A qualidade da voz feminina depende das vozes instaladas no Windows/Chrome daquele computador. Para voz igual e profissional em todos os PCs, seria necessário integrar uma API externa, como ElevenLabs.
