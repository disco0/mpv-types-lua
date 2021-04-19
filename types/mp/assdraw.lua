--TODO: Add documentation comments

---@class assdraw
---@field text string
local ass_mt = {}
ass_mt.__index = ass_mt

---@return assdraw
local function ass_new()
    return setmetatable({ scale = 4, text = "" }, ass_mt)
end

function ass_mt:new_event() end

function ass_mt:draw_start() end

function ass_mt:draw_stop() end

---@param x number
---@param y number
function ass_mt:coord(x, y) end

---@param s string
function ass_mt:append(s) end

---@param ass2 assdraw
function ass_mt:merge(ass2) end

---@param x number
---@param y number
function ass_mt:pos(x, y) end

function ass_mt:an(an)
    ass:append(string.format("{\\an%d}", an))
end

---@param x number
---@param y number
function ass_mt:move_to(x, y)
    ass:append(" m")
    ass:coord(x, y)
end

---@param x number
---@param y number
function ass_mt:line_to(x, y)
    ass:append(" l")
    ass:coord(x, y)
end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param x3 number
---@param y3 number
function ass_mt:bezier_curve(x1, y1, x2, y2, x3, y3)
    ass:append(" b")
    ass:coord(x1, y1)
    ass:coord(x2, y2)
    ass:coord(x3, y3)
end


---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
function ass_mt:rect_ccw(x0, y0, x1, y1)
    ass:move_to(x0, y0)
    ass:line_to(x0, y1)
    ass:line_to(x1, y1)
    ass:line_to(x1, y0)
end

---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
function ass_mt:rect_cw(x0, y0, x1, y1)
    ass:move_to(x0, y0)
    ass:line_to(x1, y0)
    ass:line_to(x1, y1)
    ass:line_to(x0, y1)
end

---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param r1 number
---@param r2 number
function ass_mt:hexagon_cw(x0, y0, x1, y1, r1, r2) end

---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param r1 number
---@param r2 number
function ass_mt:hexagon_ccw(x0, y0, x1, y1, r1, r2) end

---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param r1 number
---@param r2 number
function ass_mt:round_rect_cw(x0, y0, x1, y1, r1, r2) end

---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param r1 number
---@param r2 number
function ass_mt:round_rect_ccw(x0, y0, x1, y1, r1, r2) end

_G.mp.assdraw = ass_new

return {ass_new = ass_new}
