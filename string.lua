local ffi = require 'ffi'
local JavaObject = require 'java.object'

local JavaString = JavaObject:subclass()
JavaString.__name = 'JavaString'

function JavaString:__tostring()
	local str = self._env.ptr[0].GetStringUTFChars(self._env.ptr, self.ptr, nil)
	local luastr = str ~= nil and ffi.string(str) or '(null)'
	self._env.ptr[0].ReleaseStringUTFChars(self._env.ptr, self.ptr, str)
	return luastr
end

function JavaString:__len()
	return self._env.ptr[0].GetStringLength(self._env.ptr, self.ptr)
end

return JavaString
