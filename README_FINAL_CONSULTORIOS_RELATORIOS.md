# Ajustes finais - UPA Agudos do Sul

## O que foi ajustado

### 1. Consultórios preparados até 4 salas
O sistema agora possui telas prontas para:

- Consultório 1
- Consultório 2
- Consultório 3
- Consultório 4

A lógica de chamada, rechamada, finalização, encaminhamento para Raio-X, retorno de Raio-X e histórico foi preparada para funcionar com qualquer um dos 4 consultórios.

Para alterar o nome dos consultórios, ajuste apenas este bloco no `index.html`:

```js
var CONSULTORIOS_ATIVOS = [1, 2, 3, 4];
var CONSULTORIOS_NOMES = {
  1: 'Consultório 1',
  2: 'Consultório 2',
  3: 'Consultório 3',
  4: 'Consultório 4'
};
```

Exemplo:

```js
var CONSULTORIOS_ATIVOS = [1, 2, 3];
var CONSULTORIOS_NOMES = {
  1: 'Clínico Geral',
  2: 'Pediatria',
  3: 'Odonto',
  4: 'Consultório 4'
};
```

Se a unidade tiver só 2 consultórios, use:

```js
var CONSULTORIOS_ATIVOS = [1, 2];
```

## 2. TV Sala de Espera
A TV continua escutando a tabela `eventos_chamada` em tempo real e também possui polling de segurança a cada 3 segundos.

A TV deve falar/exibir somente chamadas reais:

- Triagem chama paciente
- Consultório chama paciente
- Consultório rechama paciente
- Raio-X chama paciente
- Raio-X rechama paciente
- Médico chama retorno do Raio-X

Não gera chamada na TV:

- Cadastro do paciente
- Classificação da triagem
- Encaminhamento para Raio-X
- Conclusão do Raio-X
- Finalização da consulta

## 3. Voz
A voz fica limitada à tela da TV para evitar áudio duplicado nas telas de recepção, triagem e consultórios.

Importante: no Chrome/Edge, é necessário clicar em **ativar som** na TV antes das chamadas, por causa da política de bloqueio de autoplay do navegador.

## 4. Relatórios
Os relatórios foram mantidos com base em dados reais carregados do Supabase, usando os pacientes da unidade atual. A distribuição por consultório agora considera os consultórios ativos configurados no bloco `CONSULTORIOS_ATIVOS`.

## 5. Separação por unidade
O sistema continua filtrando os pacientes, chamadas e histórico por `unidade_id`. Portanto, os links das unidades podem usar a mesma base Supabase sem misturar dados, desde que cada URL esteja apontando para o slug correto da unidade.

## Checklist de teste

1. Cadastrar paciente na recepção.
2. Chamar na triagem e confirmar se aparece/fala na TV.
3. Classificar e confirmar que não fala na TV ao voltar para aguardar consulta.
4. Chamar no Consultório 1, 2, 3 e 4.
5. Rechamar em cada consultório.
6. Encaminhar para Raio-X e confirmar que não fala nesse momento.
7. Chamar no Raio-X e confirmar TV/voz.
8. Concluir Raio-X e confirmar que não fala nesse momento.
9. Chamar retorno no consultório e confirmar TV/voz.
10. Gerar relatório e validar os números por consultório.


## Ajuste complementar — botão de voz da TV

Foi ajustado o botão de ativação/teste de voz da TV Sala de Espera para ficar sempre visível na própria tela da TV.

- Antes: o botão podia sumir quando o navegador já tinha `localStorage` marcado como som ativado.
- Agora: o botão aparece como **Ativar som das chamadas** ou **Som ativo — testar voz**.
- O botão fica no canto superior direito da TV, abaixo do relógio.
- Cada clique executa uma fala de teste, liberando a política de áudio do Chrome/Edge.


## Ajuste extra - Fila de chamadas na TV

Foi aplicado controle de fila para evitar sobreposição de chamadas.

Regra atual:

- Se a TV não estiver falando ninguém, a chamada aparece e fala imediatamente.
- Se outra chamada chegar durante a fala atual, ela entra na fila.
- A próxima chamada só aparece/fala depois que a fala anterior terminar.
- Existe uma pausa de segurança de aproximadamente 1,5 segundo entre uma chamada e outra.

Isso evita conflito quando Triagem, Consultório 1, Consultório 2, Consultório 3, Consultório 4 ou Raio-X chamarem pacientes quase ao mesmo tempo.
