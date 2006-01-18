% @MWLPOSFILE
%
% Open / create
%   mwlposfile       - constructor
%
% Reading
%   getRecordOffsets - retrieve byte offsets for a range of position records
%   loadrange        - load data from mwl pos file
%   setCurrentRecord - move file pointer to record
%
% Writing
%   closeHeader      - write header to disk and reopen file in append mode
%   setFields        - create fields for new pos file
%
% Misc
%   display          - display object information
%   get              - get oject properties