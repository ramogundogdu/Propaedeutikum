function [nccVal] = NCC(vL, vR)


% calc average
%         vAvg = double(sum(v)) / double(vLength);
    [vrRows, vrCols] = size(vR);
    vrAvg = double(sum(vR)/vrCols);
    
    [vlRows, vlCols] = size(vL);
    vlAvg = double(sum(vL)/vlCols);

     
       
    vLDiff = vL - vlAvg;
    vRDiff = vR - vrAvg;
    
    upper = dot(vLDiff, vRDiff);
    lower = (norm(vLDiff) * norm(vRDiff));
    
    nccVal = ( upper / lower );
end

