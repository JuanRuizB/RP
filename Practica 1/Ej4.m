function Ej4
A = imread('spine.tif');
R = imnoise(A,'gaussian');
h1 = fspecial('gaussian');
h2 = fspecial('average');
G = imfilter(R,h1);
M = imfilter(R,h2);
mediana = medfilt2(R);

subplot(2,3,1),subimage(A),title('Imagen original')
subplot(2,3,2),subimage(R),title('Con ruido');
subplot(2,3,3),subimage(M),title('Filtro Media');
subplot(2,3,4),subimage(G),title('Filtro Gaussiano');
subplot(2,3,5),subimage(mediana),title('Filtro Mediana');
end