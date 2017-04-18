% Script written by Henry Cox 01/2017
% Script exports data from the FiberApp ImageData file structure which
% gets it ready for further post processing.

% remove old Images structure and initiate property variables
clear Images

% input pixel size in nm and number of images
pixelsize = 10;
numberofimages = 6;

% loop through all Images
for i = 1:numberofimages
    
    % export main properties from FiberApp
    Images(i).name = imageData(1,i).name;
    Images(i).sizeX = imageData(1,i).sizeX;
    Images(i).sizeY = imageData(1,i).sizeY;
    Images(i).sizeX_nm = imageData(1,i).sizeX_nm;
    Images(i).sizeY_nm = imageData(1,i).sizeY_nm;
    Images(i).xy = imageData(1,i).xy;
    Images(i).z = imageData(1,i).z;
    Images(i).xy_nm = imageData(1,i).xy_nm;
    Images(i).z_nm = imageData(1,i).z_nm;
    Images(i).length_nm = imageData(1,i).length_nm;
    Images(i).height_nm = imageData(1,i).height_nm;
        
    % loop through each fiber
    for j = 1:length(Images(i).xy)
        
        % apply correction for pixel size
        Images(i).xy_nm{j} = pixelsize.*Images(i).xy_nm{j};
        
    end
    
    % apply pixel size corrections to other factors in structure
    Images(i).sizeX_nm = pixelsize.*Images(i).sizeX;
    Images(i).sizeY_nm = pixelsize.*Images(i).sizeY;
    Images(i).length_nm = pixelsize.*Images(i).length_nm;
    
       
end

clear i j