clear; clc; close all;

m = zeros(4,4);
m = add_num(m);
m = add_num(m);

num = 1;

while sum(m(:)==0) > 0  ||  num > 0
    
    aux = m;
    
    disp(m)
    k = waitforbuttonpress; 
    % 28 leftarrow
    % 29 rightarrow
    % 30 uparrow
    % 31 downarrow
    value = double(get(gcf,'CurrentCharacter'));

    switch value
        case 28
            for i = 1:4
               row = flip(m(i,:));
               m(i,:) = flip(handle_row(row));
            end
        case 29
            for i = 1:4
               row = m(i,:);
               m(i,:) = handle_row(row);
            end
        case 30
            for i = 1:4
               row = flip(m(:,i)');
               m(:,i) = flip(handle_row(row))';
            end
        case 31
            for i = 1:4
               row = m(:,i)';
               m(:,i) = handle_row(row)';
            end
    end
    
    if sum(sum(abs(aux - m))) ~= 0
        m = add_num(m);
    end
    
    if sum(m(:)==0) == 0
        num = num_moves(m);
    end

end

disp(m);
