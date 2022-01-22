function num = num_moves(m)

num = 0;

for i = 1:4
   aux = m(i,:);
   if sum( diff(aux)==0 ) ~= 0
      num = num + 1; 
   end
end

for i = 1:4
   aux = m(:,i);
   if sum( diff(aux)==0 ) ~= 0
      num = num + 1; 
   end 
end