---
-- Copyright (c) 2013, Zhiqiang Lan (Lindowx). All rights reserved.
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License. You should have
-- received a copy of the GPL license along with this program; if you
-- did not, you can find it at http:--www.gnu.org/
--
-- Sphinx Lua client
-- @module resty.sphinx

local print = ngx.print
local md5 = ngx.md5
local params = ngx.req.get_uri_args()
local sub = string.sub
local tcp = ngx.socket.tcp
local insert = table.insert
local concat = table.concat
local strlen = string.len
local null = ngx.null
local pairs = pairs
local unpack = unpack
local setmetatable = setmetatable
local tonumber = tonumber
local error = error

module(...)

_VERSION = '0.1.0'

local commands = {
	
}

--[[
	known searchd commands
]]
local SEARCHD_COMMAND_SEARCH = 0
local SEARCHD_COMMAND_EXCERPT = 1
local SEARCHD_COMMAND_UPDATE = 2
local SEARCHD_COMMAND_KEYWORDS = 3
local SEARCHD_COMMAND_PERSIST = 4
local SEARCHD_COMMAND_STATUS = 5
local SEARCHD_COMMAND_QUERY = 6

--[[
	current client-side command implementation versions
]]
local VER_COMMAND_SEARCH = 0x116
local VER_COMMAND_EXCERPT = 0x100
local VER_COMMAND_UPDATE = 0x102
local VER_COMMAND_KEYWORDS = 0x100
local VER_COMMAND_STATUS = 0x100
local VER_COMMAND_QUERY = 0x100

--[[
	known searchd status codes
]]
local SEARCHD_OK = 0
local SEARCHD_ERROR = 	1
local SEARCHD_RETRY = 	2
local SEARCHD_WARNING = 	3

--[[
	known match modes
]]
local SPH_MATCH_ALL = 	0
local SPH_MATCH_ANY = 	1
local SPH_MATCH_PHRASE = 2
local SPH_MATCH_BOOLEAN = 3
local SPH_MATCH_EXTENDED = 4
local SPH_MATCH_FULLSCAN = 5
local SPH_MATCH_EXTENDED2 = 6	

--[[
	known ranking modes (ext2 only)
]]
local SPH_RANK_PROXIMITY_BM25 = 0
local SPH_RANK_BM25 = 	1
local SPH_RANK_NONE = 	2
local SPH_RANK_WORDCOUNT = 3
local SPH_RANK_PROXIMITY = 4
local SPH_RANK_MATCHANY = 5
local SPH_RANK_FIELDMASK = 6

--[[
	known sort modes
]]
local SPH_SORT_RELEVANCE = 0
local SPH_SORT_ATTR_DESC = 1
local SPH_SORT_ATTR_ASC = 2
local SPH_SORT_TIME_SEGMENTS = 3
local SPH_SORT_EXTENDED = 4
local SPH_SORT_EXPR = 5

--[[
	known filter types
]]
local SPH_FILTER_VALUES = 0
local SPH_FILTER_RANGE = 1
local SPH_FILTER_FLOATRANGE =2

--[[
	known attribute types
]]
local SPH_ATTR_INTEGER = 1
local SPH_ATTR_TIMESTAMP = 2
local SPH_ATTR_ORDINAL = 3
local SPH_ATTR_BOOL = 4
local SPH_ATTR_FLOAT = 5
local SPH_ATTR_BIGINT = 6
local SPH_ATTR_MULTI =  0x40000000

--[[
	known grouping functions
]]
local SPH_GROUPBY_DAY = 0
local SPH_GROUPBY_WEEK = 1
local SPH_GROUPBY_MONTH = 2
local SPH_GROUPBY_YEAR = 3
local SPH_GROUPBY_ATTR = 4
local SPH_GROUPBY_ATTRPAIR = 5

local mt = { __index = _M }

function new()
	print(3)
end

function connect()
	print(3)
end
