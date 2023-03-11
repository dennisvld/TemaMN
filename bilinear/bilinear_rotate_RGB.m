function out = bilinear_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica interpolare bilineara pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    rosu = img(:,:,1);
    verde = img(:,:,2);
    albastru = img(:,:,3);
    
    % TODO: extrage canalul rosu al imaginii
    out_rosu = bilinear_rotate(rosu, rotation_angle);
    
    % TODO: extrage canalul verde al imaginii
    out_verde = bilinear_rotate(verde, rotation_angle);
    
    % TODO: extrace canalul albastru al imaginii
    out_albastru = bilinear_rotate(albastru, rotation_angle);
    

    % TODO: aplică rotația pe fiecare canal al imaginii
    
    % TODO: reconstruiește imaginea RGB finala (hint: cat)
    out = cat(3, out_rosu, out_verde, out_albastru);
    
endfunction