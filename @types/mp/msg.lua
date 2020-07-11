--region msg

---
--- This module allows outputting messages to the terminal, and can be loaded with:
--- ```lua
--- require 'mp.msg'
--- ```
---@class msg
local msg = { }

---
--- __`msg.log(level, ...)`__
---
--- The level parameter is the message priority. It's any of the following strings:
---
---     __`fatal`__, __`error`__, __`warn`__, __`info`__, __`v`__, __`debug`__, __`trace`__
---
--- The user's settings will determine which of these messages will be
--- visible. Normally, all messages are visible, except __`v`__, __`debug`__ and
--- __`trace`__.
---
--- The parameters after that are all converted to strings. Spaces are inserted
--- to separate multiple parameters.
---
--- You don't need to add newlines.
---
--- The functions
---
--- __`msg.fatal(...)`__, __`msg.error(...)`__, __`msg.warn(...)`__,
--- __`msg.info(...)`__, __`msg.verbose(...)`__, __`msg.debug(...)`__,
--- __`msg.trace(...)`__
---
--- are shortcuts, equivalent to their corresponding __`msg.log(level, ...)`__ calls.
---
---@overload fun(level: MessageLevel, ...: any)
---@param    level MessageLevel
---@vararg         string
function msg.log(level, ...) end

---
--- The parameters after that are all converted to strings. Spaces are inserted
--- to separate multiple parameters.
---
--- You don't need to add newlines.
---
--- The functions
--- __`msg.fatal(...)`__, __`msg.error(...)`__, __`msg.warn(...)`__,
--- __`msg.info(...)`__, __`msg.verbose(...)`__, __`msg.debug(...)`__,
--- __`msg.trace(...)`__
--- are shortcuts, equivalent to their corresponding __`msg.log(level, ...)`__ calls.
---
---@overload fun(...: any)
---@vararg   string
function msg.error(...) end

---
--- The parameters after that are all converted to strings. Spaces are inserted to separate multiple parameters.
---
--- You don't need to add newlines.
---
--- The functions
--- __`msg.fatal(...)`__, __`msg.error(...)`__, __`msg.warn(...)`__,
--- __`msg.info(...)`__, __`msg.verbose(...)`__, __`msg.debug(...)`__,
--- __`msg.trace(...)`__
--- are shortcuts, equivalent to their corresponding __`msg.log(level, ...)`__ calls.
---
---@overload fun(...: any)
---@vararg   string
function msg.fatal(...)   end

---
--- The parameters after that are all converted to strings. Spaces are inserted to separate multiple parameters.
---
--- You don't need to add newlines.
---
--- The functions
--- __`msg.fatal(...)`__, __`msg.error(...)`__, __`msg.warn(...)`__,
--- __`msg.info(...)`__, __`msg.verbose(...)`__, __`msg.debug(...)`__,
--- __`msg.trace(...)`__
--- are shortcuts, equivalent to their corresponding __`msg.log(level, ...)`__ calls.
---
---@overload fun(...: any)
---@vararg   string
function msg.warn(...) end

---
--- The parameters after that are all converted to strings. Spaces are inserted to separate multiple parameters.
---
--- You don't need to add newlines.
---
--- The functions
--- __`msg.fatal(...)`__, __`msg.error(...)`__, __`msg.warn(...)`__,
--- __`msg.info(...)`__, __`msg.verbose(...)`__, __`msg.debug(...)`__,
--- __`msg.trace(...)`__
--- are shortcuts, equivalent to their corresponding __`msg.log(level, ...)`__ calls.
---
---@overload fun(...: any)
---@vararg   string
function msg.info(...)    end

---
--- The parameters after that are all converted to strings. Spaces are inserted to separate multiple parameters.
---
--- You don't need to add newlines.
---
--- The functions
--- __`msg.fatal(...)`__, __`msg.error(...)`__, __`msg.warn(...)`__,
--- __`msg.info(...)`__, __`msg.verbose(...)`__, __`msg.debug(...)`__,
--- __`msg.trace(...)`__
--- are shortcuts, equivalent to their corresponding __`msg.log(level, ...)`__ calls.
---
---@overload fun(...: any)
---@vararg   string
function msg.verbose(...) end

---
--- The parameters after that are all converted to strings. Spaces are inserted to separate multiple parameters.
---
--- You don't need to add newlines.
---
--- The functions
--- __`msg.fatal(...)`__, __`msg.error(...)`__, __`msg.warn(...)`__,
--- __`msg.info(...)`__, __`msg.verbose(...)`__, __`msg.debug(...)`__,
--- __`msg.trace(...)`__
--- are shortcuts, equivalent to their corresponding __`msg.log(level, ...)`__ calls.
---
---@overload fun(...: any):void
---@vararg   string
function msg.debug(...)   end

---
--- The parameters after that are all converted to strings. Spaces are inserted to separate multiple parameters.
---
--- You don't need to add newlines.
---
--- The functions
--- __`msg.fatal(...)`__, __`msg.error(...)`__, __`msg.warn(...)`__,
--- __`msg.info(...)`__, __`msg.verbose(...)`__, __`msg.debug(...)`__,
--- __`msg.trace(...)`__
--- are shortcuts, equivalent to their corresponding __`msg.log(level, ...)`__ calls.
---
---@vararg string
function msg.trace(...)   end

_G.mp.msg = msg

return msg

--endregion msg
