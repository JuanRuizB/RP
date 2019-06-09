function dig = reconoce(file)
    cam = webcam();
    preview(cam);
    pause();
    closePreview(cam);
    A = snapshot(cam);
    clear('cam');
%     imshow(A);
%     A = imread('susio.jpg');
    gray = rgb2gray(A);
    
    figure,imshow(gray);
    bin = imbinarize(gray);
%     figure,imshow(bin);
    bin = quitarResto(bin);
    hola = quitarResto(bin);
    ele = strel('square',5);
% Dilatación
imagen_dilatada = imerode(bin,ele);
figure,imshow(imagen_dilatada);
    bin1 = quitarBordes(imagen_dilatada);
    figure,imshow(bin1);
    celdas_filas = dividirCeldas(bin1);
    
videoFrame=edge(rgb2gray(A), 'canny');
figure,imshow(videoFrame);
    
end