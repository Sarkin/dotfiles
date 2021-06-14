--[[

     Licensed under GNU General Public License v2
      * (c) 2013, Luca CPZ

--]]

local helpers  = require("lain.helpers")
local wibox    = require("wibox")
local tonumber = tonumber

-- {thermal,core} temperature info
-- lain.widget.temp

local function factory(args)
    local temp     = { widget = wibox.widget.textbox() }
    local args     = args or {}
    local timeout  = args.timeout or 10
    local settings = args.settings or function() end

    function temp.update()
        helpers.async({"sensors"}, function(f)
            local temp_fl, temp_value
            local count = 0
            local sum_temp = 0.0
            for line in f:gmatch("[^\n]+") do
                if string.find(line, "Core") then
                    sum_temp = sum_temp + tonumber(line:match("[+][.0-9]+"))
                    count = count + 1
                end
            end
            if count then
                coretemp_now = string.format("%0.1f", sum_temp / count)
            else
                coretemp = "N/A"
            end 
            widget = temp.widget
            settings()
        end)
    end

    helpers.newtimer("thermal", timeout, temp.update)

    return temp
end

return factory
