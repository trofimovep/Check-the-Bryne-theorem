function A=arranges(n,k)
% ������� A=arranges(n,k) ���������� ��� ���������� �� n ��������� �� k
if (n<1)||(k>n)
  A=[];
else
  P=perms(1:n); % ������� - ������ ������ ������������
  A=P(:,1:k); % ����� k ������ ��������
  A=unique(A,'rows'); % �������� ������ ���������� ������
end
return
