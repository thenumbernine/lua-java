local assert = require 'ext.assert'
local class = require 'ext.class'

local JavaCallResolve = class()

function JavaCallResolve:init(args)
	self._caller = assert.index(args, 'caller')
	self._options = assert.index(args, 'options')
end

function JavaCallResolve:__call(...)
	-- ok now ...
	-- we gotta match up ... args with all the method option arsg

	return self._options[1]
end

return JavaCallResolve 
