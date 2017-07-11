function mesh = mshClean(mesh)
%+========================================================================+
%|                                                                        |
%|           OPENMSH, MESH MANAGEMENT AND NUMERICAL QUADRATURE            |
%|              openMsh is part of GYPSYLAB toolbox - v0.20               |
%|                                                                        |
%| Copyright (c) 20015-2017, Ecole polytechnique, all rights reserved.    |
%| Licence Creative Commons BY-NC-SA 4.0, Attribution, NonCommercial and  |
%| ShareAlike (see http://creativecommons.org/licenses/by-nc-sa/4.0/).    |
%| This software is the property from Centre de Mathematiques Appliquees  |
%| de l'Ecole polytechnique, route de Saclay, 91128 Palaiseau, France.    |
%|                                                            _   _   _   |
%| Please acknowledge the GYPSILAB toolbox in programs       | | | | | |  |
%| or publications in which you use the code. For openMsh,    \ \| |/ /   |
%| we suggest as reference :                                   \ | | /    |
%| [1] : www.cmap.polytechnique.fr/~aussal/gypsilab             \   /     |
%|                                                               | |      |
%|_______________________________________________________________|_|______|
%| Author(s)  : Matthieu Aussal - CMAP, Ecole polytechnique               |
%| Creation   : 14.03.17                                                  |
%| Last modif : 21.06.17                                                  |
%| Synopsis   : Clean vertex and renumber element from initial mesh       |
%+========================================================================+

% Get vertex from initial numerotation
Ivtx              = zeros(size(mesh.vtx,1),1);
Ivtx(mesh.elt(:)) = 1;
mesh.vtx          = mesh.vtx(logical(Ivtx),:);

% Reorder elements
Ivtx(Ivtx==1) = 1:sum(Ivtx,1);
if size(mesh.elt,1) == 1
    mesh.elt = Ivtx(mesh.elt)';
else
    mesh.elt = Ivtx(mesh.elt);
end
end
