function A=arranges(n,k)
% Функция A=arranges(n,k) возвращает все размещения из n элементов по k
if (n<1)||(k>n)
  A=[];
else
  P=perms(1:n); % сначала - полный список перестановок
  A=P(:,1:k); % взяли k первых столбцов
  A=unique(A,'rows'); % оставили только уникальные строки
end
return
