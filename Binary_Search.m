function findD = Binary_Search(L,a,b,x)
%BINARY_SEARCH Summary of this function goes here
%   Detailed explanation goes here
if a>b
    if x > L(b) && x < L(a)
        findD = b;
    else
        findD = -1;
        return
    end
else
    mid = fix((a+b) * 0.5);
    if x == L(mid);
        findD = mid;
        return
    elseif x > L(mid);
        findD = Binary_Search(L,mid+1,b,x);
        return
    else
        findD = Binary_Search(L,a,mid-1,x);
        return
    end
end
