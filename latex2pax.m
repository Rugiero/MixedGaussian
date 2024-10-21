function pAX = latex2pax(pAX, myFontName, myFontSize, myFontWeight) % Adds LaTex support to selected PolarAxes
%% latex2pax
%   This function changes the interpreter of various graphics objects in the selected polaraxes to 'latex' and
%   obj.FontName, obj.FontSize and obj.FontWeight to a selected value.
%
%   Syntax:
%           pAX = latex2pax(pAX, myFontName, myFontSize, myFontWeight)
%
%   Input arguments:
%       pAX             -   handle to selected polaraxes, (matlab.graphics.axis.PolarAxes-object -object)
%       myFontName      -   Name of the font, default "Times New Roman" (use listfonts to see available fonts)
%       myFontSize      -   Size of the font, default = 18
%       myFontWeight    -   either "normal" or "bold" (default) 
% 
%   Output arguments:
%       pAX             -   handle to matlab.graphics.axis.PolarAxes-object, which properties were changed
%
%   Note, if pAX is not a matlab.graphics.axis.PolarAxes-object, new polaraxes is created.
%   
%   Copyright Peitsa Pesola, 3.4.2023
%   All Rights Reserved
%
%   See also LISTFONTS

%
% Note! PolarAxes differs slightly from Axes, for example, Xlabel and Ylabel are missing and
% XAxis and YAxis are replaced with RAxis and ThetaAxis

if nargin < 4 || isempty(myFontWeight)
    myFontWeight = 'bold';
end

% Ensure that FontWeight is either "normal" or bold
if ~strcmp(myFontWeight,"normal")
    myFontWeight = "bold";
end

% Check that myFontSize is a scalar integer
if nargin < 3 || isempty(myFontSize) || ~isscalar(myFontSize) || ceil(myFontSize) ~= floor(myFontSize)
    myFontSize = 18;
end

% Check that myFontName is a string
if nargin < 2 || isempty(myFontName) || ~isstring(myFontName)
    myFontName = "Times New Roman";
end

% Check that pAX is a polaraxes-object
if nargin < 1 || ~isa(pAX, 'matlab.graphics.axis.PolarAxes')
    pAX          =       polaraxes;
end

% Then set the interpreter, FontName, FontSize and FontWeight
pAX.FontName                 =       myFontName;
pAX.FontSize                 =       myFontSize;
pAX.FontWeight               =       myFontWeight;
pAX.TickLabelInterpreter     =       'latex';
pAX.Title.Interpreter        =       'latex';
pAX.Title.FontSize           =       myFontSize;
pAX.Title.FontName           =       myFontName;
pAX.Title.FontWeight         =       myFontWeight;
pAX.Subtitle.Interpreter     =       'latex';
pAX.Subtitle.FontSize        =       myFontSize;
pAX.Subtitle.FontName        =       myFontName;
pAX.Subtitle.FontWeight      =       myFontWeight;
pAX.ThetaAxis.TickLabelInterpreter =     'latex';
pAX.ThetaAxis.FontName       =       myFontName;
pAX.ThetaAxis.FontSize       =       myFontSize;
pAX.ThetaAxis.FontWeight     =       myFontWeight;
pAX.RAxis.TickLabelInterpreter =     'latex';
pAX.RAxis.FontName           =       myFontName;
pAX.RAxis.FontSize           =       myFontSize;
pAX.RAxis.FontWeight         =       myFontWeight;


