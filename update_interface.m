function handles = update_interface(m,handles)

for i = 1:16
    
    if m(i) ~= 0
        str = num2str(m(i));
        
        switch m(i)
            case 2
                cor = [ 236, 239, 241 ];
            case 4 
                cor = ([ 230, 238, 156 ] + [1 1 1]*255)/2;
            case 8 
                cor = [ 245, 127, 23 ];
            case 16 
                cor = [ 255, 87, 34 ];
            case 32
                cor = [ 239, 83, 80 ];
            case 64
                cor = [ 244, 67, 54 ];
            case 128
                cor = [ 255, 224, 130 ];
            case 256
                cor = [ 253, 216, 53 ];
            case 512
                cor = [ 255 204 102 ];
            case 1024
                cor = [ 255, 160, 0 ];
            case 2048
                cor = [ 255, 179, 0 ];
            case 4096
                cor = [ 144 238 144 ];
            otherwise
                cor = [ 255 255 255 ];
        end
        
        if m(i)<= 4
           text_color = [1 1 1 ]*0.25;
        else
            text_color = [1 1 1];
        end
        cor = cor/255;
        
        eval(['set( handles.text', num2str(i) , ',''String'', str);' ]);
        eval(['set( handles.text', num2str(i) , ',''Background'', cor );' ]);
        eval(['set( handles.text', num2str(i) , ',''Foregroundcolor'', text_color );' ]);
    else
        str = ' ';
        cor = [ 0.75 0.75 0.75 ];
        eval(['set( handles.text', num2str(i) , ',''String'', str);' ]);
        eval(['set( handles.text', num2str(i) , ',''Background'', cor );' ]);
    end
    
end