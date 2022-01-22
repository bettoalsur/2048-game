function m = add_num(m)

n = [repmat(2,1,8) repmat(4,1,2)];
p = 1:16;

new = n(randi([1 length(n)],1));
pos = p(m(:)==0);
pos = pos(randi([1 length(pos)],1));
m(pos) = new;