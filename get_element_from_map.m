function [element] = get_element_from_map(x,y,mMap)
    element =  x + (y-1) * size(mMap,1);
end