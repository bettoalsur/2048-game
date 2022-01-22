function vec = handle_row(vec)

vec = vec(vec~=0);
N = length(vec);

switch N
    case 0
        vec = zeros(1,4);
    case 1
        vec = [ zeros(1,3) vec ];
    case 2
        if vec(1) == vec(2)
            vec = [ zeros(1,3) 2*vec(2) ];
        else
            vec = [ zeros(1,2) vec ];
        end
    case 3 
        if vec(3) == vec(2)
            vec = [ zeros(1,2) vec(1) 2*vec(3) ];
        elseif vec(1) == vec(2)
            vec = [ zeros(1,2) 2*vec(2) vec(3) ];
        else
            vec = [ 0 vec];
        end
    case 4
        if vec(1) ==  vec(2) && vec(3) ==  vec(4)
           vec = [zeros(1,2) 2*vec(2) 2*vec(4) ];
        elseif vec(3) ==  vec(4)
            vec = [ 0 vec(1:2) 2*vec(4) ];
        elseif vec(2) == vec(3)
            vec = [0 vec(1) 2*vec(3) vec(4)];
        elseif vec(1) == vec(2)
            vec = [0 2*vec(2) vec(3:4)];
        else
            % no se hace nada
        end
    
end
