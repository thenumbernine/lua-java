#!/usr/bin/env luajit

-- build
require 'java.tests.nativerunnable'

local JVM = require 'java.vm'
local jvm = JVM{
	props = {
		['java.class.path'] = '.',
		['java.library.path'] = '.',
	}
}
local J = jvm.jniEnv

local LiteThread = require 'thread.lite'
local thread = LiteThread{
	code = [=[
	local J = require 'java.vm'{ptr=arg}.jniEnv

	local JFrame = J.javax.swing.JFrame
	local frame = JFrame:_new'HelloWorldSwing Example'
	frame:setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE)

	local JLabel = J.javax.swing.JLabel
	local label = JLabel:_new'Hello World!'
	frame:add(label)

	frame:setSize(300, 200)				-- you need to call one or the other
	--frame:pack()
	frame:setLocationRelativeTo(nil)	-- puts it in the middle
	frame:setVisible(true)				-- shows it

	print'THREAD DONE'
]=],
}
local ffi = require 'ffi'
local runnable = J.io.github.thenumbernine.NativeRunnable:_new(
	ffi.cast('jlong', thread.funcptr),
	ffi.cast('jlong', J._vm._ptr)
)
J.javax.swing.SwingUtilities:invokeAndWait(runnable)
thread:showErr()
