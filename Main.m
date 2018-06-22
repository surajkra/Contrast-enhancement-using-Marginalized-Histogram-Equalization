clear all
close all
clc

 Img=(imread('Kolu1.jpg'));

%% TGC

Gamma=0.5;
T_Img(:,:,1)=tgc(Img(:,:,1),Gamma);
T_Img(:,:,2)=tgc(Img(:,:,2),Gamma);
T_Img(:,:,3)=tgc(Img(:,:,3),Gamma);

figure();
subplot(4,2,1);imshow(Img);title('Input Img');
subplot(4,2,2);imshow(uint8(T_Img));title('TGC method');
subplot(4,2,3);imhist(Img(:,:,1));title('Input Histogram');
subplot(4,2,4);imhist(uint8(T_Img(:,:,1)));title('TGC Eq. Histogram');
subplot(4,2,5);imhist(Img(:,:,2));title('Input Histogram');
subplot(4,2,6);imhist(uint8(T_Img(:,:,2)));title('TGC Eq. Histogram');
subplot(4,2,7);imhist(Img(:,:,3));title('Input Histogram');
subplot(4,2,8);imhist(uint8(T_Img(:,:,3)));title('TGC Eq. Histogram');
%% THE

T_Img_the(:,:,1)=the(Img(:,:,1));
T_Img_the(:,:,2)=the(Img(:,:,2));
T_Img_the(:,:,3)=the(Img(:,:,3));
figure();
subplot(4,2,1);imshow(Img);title('Input Img');
subplot(4,2,2);imshow(uint8(T_Img_the));title('THE method');
subplot(4,2,3);imhist(Img(:,:,1));title('Input Histogram');
subplot(4,2,4);imhist(uint8(T_Img_the(:,:,1)));title('THE Histogram');
subplot(4,2,5);imhist(Img(:,:,2));title('Input Histogram');
subplot(4,2,6);imhist(uint8(T_Img_the(:,:,2)));title('THE Histogram');
subplot(4,2,7);imhist(Img(:,:,3));title('Input Histogram');
subplot(4,2,8);imhist(uint8(T_Img_the(:,:,3)));title('THE Histogram');

%% Paper Method

alpha=0.5;
T_Img_agcwd(:,:,1)=AGCWD(Img(:,:,1),alpha);
T_Img_agcwd(:,:,2)=AGCWD(Img(:,:,2),alpha);
T_Img_agcwd(:,:,3)=AGCWD(Img(:,:,3),alpha);

figure();
subplot(4,2,1);imshow(Img);title('Input Img');
subplot(4,2,2);imshow(uint8(T_Img_agcwd));title('AGCWD method');
subplot(4,2,3);imhist(Img(:,:,1));title('Input Histogram');
subplot(4,2,4);imhist(uint8(T_Img_agcwd(:,:,1)));title('AGCWD Eq Histogram');
subplot(4,2,5);imhist(Img(:,:,2));title('Input Histogram');
subplot(4,2,6);imhist(uint8(T_Img_agcwd(:,:,2)));title('AGCWD Eq Histogram');
subplot(4,2,7);imhist(Img(:,:,3));title('Input Histogram');
subplot(4,2,8);imhist(uint8(T_Img_agcwd(:,:,3)));title('AGCWD Eq Histogram');


%% Method 1

New_Img(:,:,1) = Suraj_Method1(Img(:,:,1),2);
New_Img(:,:,2) = Suraj_Method1(Img(:,:,2),2);
New_Img(:,:,3) = Suraj_Method1(Img(:,:,3),2);

New_Img=uint8(New_Img);
figure();
subplot(4,2,1);imshow(Img);title('Input Img');
subplot(4,2,2);imshow(New_Img);title('Proposed method-W/O LPF');
subplot(4,2,3);imhist(Img(:,:,1));title('Input Histogram');
subplot(4,2,4);imhist(New_Img(:,:,1));title('Equalized Histogram-W/O LPF');
subplot(4,2,5);imhist(Img(:,:,2));title('Input Histogram');
subplot(4,2,6);imhist(New_Img(:,:,2));title('Equalized Histogram-W/O LPF');
subplot(4,2,7);imhist(Img(:,:,3));title('Input Histogram');
subplot(4,2,8);imhist(New_Img(:,:,3));title('Equalized Histogram-W/O LPF');

New_Img = imboxfilt(New_Img);
figure();
subplot(4,2,1);imshow(Img);title('Input Img');
subplot(4,2,2);imshow(New_Img);title('Proposed method-W/O LPF');
subplot(4,2,3);imhist(Img(:,:,1));title('Input Histogram');
subplot(4,2,4);imhist(New_Img(:,:,1));title('Equalized Histogram-W/O LPF');
subplot(4,2,5);imhist(Img(:,:,2));title('Input Histogram');
subplot(4,2,6);imhist(New_Img(:,:,2));title('Equalized Histogram-W/O LPF');
subplot(4,2,7);imhist(Img(:,:,3));title('Input Histogram');
subplot(4,2,8);imhist(New_Img(:,:,3));title('Equalized Histogram-W/O LPF');

