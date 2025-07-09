clear all;
close all;
clc;

%parametros

level=4;
mother_wavelet='db5';
%---------------

ptrArq1 = fopen('sweep_100_4k_fs8k.pcm','rb'); %sinal de entrada
clean = fread(ptrArq1,'short');
fclose(ptrArq1);



nivel = level;

tam=length(clean);

todos_ca= zeros(tam,nivel);
todos_cd= zeros(tam,nivel);
todos_cd_thresholded=zeros(tam,nivel);% para fins de debug
todos_inv= zeros(tam,nivel);

%[~,~,Lo,Hi] = wfilters(mother_wavelet);

%Lo = Lo./sqrt(2); %low pass
%Hi = Hi./sqrt(2); % high pass
Lo=[ 0.11320949129173116243229912925017, 0.42697177135271441317243557023176, 0.51216347213016522044171097149956, 0.097883480673751008249716676345997, -0.17132835769133175629619358915079, -0.022800565942050227824511310359412, 0.054851329321080562195778185241579, -0.0044134000543300452856776416865614, -0.0088959350509300906539866815592177, 0.0023587139692000241852909425688267];
Hi=[ 0.0023587139692000241852909425688267, 0.0088959350509300906539866815592177, -0.0044134000543300452856776416865614, -0.054851329321080562195778185241579, -0.022800565942050227824511310359412, 0.17132835769133175629619358915079, 0.097883480673751008249716676345997, -0.51216347213016522044171097149956, 0.42697177135271441317243557023176, -0.11320949129173116243229912925017];
x_in = clean;
%computa a modwt multinivel
for j=1:nivel
    
    [ todos_ca(:,j),  todos_cd(:,j)] = modwtj(x_in,Lo,Hi,j); 
    x_in=todos_ca(:,j);
    
end 



%computa  a imodwt multinivel
inv=todos_ca(:,nivel);

for j=nivel:-1:1
    
    todos_inv(:,j) = imodwtj(todos_cd(:,j),inv,Lo,Hi,j);
    inv=todos_inv(:,j);  
end 


f1=figure;
for i=1:level
    subplot(nivel,1,i);
    plot(todos_cd(:,i));
    title('cd golden model');
end 
f2=figure;
for i=1:level
    subplot(nivel,1,i);
    plot(todos_ca(:,i));
    title('ca golden model');
end 
f3=figure;

for i=1:level
    subplot(nivel,1,i);
    plot(todos_inv(:,i));
    title('inv golden model');
end 





    
