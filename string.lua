local ffi = require 'ffi'
local JavaObject = require 'java.object'

local JavaString = JavaObject:subclass()
JavaString.__name = 'JavaString'

function JavaString:__tostring()
	-- on this note ...
	-- ... if the JNI is returning null object results as NULL pointers ...
	-- ... and the JNI itself segfaults when it gets passed a NULl that it doesn't like ...
	-- ... where else do I have to bulletproof calls to the JNI?
	if self._ptr == nil then return 'null' end
	local str = self._env._ptr[0].GetStringUTFChars(self._env._ptr, self._ptr, nil)
	local luastr = str ~= nil and ffi.string(str) or '(null)'
	self._env._ptr[0].ReleaseStringUTFChars(self._env._ptr, self._ptr, str)
	return luastr
end

function JavaString:__len()
	return self._env._ptr[0].GetStringLength(self._env._ptr, self._ptr)
end

return JavaString
