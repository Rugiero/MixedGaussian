function AX = latex2axes(AX, myFontName, myFontSize, myFontWeight) % Adds LaTex support to selected Axes
%% latex2axes
%   This function changes the interpreter of various graphics objects in the selected axes to 'latex' and
%   obj.FontName, obj.FontSize and obj.FontWeight to a selected value.
%
%   Syntax:
%           latex2axes(AX, myFontName, myFontSize, myFontWeight)
%
%   Input arguments:
%       AX              -   handle to selected axes, (matlab.graphics.axis.Axes -object, optional, default = gca)
%       myFontName      -   Name of the font, default "Times New Roman" (use listfonts to see available fonts)
%       myFontSize      -   Size of the font, default = 18
%       myFontWeight    -   either "normal" or "bold" (default) 
%
%   Output arguments:
%       AX              -   handle to matlab.graphics.axis.Axes-object, which properties were changed
%
%   Copyright Peitsa Pesola, 3.4.2023
%   All Rights Reserved
%
%   See also LISTFONTS

if nargin < 4 || isempty(myFontWeight) || ~isstring(myFontWeight)
    myFontWeight = "bold";
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
    myFontName  = "Times New Roman";
end

% Check that AX is an Axes-object
if nargin < 1 || ~isa(AX, 'matlab.graphics.axis.Axes')
    AX          =       gca;
end

% Then set the interpreter, FontName, FontSize and FontWeight
AX.FontName                 =       myFontName;
AX.FontSize                 =       myFontSize;
AX.FontWeight               =       myFontWeight;
AX.TickLabelInterpreter     =       'latex';
AX.Title.Interpreter        =       'latex';
AX.Title.FontSize           =       myFontSize;
AX.Title.FontName           =       myFontName;
AX.Title.FontWeight         =       myFontWeight;
AX.Subtitle.Interpreter     =       'latex';
AX.Subtitle.FontSize        =       myFontSize;
AX.Subtitle.FontName        =       myFontName;
AX.Subtitle.FontWeight      =       myFontWeight;
AX.XAxis.TickLabelInterpreter =     'latex';
AX.XAxis.FontName           =       myFontName;
AX.XAxis.FontSize           =       myFontSize;
AX.XAxis.FontWeight         =       myFontWeight;
AX.XLabel.Interpreter       =       'latex';
AX.XLabel.FontSize          =       myFontSize;
AX.XLabel.FontName          =       myFontName;
AX.XLabel.FontWeight        =       myFontWeight;
AX.YAxis.TickLabelInterpreter =     'latex';
AX.YAxis.FontName           =       myFontName;
AX.YAxis.FontSize           =       myFontSize;
AX.YAxis.FontWeight         =       myFontWeight;
AX.YLabel.Interpreter       =       'latex';
AX.YLabel.FontSize          =       myFontSize;
AX.YLabel.FontName          =       myFontName;
AX.YLabel.FontWeight        =       myFontWeight;
