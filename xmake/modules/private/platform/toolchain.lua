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
-- @file        toolchain.lua
--

-- imports
import("core.base.object")

-- init toolchain
local toolchain = toolchain or object {_init = {"description", "list"}}

-- add tool to toolchain list
function toolchain:add(...)
    for _, item in ipairs({...}) do
        table.insert(self.list, item)
    end
end

-- create a toolchain object
function main(description)
    return toolchain {description, {}}
end

