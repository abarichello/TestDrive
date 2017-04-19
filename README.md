# TestDrive
Assignment for EEL5105

### Original assignment(Portuguese):
#### Projeto.pdf

*O projeto final consiste na implementação de um circuito na placa de desenvolvimento DE1 fazendo uso das estruturas
e conhecimentos obtidos durante o curso. O circuito vai implementar a um jogo interativo similar a um jogo de teste de
condução. O comportamento do jogo está definido a seguir:<br/>*
<br/>
• O usuário inicia no estado Init e da inicio ao jogo pressionando o botão de pressão enter (KEY1). Uma vez no estado
Setup o usuário deve escolher um dos quatro mapas de obstáculos (nível de jogo) com os Switches 8 e 7 (SW8..7).<br/>
• Uma vez seleccionado o nível de jogo o usuário pulsa enter de novo (botão de pressão KEY1) e começa o jogo (estado
Game).<br/>
• Uma vez no estado Game o usuário inicia a condução na posição coluna-0 e fila-7 à velocidade 0. O usuário pode
mover o veiculo para cima (↑) e para baixo (↓) usando os switches SW0 e SW1, respectivamente. Para modificar
a velocidade o usuário pode usar os botões de pressão KEY3 e KEY2 para frenar e acelerar, respectivamente. A
velocidade do veículo vai de 0 (Stop) a velocidade 5 (Max).<br/>
• As posições por onde o usuário pode transitar é uma matriz (mapa de bits de 16 × 32), e deve dar duas voltas ao
circuito de obstáculos para chegar ao objectivo. Assim, o usuário deve passar 64 colunas para chegar ao final. A
linha de horizonte de obstáculos será mostrado nos LEDs LED9.. 0 onde o LED9 mostrará sempre o veiculo piscando
a 5Hz.<br/><br/>
• Durante o modo Game painel de controle do veículo será mostrado nos displays HEX5.. 0 com dois modos de selecção
usando o switch SW9. Quando SW9 = 0 HEX5 e HEX4 mostram a letra E de estados e o numero de estado da
maquina de controle, respectivamente. HEX3 e HEX2 mostra a letra b de Bonus e o numero bonus (número de
vezes que o usuário pode bater na corrida). A contagem descendente de 99 a 0 será mostrada no Displays HEX1 e
HEX0.<br/>
• Quando SW9 = 1 HEX5 e HEX4 mostram a letra S de Speed e a velocidade atual, respectivamente. O HEX3 indica
a letra P de P osition e HEX2.. 0 mostraram a posição do veiculo em formato hexadecimal (fila no HEX2 e coluna
no HEX1.. 0). Por exemplo se o veículo se encontra na segunda volta na fila 5 e coluna A, os displays HEX3.. 0
mostraram os caracteres P52A.<br/>
• O usuário deve evitar os obstáculos no tempo de jogo usando os Switches SW0 e SW1 e os botões de pressão KEY3
e KEY2. O numero de vezes que o usuário pode bater com um obstáculo depende do numero de bónus. A contagem
de bónus ira diminuindo com cada batida. Caso o numero de bónus ou o tempo acabe antes de chegar ao objectivo
o jogo terminara (estado End) e será mostrado nos Displays os pontos obtidos. Nos displays HEX3... 0, onde HEX3
e HEX2 indicam as letras Pt de P oint e HEX1 e HEX0 indicam os pontos obtidos. Em este estado End os displays
HEX5 e HEX4 indicaram os caracteres E3 (Estado 3). Em Após estado End o jogo voltará ao estado Init.<br/>
• Um usuário pode em qualquer momento parar o jogo usando o botão de pressão KEY0 zerando a contagem de alvos,
para assim re-iniciar de novo.<br/><br/>

*O esquema geral do projeto é mostrado na Figura 1 e inclui sete blocos diferenciados:*
• Mapas: Quatro unidades onde se declaram os mapa de bits referentes aos mapas de obstáculos.<br/>
• Contadores: Circuitos sequenciais encarregados de gerar três contagens: <br/>
1. contagem decrescente em segundos de dois números em decimal 99 → 0, 
2. Contagem descendente de bónus e 
3. Contagem ascendente de posição.<br/>

• Comparadores e somador : Circuitos combinatórios encarregados de gerar bits que determinam se o jogo acabou.
O somador é encarregado de fazer a soma de pontos no final do jogo (posição horizontal no final do jogo mais 2×
bonus).<br/>
• Registradores: Circuitos sequenciais encarregados de gerar os arrays que definem a velocidade de jogo, posição do
veiculo e horizonte visível do mapa de obstáculos.<br/>
• Controlador: Maquina de controle do jogo.<br/>
• Selectores: Multiplexadores que fornecem sinais de para outros blocos e as saídas para os LEDs e Displays.<br/>
• Debouncer: Visando evitar problemas de temporização em função do aperto de um KEY por um ser humano durar
muitos ciclos de clock, o Button Press Synchronizer (ButtonSync) será fornecido em conjunto com o projeto deve
ser utilizado.
