function out = bicubic_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img a.i. aceasta sa fie de dimensiune p x q.
    % Imaginea img este colorata.
    % Practic, apeleaza de 3 ori functia nn pe fiecare canal al imaginii.
    % =========================================================================
    rosu = img(:,:,1);
    verde = img(:,:,2);
    albastru = img(:,:,3);
    % TODO: extrage canalul rosu al imaginii
    out_rosu = bicubic_resize(rosu, p, q);
    % TODO: extrage canalul verde al imaginii
    out_verde = bicubic_resize(verde, p, q);
    % TODO: extrace canalul albastru al imaginii
    out_albastru = bicubic_resize(albastru, p, q);

    % TODO: aplica functia nn pe cele 3 canale ale imaginii

    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    % Hint: functia cat
    out = cat(3, out_rosu, out_verde, out_albastru);
    
endfunction