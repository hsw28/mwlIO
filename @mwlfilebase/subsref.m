function b = subsref(fb,s)
%SUBSREF subscripted indexing
%
%  Syntax
%
%      f.property
%

%  Copyright 2005-2006 Fabian Kloosterman

switch s.type
case '.'
    b = get(fb, s.subs);
end

