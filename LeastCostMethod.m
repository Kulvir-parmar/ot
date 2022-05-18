clc
clear all
format short
cost=[2 10 4 5;6 12 8 11; 3 9 5 7]
A=[12 25 20]
B=[25 10 15 5]
if sum(A)==sum(B)
     fprintf("given tp is balanced")
 else
     fprintf("given tp is not balanced")
     if sum(A)<sum(B)
         cost(end+1,:)=zeros(1,size(B,2))
         A(end+1)=sum(B)-sum(A)
     elseif sum(B)<sum(A)
         cost(:,end+1)=zeros(size(A,2),1)
         B(end+1)=sum(A)-sum(B)
     end
 end
icost=cost
[m,n]=size(cost)   
bfs=m+n-1
x=zeros(size(cost))
for i=1:size(cost,1)
   for j=1:size(cost,2)
        hh=min(cost(:))
        [row_index,col_index]=find(hh==cost)
        x11=min(A(row_index),B(col_index))
        [value,index]=max(x11)
        i=row_index(index)
        j=col_index(index)
        y11=min(A(i),B(j))
        x(i,j)=y11
        A(i)=A(i)-y11
        B(j)=B(j)-y11
        cost(i,j)=inf
   end
end
fprintf('initial bfs=\n')
ibfs=array2table(x)
disp(ibfs)
totalbfs=length(nonzeros(x))
if totalbfs==bfs
    fprintf('the soln is non degenerate')
else
    fprintf('the soln is degenerate')
end
initialcost=sum(sum(icost.*x))
