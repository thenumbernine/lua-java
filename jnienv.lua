local class = require 'ext.class'
local assert = require 'ext.assert'
local string = require 'ext.string'
local JavaClass = require 'java.class'

local JNIEnv = class()
JNIEnv.__name = 'JNIEnv'

function JNIEnv:init(ptr)
	self.ptr = assert.type(ptr, 'cdata', "expected a JNIEnv*")
	self.classesLoaded = {}


	-- save this up front
	local java_lang_Class = self:findClass'java/lang/Class'

	-- TODO a way to cache method names, but we've got 3 things to identify them by: name, signature, static
	java_lang_Class.java_lang_Class_getName = java_lang_Class:getMethod{
		name = 'getName',
		sig = {'java.lang.String'},
	}
end

function JNIEnv:getVersion()
	return self.ptr[0].GetVersion(self.ptr)
end

function JNIEnv:findClass(classpath)
	local classObj = self.classesLoaded[classpath]
	if not classObj then
		local classptr = self.ptr[0].FindClass(self.ptr, classpath)
		if classptr == nil then
			error('failed to find class '..tostring(classpath))
		end
		classObj = JavaClass{
			env = self,
			ptr = classptr,
			classpath = classpath,
		}
		self.classesLoaded[classpath] = classObj
	end
	return classObj
end

function JNIEnv:__tostring()
	return self.__name..'('..tostring(self.ptr)..')'
end

JNIEnv.__concat = string.concat

return JNIEnv
