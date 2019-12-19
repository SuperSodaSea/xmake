--!A cross-platform build utility based on Lua
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- 
-- Copyright (C) 2015-2020, TBOOX Open Source Group.
--
-- @author      ruki
-- @file        find_ollydbg.lua
--

-- imports
import("lib.detect.find_program")
import("lib.detect.find_programver")

-- find ollydbg 
--
-- @param opt   the argument options, e.g. {version = true, program = "c:\xxx\ollydbg.exe"}
--
-- @return      program, version
--
-- @code 
--
-- local ollydbg = find_ollydbg()
-- local ollydbg, version = find_ollydbg({version = true})
-- local ollydbg, version = find_ollydbg({version = true, program = "c:\xxx\ollydbg.exe"})
-- 
-- @endcode
--
function main(opt)

    -- not on windows?
    if os.host() ~= "windows" then
        return 
    end

    -- init options
    opt        = opt or {}
    opt.pathes = opt.pathes or function ()
        for _, reg in ipairs({"HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\AeDebug;Debugger", "HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows NT\\CurrentVersion\\AeDebug;Debugger"}) do
            return (val("reg " .. reg) or ""):match("\"(.-)\"")
        end
    end
    opt.check  = opt.check or function (program) if not os.isfile(program) then raise() end end

    -- find program
    return find_program(opt.program or "ollydbg", opt)
end
