function Points3D = triangulateMatches(Dispmap, KLeft, KRight, R, T)



     PL = KLeft * [1 0 0 0; 0 1 0 0; 0 0 1 0;];
     PR = KRight * [R -R*T];

     [rows, columns] = size(Dispmap);

     Points3D = zeros(rows, columns, 3);

     for i=1:rows
            for j=1:columns

                currPointL = [i; j];
                currPointR = [i; j+Dispmap(i,j)]; 

                HomLGS =   [
                    PL(1,:) - PL(3,:)*currPointL(1,1) ;
                    PL(2,:) - PL(3,:)*currPointL(2,1) ;
                    PR(1,:) - PR(3,:)*currPointR(1,1) ;
                    PR(2,:) - PR(3,:)*currPointR(2,1)        
                 ];

                [U,S,V] = svd(HomLGS);
                Point3D = V(:,end);
                Point3D = Point3D/Point3D(end);
                
                % save point in map. drop 4th value of homogenous vector
                Points3D(i,j,:) = Point3D([1:3]);

            end;
     end;

    %  for k=1:length(ProjectionPointsCl(end,:))
    %      
    %      currPointL = ProjectionPointsCl(:,k);
    %      currPointR = ProjectionPointsCr(:,k);   
    %      
    %      HomLGS =   [
    %         PL(1,:) - PL(3,:)*currPointL(1,1) ;
    %         PL(2,:) - PL(3,:)*currPointL(2,1) ;
    %         PR(1,:) - PR(3,:)*currPointR(1,1) ;
    %         PR(2,:) - PR(3,:)*currPointR(2,1)        
    %      ];
    %     
    %     % singular value decomposition
    %     [U,S,V] = svd(HomLGS);
    %     X = V(:,end);
    %     X = X/X(end)
    %     
    %  end; 

end
