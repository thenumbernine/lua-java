#!/usr/bin/env luajit
--[[
Java provides no way to handle C functions, apart from its own JNI stuff
This means there's no way to pass in a LuaJIT->C closure callback to Java without going through JNI

How would I have a Java Runnable call a LuaJIT function?

Mind you this is not worrying about multithreading just yet.  Simply Runnable.
--]]
local os = require 'ext.os'

-- build the jni 
require 'make.targets'():add{
	dsts = {'librunnable_lib.so'},
	srcs = {'runnable_lib.c'},
	rule = function(r)
		assert(os.exec('gcc -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/linux" -shared -fPIC -o '..r.dsts[1]..' '..r.srcs[1]))
	end,
}:runAll()

-- build java
require 'make.targets'():add{
	dsts = {'Runnable.class'},
	srcs = {'Runnable.java'},
	rule = function(r)
		assert(os.exec('javac '..r.srcs[1]))
	end,
}:runAll()

local JVM = require 'java.vm'
local jvm = JVM{
	props = {
		['java.class.path'] = '.',
		['java.library.path'] = '.',
	}
}
print('jvm', jvm)
local J = jvm.jniEnv
print('jniEnv', J)

print('java', J.java)
print('java.lang', J.java.lang)
print('java.lang.System', J.java.lang.System)
print('java.lang.System.getProperty', J.java.lang.System.getProperty)

print('System properties:')
for _,k in ipairs{
	'java.version',
	'java.vendor',
	'java.vendor.url',
	'java.home',
	'java.vm.specification.version',
	--'java.specification.maintenance.version',	-- segfaulting?
	'java.vm.specification.vendor',
	'java.vm.specification.name',
	'java.vm.version',
	'java.vm.vendor',
	'java.vm.name',
	'java.specification.version',
	'java.specification.vendor',
	'java.specification.name',
	'java.class.version',
	'java.class.path',
	'java.library.path',
	'java.io.tmpdir',
	--'java.compiler',
	--'java.ext.dirs',
	'os.name',
	'os.arch',
	'os.version',
	'file.separator',
	'path.separator',
	'line.separator',
	'user.name',
	'user.home',
	'user.dir',
} do
	print(k..' = '..require'ext.tolua'(tostring(J.java.lang.System:getProperty(k))))
end
os.exit()

print(J.Runnable)
print(J.Runnable.run)

-- java.library.path
J.java.lang.System:loadLibrary'runnable_lib'

J.Runnable:run()
