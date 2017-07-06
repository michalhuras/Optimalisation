function array2 = krok(array1) %%przekszta�canie tablic za pomoc� simplexa dualnego

[w,k] = size(array1); %sprawdzamy wielko�� naszej macierzy

% 3.Szukamy najmniejszego yi0
mini=99; %warto�� minimalna i tak jest szukana spo�r�d ujemnych
for i=3:1:w
    if array1(i,2)<mini
       mini=array1(i,2);
       n=i;
        %%po�o�enie najmniejszego yio yio mniejszego od zera, n- wiersz 
    end
end
      
%  4.Wybieramy najwi�ksz� warto�c iloczynu w tym wierszu 
iloczyn=zeros(1,k-2);
iloczyn(1,1)=array1(2,3)/array1(n,3);
iloczynmaks=iloczyn(1,1);
m=3;
for j=4:1:k
    iloczyn(1,j-2)=array1(2,j)/array1(n,j);
    if iloczyn(1,j-2)>iloczynmaks && array1(n,j)<0
        iloczynmaks=iloczyn(1,j-2);
        m=j; %m-numer naszej kolumny
    end
end




%  tworzenie nowej tabelki
array2=array1; %array2-to b�dzie nasza nowa macierz
array3=ones(size(array1)); %array3-do pokazania gdzie zosta�y ju� zmienione warto�ci
array3(1,:)=0;array3(:,1)=0;

array2(1,m)=array1(n,1);
array2(n,1)=array1(1,m);

for i=2:k %wiersz g��wny
      if i==m;
      array2(n,i)=(1/array1(n,m));     
      else
      array2(n,i)=(array1(n,i)/array1(n,m)); 
      end
      array3(n,i)=0;
end

for j=2:w %ta kolumna g��wna
      if j~=n
      array2(j,m)=-(array1(j,m)/array1(n,m));   
      end
      array3(j,m)=0;
end

%zmieniamy reszt� element�w nowej macierzy, kt�re nie nale�� do g��wnej przek�tnej
for j=2:w
      for i=2:k
        if array3(j,i)~=0
        array2(j,i)=array1(j,i)-((array1(n,i)*array1(j,m))/array1(n,m));
        array3(j,i)=0;
        end
    end
end

end




