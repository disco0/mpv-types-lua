--region utils : Declarations

---@alias MPV_FORMAT_STRING string
---@alias MPV_FORMAT_FLAG   boolean
---@alias MPV_FORMAT_INT64  number
---@alias MPV_FORMAT_DOUBLE number
---@alias MPV_FORMAT_NONE   nil

---@alias MPV_FORMAT_NODE_ARRAY table<number, any>
---@alias MPV_FORMAT_NODE_ARRAY_FMT_STR table<number, MPV_FORMAT_STRING>
---@alias MPV_FORMAT_NODE_MAP   table<any, any>
---@alias MPV_FORMAT_BYTE_ARRAY string

---@alias FileInfoFilter string | "'files'" | "'dirs'" | "'normal'" | "'all'"

---@class SubprocessParameters
---@field public args           MPV_FORMAT_NODE_ARRAY_FMT_STR
---@field public playback_only  MPV_FORMAT_FLAG
---@field public capture_size   MPV_FORMAT_INT64
---@field public capture_stdout MPV_FORMAT_FLAG
---@field public capture_stderr MPV_FORMAT_FLAG
local SubprocessParameters = {}

---@class Subprocess :  MPV_FORMAT_NODE_MAP
---@field status        MPV_FORMAT_INT64      @ The raw  exit status of the process. It will be negative on error. The meaning of negative  values  is  undefined, other than meaning error (and does not necessarily corre- spond to OS low level exit status values).  On Windows, it can happen that a negative return value is returned  even  if  the process exits gracefully, because the win32 UINT exit code is assigned to an  int  variable before being set as int64_t field in the result map. This might be fixed later.
---@field stdout        MPV_FORMAT_BYTE_ARRAY @ Captured stdout stream, limited to capture_size.
---@field stderr        MPV_FORMAT_BYTE_ARRAY @ Captured stderr stream, limited to capture_size.
---@field error_string  MPV_FORMAT_STRING     @ Empty string if the process exited gracefully. The string killed if the process was terminated in an unusual way.  The string init if the process could not be started. On Windows, killed is only returned when the process has been killed by mpv as a result of playback_only being set to yes.
---@field killed_by_us  MPV_FORMAT_FLAG       @ Set to yes if the process has been killed by mpv, for example as a result of playback_only being set to yes, aborting the command (e.g. by `mp.abort_async_command()`), or if the player is about to exit.

---@class FileInfo
---@field public mode string @ Protection bits (on Windows, always 755 (octal) for directories and 644 (octal) for files)
---@field public size number @ Size in bytes
---@field public atime number @ Time of last access
---@field public mtime number @ Time of last modification
---@field public ctime number @ Time of last metadata change (Linux) / time of creation (Windows)
---@field public is_file boolean @ Whether `path` is a regular file
---@field public is_dir boolean @ Whether `path` is a directory

--region utils : Declarations

--region utils

---
--- This built-in module provides generic helper functions for Lua, and have
--- strictly speaking nothing to do with mpv or video/audio playback. They are
--- provided for convenience. Most compensate for Lua's scarce standard library.
---
--- Be warned that any of these functions might disappear any time. They are not
--- strictly part of the guaranteed API.
---@class utils
local utils = { }

---
--- Returns the directory that mpv was launched from. On error, `nil, error`
--- is returned.
---
---@return string
function utils.getcwd() end

---
--- Enumerate all entries at the given path on the filesystem, and return them
--- as array. Each entry is a directory entry (without the path).
--- The list is unsorted (in whatever order the operating system returns it).
---
--- If the `filter` argument is given, it must be one of the following
--- strings:
---
---     `files`
---         List regular files only. This excludes directories, special files
---         (like UNIX device files or FIFOs), and dead symlinks. It includes
---         UNIX symlinks to regular files.
---
---     `dirs`
---         List directories only, or symlinks to directories. `.` and `..`
---         are not included.
---
---     `normal`
---         Include the results of both `files` and `dirs`. (This is the
---         default.)
---
---     `all`
---         List all entries, even device files, dead symlinks, FIFOs, and the
---         `.` and `..` entries.
---
--- On error, `nil, error` is returned.
---
---@overload fun(path: string): string[]
---@param path   string
---@param filter FileInfoFilter
---@return string[]
function utils.readdir(path, filter) end

