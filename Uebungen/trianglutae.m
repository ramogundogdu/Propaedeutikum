
% Raumkoordinaten der Punkte in Cl;
PointsCl = [   -1, 1, 1, -1, -1, 1, 1, -1; 
            -1, -1, 1, 1, -1, -1, 1, 1;
            -4, -4, -4, -4, -6, -6, -6, -6];

% Drehmatrix für Koordinatensystem 
CrDrehmatrix = [1/sqrt(2), 0, -1/sqrt(2); 0,1,0; 1/sqrt(2), 0, 1/sqrt(2)];
CrTranslation = [3; 0; 0];

% Berechnung der Raumkoordinaten im gedrehten Koordinatensystem Cr;
PointsCr =  zeros(3,8);

for i=1:length(PointsCl(end,:))
    CurrentPoint = PointsCl(:,i);
    NewPoint = CrDrehmatrix * (CurrentPoint-CrTranslation);
    
    PointsCr(:,i) = NewPoint;
end


% ============ Projektionen erstellen ==========

% Projektionsmatrix
K = [-2,0,0,0; 0,-2,0,0; 0,0,1,0];

ProjectionPointsCl = zeros(2,8);
ProjectionPointsCr = zeros(2,8);

% Berechnung Projektionspunkte für Cl
for j=1:length(PointsCl(end,:))
  CurrentPoint = PointsCl(:,j);
  CurrentPoint = [CurrentPoint; 1];
  homogenousTransPoint = K * CurrentPoint;  
  ProjectionPointsCl(:,j) = [homogenousTransPoint(1,1)/homogenousTransPoint(3,1) ; homogenousTransPoint(2,1)/homogenousTransPoint(3,1)];
end

% Berechnung Projektionspunkte für Cr
for j=1:length(PointsCr(end,:))
  CurrentPoint = PointsCr(:,j);
  CurrentPoint = [CurrentPoint; 1];
  homogenousTransPoint = K * CurrentPoint;  
  ProjectionPointsCr(:,j) = [homogenousTransPoint(1,1)/homogenousTransPoint(3,1) ; homogenousTransPoint(2,1)/homogenousTransPoint(3,1)];
end

 %disp(ProjectionPointsCl);
 %disp(ProjectionPointsCr);
 
 % ============ Triangulierung ==========
 
 Kintr = [-2,0,0; 0,-2,0; 0,0,1];
 RCl = [1,0,0,0; 0,1,0,0; 0,0,1,0];
 RCr = [1/sqrt(2), 0, -1/sqrt(2); 
        0,1,0; 
        1/sqrt(2), 0, 1/sqrt(2)];
 
 PL = Kintr * RCl;
 PR = Kintr *[ RCr -RCr * [3; 0; 0]];

 for k=1:length(ProjectionPointsCl(end,:))
     
     currPointL = ProjectionPointsCl(:,k);
     currPointR = ProjectionPointsCr(:,k);   
     
     HomLGS =   [
        PL(1,:) - PL(3,:)*currPointL(1,1) ;
        PL(2,:) - PL(3,:)*currPointL(2,1) ;
        PR(1,:) - PR(3,:)*currPointR(1,1) ;
        PR(2,:) - PR(3,:)*currPointR(2,1)        
     ];
    
    % singular value decomposition
    [U,S,V] = svd(HomLGS);
    X = V(:,end);
    X = X/X(end)
    
 end; 