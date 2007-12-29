function varargout = subsref(h,s)
%SUBSREF subscripted indexing
%
%  val=SUBSREF(h, subs) allow subscripted indexing to retrieve subheaders
%  and parameters from a header. The following syntaxes are supported:
%   1. [v1,...,vn]=h.parameter - returns value of parameter in all subheaders
%   2. [v1,...,vn]=h.('parameter') - idem as 1
%   3. [v1,...,vi]=h(i).parameter - returns value of parameter from subset
%                                   of subheaders
%   4. [v1,...,vi]=h(i).('parameter') - idem as 3
%   5. h = h(i) - slicing, returns new header with subset of subheaders
%   6. h('parameter') - returns value of first subheader with parameter
%   
%  Example
%    hdr = header('parm1', 1, 'parameter two', 2);
%    hdr(1) %retrieves first subheader
%    p = hdr(1).parm1; %retrieves parameter from subheader 1
%    p = hdr(:).('parameter two'); %retrieves parameter from all subheaders
%

%  Copyright 2005-2008 Fabian Kloosterman

n = length(s);

switch s(1).type
 case '()'
  if ischar(s(1).subs{1}) && ~strcmp(s(1).subs{1},':')
    nh = length(h.subheaders);
    for k=1:nh
      varargout{1}=getParam( h.subheaders(k), s(1).subs{1});
      if ~isempty(varargout{1})
        break
      end
    end
  else
    varargout{1} = header( h.subheaders(s(1).subs{:} ) );
    if n>1
      varargout{1} = subsref( varargout{1}, s(2:end) );
    end
  end
 case '.'
  nh = length(h.subheaders);
  varargout = cell(nh,1);
  for k=1:nh
    varargout{k} = getParam( h.subheaders(k), s(1).subs );
  end
 otherwise
  error('header:subsref:invalidIndexing', 'Invalid indexing')
end