---
--- Stats the given path for information and returns a table with the
--- following entries:
---
--- - `mode`
---         protection bits (on Windows, always 755 (octal) for directories
---         and 644 (octal) for files)
--- - `size`
---         size in bytes
--- - `atime`
---         time of last access
--- - `mtime`
---         time of last modification
--- - `ctime`
---         time of last metadata change (Linux) / time of creation (Windows)
--- - `is_file`
---         Whether `path` is a regular file (boolean)
--- - `is_dir`
---         Whether `path` is a directory (boolean)
---
--- `mode` and `size` are integers.
--- Timestamps (`atime`, `mtime` and `ctime`) are integer seconds since
--- the Unix epoch (Unix time).
--- The booleans `is_file` and `is_dir` are provided as a convenience;
--- they can be and are derived from `mode`.
---
--- On error (eg. path does not exist), `nil, error` is returned.
---
---@param path string
---@return FileInfo | nil, error
function utils.file_info(path) end

---
--- Split a path into directory component and filename component, and return
--- them. The first return value is always the directory. The second return
--- value is the trailing part of the path, the directory entry.
---
---@param path string
---@return     string, string
function utils.split_path(path) end

---
--- Return the concatenation of the 2 paths. Tries to be clever. For example,
--- if `p2` is an absolute path, `p2` is returned without change.
---
---@param  p1 string
---@param  p2 string
---@return    string
function utils.join_path(p1, p2)  end

---
--- Runs an external process and waits until it exits. Returns process status
--- and the captured output. This is a legacy wrapper around calling the
--- `subprocess` command with `mp.command_native`. It does the following
--- things:
---
--- - Copy the table `t`
--- - Rename `cancellable` field to `playback_only`
--- - Rename `max_size` to `capture_size`
--- - Set `capture_stdout` field to `true` if unset
--- - Set `name` field to `subprocess`
--- - Call `mp.command_native(copied_t)`
--- - If the command failed, create a dummy result table
--- - Copy `error_string` to `error` field if the string is non-empty
--- - Return the result table
---
--- It is recommended to use `mp.command_native` or `mp.command_native_async`
--- directly, instead of calling this legacy wrapper. It is for compatibility
--- only.
---
--- See the `subprocess` documentation for semantics and further parameters.
---
---@param  t SubprocessParameters
---@return   Subprocess
function utils.subprocess_detached(t) end

---
--- Runs an external process and detaches it from mpv's control.
---
--- The parameter `t` is a table. The `args` Array of strings of the same
--- semantics as the `args` used in the `subprocess` function.
---
--- The function returns `nil`.
---
--- This is a legacy wrapper around calling the `run` command with
--- `mp.commandv` and other functions.
---
---@param  t SubprocessParameters
---@return   Subprocess
function utils.subprocess(t) end

---
--- Turn the given value into a string. Formats tables and their contents. This
--- doesn't do anything special; it is only needed because Lua is terrible.
---
---@param  v table | any
---@return   string
function utils.to_string(v) end

---
--- Format the given Lua table (or value) as a JSON string and return it. On
--- error, returns `nil, error`. (Errors usually only happen on value types
--- incompatible with JSON.)
---
--- The argument value uses similar conventions as `mp.set_property_native()`
--- to distinguish empty objects and arrays.
---
---@param  v table
---@return   string | nil, error
function utils.format_json(v) end

---
--- Parses the given string argument as JSON, and returns it as a Lua table. On
--- error, returns `nil, error`. (Currently, `error` is just a string
--- reading `error`, because there is no fine-grained error reporting of any
--- kind.)
---
--- The returned value uses similar conventions as `mp.get_property_native()`
--- to distinguish empty objects and arrays.
---
--- If the `trail` parameter is `true` (or any value equal to `true`),
--- then trailing non-whitespace text is tolerated by the function, and the
--- trailing text is returned as 3rd return value. (The 3rd return value is
--- always there, but with `trail` set, no error is raised.)
---
---@overload  fun(str: string, trail: boolean): table
---@param  str string
---@return     table
function utils.parse_json(str) end

---
--- Returns the process ID of the running mpv process. This can be used to identify
--- the calling mpv when launching (detached) subprocesses.
---
---@return number
function utils.getpid() end

_G.mp.utils = utils

return utils

--endregion utils
