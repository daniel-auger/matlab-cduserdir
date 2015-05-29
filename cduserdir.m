function cduserdir()
%cduserdir Change directory to user's default.
%   cduserdir() changes the current directory to the default
%   MATLAB working directory indicated by the first entry of
%   the user specific portion of the path.
%
%   See also: userpath.

% Find the user path.
user_specific_path = userpath();
split_pattern = pathsep();
path_dirs = regexp(user_specific_path, split_pattern, 'split');
user_dir = path_dirs{1};

% Make sure the user directory actually exists.
user_dir_exists = exist(user_dir, 'dir') > 0;
if ~user_dir_exists
    id = 'cduserdir:dirNotFound';
    msg = 'Directory "%s" not found. Please see the help for USERPATH.';
    ME = MException(id, msg, user_dir);
    throwAsCaller(ME);
end

% Change to the directory.
cd(user_dir);
     
end
