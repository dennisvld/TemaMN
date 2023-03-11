function R = bicubic_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare bicubica
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q
    % =========================================================================

    [m n nr_colors] = size(I);

    % initializeaza matricea finala
    R = zeros(p, q);
    
    % TODO: cast I la double
    I = double(I);
    
    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va
    % deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % si s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul de la 0 la n - 1!
    s_x = (q-1)/(n-1);
    s_y = (p-1)/(m-1);
    
     % TODO: defineste matricea de transformare pentru redimensionare
    T = [s_x 0; 0 s_y];
    
    % TODO: calculeaza inversa transformarii
    U = [1/s_x 0; 0 1/s_y];
    
    
    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    % TODO: precalculeaza derivatele
    [Ix, Iy, Ixy] = precalc_d(I);
    
    for y = 0 : p - 1
        for x = 0 : q - 1
            % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
            x_p = x / s_x;
            y_p = y / s_y;
            
            % TODO: trece (x_p, y_p) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            x_p = x_p + 1;
            y_p = y_p + 1;
            
            % TODO: gaseste cele 4 puncte ce inconjoara punctul x, y
            [x1 y1 x2 y2] = surrounding_points(n, m, x_p, y_p);
            
            % TODO: calculeaza coeficientii de interpolare A
            A = bicubic_coef(I, Ix, Iy, Ixy, x1, y1, x2, y2);
            
            % TODO: trece coordonatele (x_p, y_p) in patratul unitate, scazand (x1, y1)
            x_p = x_p - x1;
            y_p = y_p - y1;
            
            % TODO: calculeaza valoarea interpolata a pixelului (x, y)
            % Obs: pentru scrierea in imagine, x si y sunt in coordonate de
            % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n
            R(y + 1, x + 1) = [1 x_p x_p^2 x_p^3] * A * [1 y_p y_p^2 y_p^3]';
            
        endfor
    endfor

    % TODO: transforma matricea rezultat in uint8 pentru a fi o imagine valida
    R = uint8(R);
    
endfunction





