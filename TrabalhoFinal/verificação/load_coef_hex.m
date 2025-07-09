% programa para abrir um arquivo em hexa( gerado pelo CC) 
clc;
clear all;
close all;

%--------------------------  figura 1   ------------------------------------------------------------------------------------------

f1=figure;
% carrega coeficiente ca_1
fp = fopen('ca_1.hex','r');
W1 = fscanf(fp,'%x');
fclose (fp);
ca_1=signed_hex_val_16bits(W1); 
subplot(4,1,1),plot(ca_1,'r');
title('ca_1');

% carrega coeficiente ca_2
fp = fopen('ca_2.hex','r');
W1 = fscanf(fp,'%x');
fclose (fp);
ca_2=signed_hex_val_16bits(W1); 
subplot(4,1,2),plot(ca_2,'r');
title('ca_2');
% carrega coeficiente ca_3
fp = fopen('ca_3.hex','r');
W1 = fscanf(fp,'%x');
fclose (fp);
ca_3=signed_hex_val_16bits(W1); 
subplot(4,1,3),plot(ca_3,'r');
title('ca_3');
% carrega coeficiente ca_4
fp = fopen('ca_4.hex','r');
W1 = fscanf(fp,'%x');
fclose (fp);
ca_4=signed_hex_val_16bits(W1); 
subplot(4,1,4),plot(ca_4,'r');
title('ca_4');

%--------------------------  figura 2   ------------------------------------------------------------------------------------------
f2=figure;
% carrega coeficiente cd_1
fp = fopen('cd_1.hex','r');
W1 = fscanf(fp,'%x');
fclose (fp);
cd_1=signed_hex_val_16bits(W1); 
subplot(4,1,1),plot(cd_1,'r');
title('cd_1');

% carrega coeficiente cd_2
fp = fopen('cd_2.hex','r');
W1 = fscanf(fp,'%x');
fclose (fp);
cd_2=signed_hex_val_16bits(W1); 
subplot(4,1,2),plot(cd_2,'r');
title('cd_2');
% carrega coeficiente cd_3
fp = fopen('cd_3.hex','r');
W1 = fscanf(fp,'%x');
fclose (fp);
cd_3=signed_hex_val_16bits(W1); 
subplot(4,1,3),plot(cd_3,'r');
title('cd_3');
% carrega coeficiente cd_4
fp = fopen('cd_4.hex','r');
W1 = fscanf(fp,'%x');
fclose (fp);
cd_4=signed_hex_val_16bits(W1); 
subplot(4,1,4),plot(cd_4,'r');
title('cd_4');

%--------------------------  figura 3   ------------------------------------------------------------------------------------------
f3=figure;
%carrega a entrada

fp = fopen('sweep_100_4k_fs8k.hex','r');
W1 = fscanf(fp,'%x');
fclose (fp);

entrada=signed_hex_val_16bits(W1); 
subplot(3,1,1),plot(entrada,'r');
title('entrada');

%carrega a saida da ultima inversa
fp = fopen('saida_ultima_inversa.hex','r');
W1 = fscanf(fp,'%x');
fclose (fp);
saida=signed_hex_val_16bits(W1); 
subplot(3,1,2),plot(entrada,'r');
title('saida');

tam1=length(saida);
diferenca_1=zeros(1,tam1);

for i=1:tam1-200
    diferenca_1(i)=saida(i+145)-entrada(i);
end 

subplot(3,1,3);plot(diferenca_1,'b');
title('diferenca entre a entrada e o coeficiente da ultima inversa');












