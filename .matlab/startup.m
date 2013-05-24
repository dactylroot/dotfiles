% Add personal bin folder for custom scripts
addpath('~/bin/','-begin')

% Remove the grey border from image previews
iptsetpref('ImshowBorder','tight');

%removes menu and toolbar from all new figures
set(0,'DefaultFigureMenu','none');

%makes disp() calls show things without empty lines
format compact;

