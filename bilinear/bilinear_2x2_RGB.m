function out = bilinear_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare biliniara pe imaginea 2x2 img cu puncte intermediare
    % echidistante, cu precizarea ca img este o imagine colorata RGB.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % Practic, apeleaza bilinear_2x2_interpolation pe fiecare canal al imaginii
    % img si reconstruieste imaginea colorata la final
    % Parametrii:
    % - img = imaginea 2x2 RGB care doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================
    
    
    
    
    % TODO: extrage canalul rosu al imaginii
    rosu = img(:,:,1);
    
    % TODO: extrage canalul verde al imaginii
    verde = img(:,:,2);
    
    % TODO: extrace canalul albastru al imaginii
    albastru = img(:,:,3);
    

    % TODO: aplica bilinear_2x2_interpolation pe fiecare dintre canale
    out_rosu = bilinear_2x2(rosu, STEP);
    out_verde = bilinear_2x2(verde, STEP);
    out_albastru = bilinear_2x2(albastru, STEP);
    
    % TODO: combina rezultatul in imaginea finala
    out = cat(3, out_rosu, out_verde, out_albastru);
    
endfunction
