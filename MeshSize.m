clear Px Py Ptot Pa Pb

% define pixel size (default 30)
pxl = 50;
Ptot = [];

for i = 1:length(Images)
    
    imagenumber = i;
    backbonebinner;
    i = imagenumber;
    Images(i).bbimage = pxy;
    maxx = length(pixel(:,1));
    maxy = length(pixel(1,:));
    
    for j = 1:max(size(pixel))
        
        if j <= maxy
            Pa = diff(find(pxy(:,j)==1));
            Py(1:length(Pa),j) = Pa;
        end
        if j <= maxx
            Pb = diff(find(pxy(j,:)==1))';
            Px(1:length(Pb),j) = Pb;
        end
        
    end
    
    P = [Px(:);Py(:)];
    P(P==0)=[];
    Images(i).P = P;
    Images(i).Py = Py;
    Images(i).Px = Px;
    
    Ptot = [Ptot; P];
end       

% aim for steps seperated by 500 nm
step = round(500/pxl);

% bin steps and set up X variable
Y = histcounts(Ptot,2:step:step*100);
X = 2:step:step*99;

% perform linear fit avoiding -Inf errors
fit = linearfit(X(Y>0),log(Y(Y>0)));

% calculate mesh size and error from linear fit
mesh = -pxl/fit(1,1);
mesh(2) = pxl*fit(2,1)/(fit(1,1).^2);

        