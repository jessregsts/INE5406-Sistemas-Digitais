# Grupo B

# Dados dos alunos
Nome: Jessica Regina dos Santos 
Matrícula: 22100626

Nome: Gustavo Hideki Guenka Vale
Matrícula: 21202112

# Descrição do Trabalho
Neste trabalho implementamos duas verões de circuitos que calculam a SAD (Sum of Absolute Differences): sad-v1 e sad-v3, ambos retirados do exemplo 8 da aula 6T.

# Explicação geral
Neste trabalho utilizamos a IDE Quartus II. Implementamos cada circuito e executamos na plataforma. Anotamos três dados de execução: total de funções combinatórias, registradores lógicos dedicados e total de pinos. Em seguida, utilizando o TimeQuest Timing Analyzer, anotamos os dados de atraso (arquivo: relatorio.txt). Verificamos o valor de Fmax (MHz). Também criamos os estímulos para os circuitos (arquivo: estimulos.do) e, através do ModelSim, analisamos os gráficos fornecidos pela simulação e verificamos o correto funcionamento dos circuitos.

---

- ## Simulação sad-v1
    Utilizando o TimeQuest, descobrimos que o valor de Fmax no circuito é 163.21 MHz. Portanto, utilizando intervalos de 20 ns no Model Sim, fizemos a simulação utilizando a porta “clock” como entrada de relógio. iniciar e reset foram usadas como entradas de 1 bit para iniciar e resetar o circuito, respectivamente. Mem_A e Mem_B são entradas de 8 bits que são os valores obtidos ao acessar o espaço de memória de A ou B. pronto e ler são saídas de 1 bit. endereco é a saída de 6 bits que representa o endereço de memória a ser acessado. resultado é a saída de 14 bits e contém o resultado da SAD ao final da operação. Observamos as saídas e conferimos os valores comparando-os com a tabela-verdade para confirmar o funcionamento correto do circuito.

    ---


- ## Simulação sad-v3
    Utilizando o TimeQuest, descobrimos que o valor de Fmax no circuito é 98.71 MHz. Portanto, utilizando intervalos de 20 ns no Model Sim, fizemos a simulação utilizando a porta “clock” como entrada de relógio. iniciar e reset foram usadas como entradas de 1 bit para iniciar e resetar o circuito, respectivamente. Mem_A e Mem_B são entradas de 32 bits que são os valores obtidos ao acessar o espaço de memória de A ou B. pronto e ler são saídas de 1 bit. endereco é a saída de 6 bits que representa o endereço de memória a ser acessado. resultado é a saída de 14 bits e contém o resultado da SAD ao final da operação. Observamos as saídas e conferimos os valores comparando-os com a tabela-verdade para confirmar o funcionamento correto do circuito.

    ---
