require 'ext.gc'
require 'java.ffi.jni'		-- get cdefs
local ffi = require 'ffi'
local class = require 'ext.class'
local table = require 'ext.table'
local assert = require 'ext.assert'
local io = require 'ext.io'
local path = require 'ext.path'
local JNIEnv = require 'java.jnienv'


-- how to know which jvm to load?
-- this needs to be done only once per app, where to do it?
local javalinkpath = io.readproc'which java'
local javaBinaryPath = io.readproc('readlink -f '..javalinkpath)
--DEBUG:print('javaBinaryPath', javaBinaryPath)
local javabindir = path(javaBinaryPath):getdir()	-- java ... /bin/
local javarootdir = javabindir:getdir()				-- java ...
local jni = ffi.load((javarootdir/'lib/server/libjvm.so').path)


local JavaVM = class()
JavaVM.__name = 'JavaVM'

--[[
args:
	version, defaults to JNI_VERSION_1_6
	props = key/value of props to set with -D
--]]
function JavaVM:init(args)
	args = args or {}

	-- save these separately so lua doesn't gc them
	self.optionStrings = table()
	self.optionTable = table()
	if args.props then
		for k,v in pairs(args.props) do
			local str = '-D'..k..'='..v
			self.optionStrings:insert(str)
			local option = ffi.new'JavaVMOption'
			option.optionString = str
			self.optionTable:insert(option)
		end
	end
	self.options = ffi.new('JavaVMOption[?]', #self.optionTable, self.optionTable)

	local jvmargs = ffi.new'JavaVMInitArgs'
	jvmargs.version = args.version or ffi.C.JNI_VERSION_1_6
	jvmargs.nOptions = #self.optionTable
	jvmargs.options = self.options
	jvmargs.ignoreUnrecognized = ffi.C.JNI_FALSE

	local jvm = ffi.new'JavaVM*[1]'
	local jniEnvPtr = ffi.new'JNIEnv*[1]'
	local result = jni.JNI_CreateJavaVM(jvm, jniEnvPtr, jvmargs)
	assert.eq(result, 0, 'JNI_CreateJavaVM')

	if jvm[0] == nil then error("failed to find a JavaVM*") end
	self._ptr = jvm[0]
	if jniEnvPtr[0] == nil then error("failed to find a JNIEnv*") end
	self.jniEnv = JNIEnv{
		vm = self,
		ptr = jniEnvPtr[0],
	}

	-- no longer need to retain for gc
	self.options = nil
	self.optionTable = nil
	self.optionStrings = nil
end

function JavaVM:destroy()
	if self._ptr then
		-- do you need to destroy the JNIEnv?
		local result = self._ptr[0].DestroyJavaVM(self._ptr)
		if result ~= 0 then
			print('DestroyJavaVM failed with code', result)
		end
		self._ptr = nil
	end
end

function JavaVM:__gc()
	self:destroy()
end

return JavaVM
