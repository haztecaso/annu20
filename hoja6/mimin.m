function x = mimin(a,b,astr,bstr)
    if a == b
        disp("=")
        x = a;
    else if a < b
        disp(astr);
        x = a;
    else
        disp(bstr);
        x = b;
    end
end
