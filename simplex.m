function array2 = simplex(array1)
% zwyk³y simplex


[w,k] = size(array1); %sprawdzamy wielkoœæ naszej macierzy

a=0;
i=3;
while a==0
    if array1(2,i)==0
       a=1;
       m=i; %pierwsza kolumna z zerem
    end
    i=i+1;
end

n=3;
a=0;
for i=3:1:w
    if array1(i,m)>0
    wyznacznik=array1(i,2)/array1(i,m);
        if a==0
               min=wyznacznik;
               n=i;
               a=a+1;
        end
        if wyznacznik<min
            min=wyznacznik;
            n=i;
        end
end



%tworzenie nowej tabeli 
array2=array1; %array2-to bêdzie nasza nowa macierz
array3=ones(size(array1)); %array3-do pokazania gdzie zosta³y ju¿ zmienione wartoœci
array3(1,:)=0;array3(:,1)=0;

array2(1,m)=array1(n,1);
array2(n,1)=array1(1,m);

for i=2:k %wiersz g³ówny
      if i==m;
      array2(n,i)=(1/array1(n,m));     
      else
      array2(n,i)=(array1(n,i)/array1(n,m)); 
      end
      array3(n,i)=0;
end

for j=2:w %ta kolumna g³ówna
      if j~=n
      array2(j,m)=-(array1(j,m)/array1(n,m));   
      end
      array3(j,m)=0;
end

%zmieniamy resztê elementów nowej macierzy, które nie nale¿¹ do g³ównej przek¹tnej
for j=2:w
      for i=2:k
        if array3(j,i)~=0
        array2(j,i)=array1(j,i)-((array1(n,i)*array1(j,m))/array1(n,m));
        array3(j,i)=0;
        end
    end
end

end












