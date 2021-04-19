--region options

---
--- mpv comes with a built-in module to manage options from config-files and the
--- command-line. All you have to do is to supply a table with default options to
--- the read_options function. The function will overwrite the default values
--- with values found in the config-file and the command-line (in that order).
---
--- __`options.read_options(table [, identifier])`__
--- A __`table`__ with key-value pairs. The type of the default values is
--- important for converting the values read from the config file or
--- command-line back. Do not use __`nil`__ as a default value!
---
--- The __`identifier`__ is used to identify the config-file and the command-line
--- options. These needs to unique to avoid collisions with other scripts.
--- Defaults to __`mp.get_script_name()`__.
---
--- Example implementation:
--- ```lua
--- require('mp.options')
--- local options = {
---     optionA = "defaultvalueA",
---     optionB = -0.5,
---     optionC = true,
--- }
--- read_options(options, "myscript")
--- print(options.optionA)
--- ```
---
--- The config file will be stored in __`script-opts/identifier.conf`__ in mpv's user
--- folder. Comment lines can be started with # and stray spaces are not removed.
--- Boolean values will be represented with yes/no.
---
--- Example config:
--- ```ini
--- # comment
--- optionA=Hello World
--- optionB=9999
--- optionC=no
--- ```
---
---  Command-line options are read from the __`--script-opts`__ parameter. To avoid
--- collisions, all keys have to be prefixed with __`identifier-`__.
--- Example command-line:
---
--- ``` shellscript
--- mpv --script-opts=myscript-optionA=TEST,myscript-optionB=0,myscript-optionC=yes
--- ```
---@class options
local options = { }

---
--- The __`read_options`__ function will overwrite the default values in
--- table __`options`__ with values found in the config-file and the
--- command-line (in that order).
---
--- __`options.read_options(table [, identifier])`__
--- The type of the default values is important for converting the values read from the config file or
--- command-line back. Do not use __`nil`__ as a default value!
---
--- The __`identifier`__ is used to identify the config-file and the command-line
--- options. These needs to unique to avoid collisions with other scripts.
--- Defaults to __`mp.get_script_name()`__.
---
--- Example implementation:
--- ```lua
--- require('mp.options')
--- local options = {
---     optionA = "defaultvalueA",
---     optionB = -0.5,
---     optionC = true,
--- }
--- read_options(options, "myscript")
--- print(options.optionA)
--- ```
---
--- The config file will be stored in __`script-opts/identifier.conf`__ in mpv's user
--- folder. Comment lines can be started with # and stray spaces are not removed.
--- Boolean values will be represented with yes/no.
---
---@overload fun(options: table<string, string | number | boolean>)
---@param options    table<string, string | number | boolean> @ A __`table`__ with key-value pairs.
---@param identifier string
function options.read_options(options, identifier) end

_G.mp.options = options

return options

--endregion options
