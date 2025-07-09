# Grupo B

# Dados dos alunos
Nome: Jessica Regina dos Santos 
Matrícula: 22100626

Nome: Gustavo Hideki Guenka Vale
Matrícula: 21202112

# Descrição do Trabalho
Neste trabalho implementamos quatro circuitos: demux 1:4 (pasta: demux1para4), mux 4:1 (pasta: mux4para1) e decodificador BCD para display de 7 segmentos; este recebeu duas versões, a primeira usando expressões lógicas (pasta: decodificadorBCD7Seg-logica) e a segunda usando case statement (pasta: decodificadorBCD7Seg-case). As expressões lógicas foram obtidas pela análise da tabela verdade informada pelo professor.

# Explicação geral
Neste trabalho utilizamos a IDE Quartus II. Implementamos cada circuito e executamos na plataforma. Anotamos três dados de execução: total de funções combinatórias, registradores lógicos dedicados e total de pinos. Em seguida, utilizando o TimeQuest Timing Analyzer, anotamos os dados de atraso (arquivo: relatorio.txt). Verificamos: valor do maior atraso (ns), porta de entrada, porta de saída e o tipo de atraso. Também criamos os estímulos para os circuitos (arquivo: estimulos.do) e, através do ModelSim, analisamos os gráficos fornecidos pela simulação e verificamos o correto funcionamento dos circuitos.

---

- ## Simulação demux1para4
    Utilizando o TimeQuest, descobrimos que o maior atraso no circuito é 4.940 ns. Portanto, utilizando intervalos de 15 ns no Model Sim, fizemos a simulação utilizando a porta “f” como entrada de 1 bit iniciando pelo valor ‘1’ e, em 70 ns, forçamos o valor ‘0’, e também a porta “sel” como entrada de 2 bits iniciando pelo valor “00”, então acrescentamos ‘1’ ao valor utilizado até este chegar em “11” em 45 ns, repetindo esse ciclo aos 70 ns. Observamos as saídas e conferimos os valores comparando-os com a tabela-verdade para confirmar o funcionamento correto do circuito.

    ---


- ## Simulação mux4para1
    Utilizando o TimeQuest, descobrimos que o maior atraso no circuito é 3.748 ns. Portanto, utilizando intervalos de 30 ns no Model Sim, fizemos a simulação utilizando as portas “a”, “b”, “c” e “d”, com as entradas “00”, “01”, “10” e “11”, respectivamente, em 0 ns e a  porta “sel” como entrada de 2 bits iniciando pelo valor “00” e, então , acrescentamos ‘1’ ao valor utilizado até este chegar em “11” em 90 ns. Observamos as saídas e conferimos os valores comparando-os com a tabela-verdade para confirmar o funcionamento correto do circuito.

    ---

- ## Simulação BCD7Seg utilizando Case
    Utilizando o TimeQuest, descobrimos que o maior atraso no circuito é 4.940 ns. Portanto, utilizando intervalos de 11 ns no Model Sim, fizemos a simulação utilizando a porta “bcd” como entrada de 4 bits iniciando pelo valor “0000” em 0 ns, então acrescentamos ‘1’ ao valor utilizado até este chegar em “1111” em 165 ns. Observamos as saídas e conferimos os valores comparando-os com a tabela-verdade para confirmar o funcionamento correto do circuito.

    ---

- ## Simulação BCD7Seg utilizando portas lógicas
    Utilizando o TimeQuest, descobrimos que o maior atraso no circuito é 3.761 ns. Portanto, utilizando intervalos de 11 ns no Model Sim, fizemos a simulação utilizando a porta “bcd” como entrada de 4 bits iniciando pelo valor “0000” em 0 ns, então acrescentamos ‘1’ ao valor utilizado até este chegar em “1001” em 99 ns. Observamos as saídas e conferimos os valores comparando-os com a tabela-verdade para confirmar o funcionamento correto do circuito.

    ---
