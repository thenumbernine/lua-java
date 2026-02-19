#!/usr/bin/env luajit
local assert = require 'ext.assert'
local J = require 'java'


print('java.lang.Class.forName"java.lang.Class"', J.java.lang.Class:forName'java.lang.Class')
-- TODO why do two lookups not produce the same class?
print('java.lang.Class.forName"java.lang.Class"._ptr', J.java.lang.Class:forName'java.lang.Class'._ptr)
print('java.lang.Class.forName"java.lang.Class"._ptr', J.java.lang.Class:forName'java.lang.Class'._ptr)
assert.eq(J.java.lang.Class:forName'java.lang.Class', J.java.lang.Class:forName'java.lang.Class')
print('java.lang.Class.forName"java.lang.Void"', J.java.lang.Class:forName'java.lang.Void')

local Void = J.java.lang.Void
print('Void', Void)
print('Void._ptr', Void._ptr)
print(J.java.lang.Void == J.java.lang.Void)

print('Void.TYPE', Void.TYPE)

-- hmm, every time I get.TYPE, it's a new pointer
print('Void.TYPE._ptr', Void.TYPE._ptr)
print('Void.TYPE._ptr', Void.TYPE._ptr)
print('Void.TYPE._ptr', Void.TYPE._ptr)
print(J.java.lang.Void.TYPE == J.java.lang.Void.TYPE)

