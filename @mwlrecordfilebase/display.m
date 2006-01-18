function display(fb, c)
%DISPLAY display object information
%
%  Syntax
%
%      display(h [,hidetitle])
%
%  Description
%
%    This method will display object information. An optional title will
%    be displayed if hidetitle = 0 (default)
%

%  Copyright 2005-2006 Fabian Kloosterman


if nargin<2 | ~isscalar(c)
    c = 0;
end

if ~(c)
    disp(['-- RECORD FILE OBJECT --'])
end

display(get(fb, 'mwlfilebase'), 1)

display(fb.fields)
