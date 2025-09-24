local M = {}
function M.sort_by_name(left, right)
    left = left.component.fs_t
    right = right.component.fs_t
    return left.filename:lower() < right.filename:lower()
end

function M.sort_by_date(left, right)
    left = left.component.fs_t
    right = right.component.fs_t
    return left.stat.mtime.sec < right.stat.mtime.sec
end

function M.sort_by_dirs(left, right)
    left = left.component.fs_t
    right = right.component.fs_t
    -- Ensure directories are always listed before non-directories
    local left_is_dir = left.filetype == "directory"
    local right_is_dir = right.filetype == "directory"

    if left_is_dir ~= right_is_dir then
        return left_is_dir and not right_is_dir
    end

    -- If both are directories or both are non-directories, sort by name
    return left.filename:lower() < right.filename:lower()
end

return M