figure();
subplot(2,2,1);imshow(Img);title('Input Img');
subplot(2,2,2);imshow(uint8(T_Img_the));title('THE');
subplot(2,2,3);imshow(uint8(T_Img_agcwd));title('AGCWD');
subplot(2,2,4);imshow(New_Img);title('Proposed');

Input=colourfulness_metric(Img);
disp(sprintf('Proposed=%f',colourfulness_metric(New_Img)/Input));
disp(sprintf('THE=%f',colourfulness_metric(T_Img_the)/Input));
disp(sprintf('AGCWD=%f',colourfulness_metric(T_Img_agcwd)/Input));
disp(sprintf('Gamma=%f',colourfulness_metric(T_Img)/Input));

disp('\nJPQM');

disp(sprintf('Input Img=%d',jpeg_quality_score(Img)));
disp(sprintf('Proposed=%d',jpeg_quality_score(New_Img)));
disp(sprintf('THE=%d',jpeg_quality_score(T_Img_the)));
disp(sprintf('AGCWD=%d',jpeg_quality_score(T_Img_agcwd)));
disp(sprintf('Gamma=%d', jpeg_quality_score(T_Img)));

disp('\nCEF');

disp(sprintf('Proposed=%d',CEF(Img, New_Img)));
disp(sprintf('THE=%d',CEF(Img, T_Img_the)));
disp(sprintf('AGCWD=%d',CEF(Img, T_Img_agcwd)));
disp(sprintf('Gamma=%d',CEF(Img, T_Img)));


%% Grayscale

% 
% 
% Gamma=2;
% T_Img=tgc(Img,Gamma);
% figure();
% subplot(2,2,1);imshow(Img);title('Input Img');
% subplot(2,2,2);imshow(uint8(T_Img));title('TGC method');
% subplot(2,2,3);imhist(Img);title('Input Histogram');
% subplot(2,2,4);imhist(uint8(T_Img));title('TGC Eq. Histogram');
% %% THE
% 
% T_Img_the=the(Img);
% T_Img_the=the(Img);
% T_Img_the=the(Img);
% figure();
% subplot(2,2,1);imshow(Img);title('Input Img');
% subplot(2,2,2);imshow(uint8(T_Img_the));title('THE method');
% subplot(2,2,3);imhist(Img);title('Input Histogram');
% subplot(2,2,4);imhist(uint8(T_Img_the));title('THE Histogram');
% %% Paper Method
% 
% alpha=0.5;
% T_Img_agcwd=AGCWD(Img,alpha);
% 
% figure();
% subplot(2,2,1);imshow(Img);title('Input Img');
% subplot(2,2,2);imshow(uint8(T_Img_agcwd));title('AGCWD method');
% subplot(2,2,3);imhist(Img(:,:,1));title('Input Histogram');
% subplot(2,2,4);imhist(uint8(T_Img_agcwd));title('AGCWD Eq Histogram');
% 
% 
% 
% %% Method 1
% 
% New_Img = Suraj_Method1(Img,2);
% 
% New_Img=uint8(New_Img);
% figure();
% subplot(2,2,1);imshow(Img);title('Input Img');
% subplot(2,2,2);imshow(New_Img);title('Proposed method-W/O LPF');
% subplot(2,2,3);imhist(Img);title('Input Histogram');
% subplot(2,2,4);imhist(New_Img);title('Equalized Histogram-W/O LPF');
% 
% 
% New_Img = imboxfilt(New_Img);
% figure();
% subplot(2,2,1);imshow(Img);title('Input Img');
% subplot(2,2,2);imshow(New_Img);title('Proposed method-W/O LPF');
% subplot(2,2,3);imhist(Img);title('Input Histogram');
% subplot(2,2,4);imhist(New_Img);title('Equalized Histogram-W/O LPF');
% 
% 
% figure();
% subplot(2,2,1);imshow(Img);title('Input Img');
% subplot(2,2,2);imshow(uint8(T_Img_the));title('THE');
% subplot(2,2,3);imshow(uint8(T_Img_agcwd));title('AGCWD');
% subplot(2,2,4);imshow(New_Img);title('Proposed');
% % 
% disp('\nJPQM');
% 
% disp(sprintf('Input Img=%d',jpeg_quality_score(Img)));
% disp(sprintf('Proposed=%d',jpeg_quality_score(New_Img)));
% disp(sprintf('THE=%d',jpeg_quality_score(T_Img_the)));
% disp(sprintf('AGCWD=%d',jpeg_quality_score(T_Img_agcwd)));
% disp(sprintf('Gamma=%d', jpeg_quality_score(T_Img)));
% 
% disp('\nCEF');
% 
% disp(sprintf('Proposed=%d',CEF(Img, New_Img)));
% disp(sprintf('THE=%d',CEF(Img, T_Img_the)));
% disp(sprintf('AGCWD=%d',CEF(Img, T_Img_agcwd)));
% disp(sprintf('Gamma=%d',CEF(Img, T_Img)));
% 
 