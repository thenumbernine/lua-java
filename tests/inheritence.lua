#!/usr/bin/env luajit

-- build java
local os = require 'ext.os'
local targets = require 'make.targets'()
for _,fn in ipairs{'A', 'B', 'C'} do
	targets:add{
		dsts = {fn..'.class'},
		srcs = {fn..'.java'},
		rule = function(r)
			assert(os.exec('javac '..r.srcs[1]))
		end,
	}
end
targets:runAll()

local J = require 'java'
local A, B, C = J.A, J.B, J.C
local Object = J.java.lang.Object

print('Object', Object)
print('A', A)
print('B', B)
print('C', C)

local a = A:_new()
print('a', a)
local b = B:_new()

local c = C:_new()

--[[
java.lang.Class has 0 fields and 91 methods and 0 constructors
method[0] = getName	{"java.lang.String"}
method[1] = forName	{"java.lang.Class", "java.lang.String", "boolean", "java.lang.ClassLoader"}
method[2] = forName	{"java.lang.Class", "java.lang.Module", "java.lang.String"}
method[3] = forName	{"java.lang.Class", "java.lang.String"}
method[4] = toString	{"java.lang.String"}
method[5] = getModule	{"java.lang.Module"}
method[6] = getProtectionDomain	{"java.security.ProtectionDomain"}
method[7] = isAssignableFrom	{"boolean", "java.lang.Class"}
method[8] = isInstance	{"boolean", "java.lang.Object"}
method[9] = getModifiers	{"int"}
method[10] = isInterface	{"boolean"}
method[11] = isArray	{"boolean"}
method[12] = isPrimitive	{"boolean"}
method[13] = isHidden	{"boolean"}
method[14] = getSuperclass	{"java.lang.Class"}
method[15] = cast	{"java.lang.Object", "java.lang.Object"}
method[16] = componentType	{"java.lang.invoke.TypeDescriptor$OfField"}
method[17] = componentType	{"java.lang.Class"}
method[18] = describeConstable	{"java.util.Optional"}
method[19] = getComponentType	{"java.lang.Class"}
method[20] = isAnnotation	{"boolean"}
method[21] = isEnum	{"boolean"}
method[22] = isRecord	{"boolean"}
method[23] = getTypeParameters	{"java.lang.reflect.TypeVariable[]"}
method[24] = getClassLoader	{"java.lang.ClassLoader"}
method[25] = newInstance	{"java.lang.Object"}
method[26] = getInterfaces	{"java.lang.Class[]"}
method[27] = isMemberClass	{"boolean"}
method[28] = isLocalClass	{"boolean"}
method[29] = isAnonymousClass	{"boolean"}
method[30] = getEnclosingClass	{"java.lang.Class"}
method[31] = isUnnamedClass	{"boolean"}
method[32] = getSimpleName	{"java.lang.String"}
method[33] = getCanonicalName	{"java.lang.String"}
method[34] = isSynthetic	{"boolean"}
method[35] = getResourceAsStream	{"java.io.InputStream", "java.lang.String"}
method[36] = getResource	{"java.net.URL", "java.lang.String"}
method[37] = getPackageName	{"java.lang.String"}
method[38] = desiredAssertionStatus	{"boolean"}
method[39] = getMethod	{"java.lang.reflect.Method", "java.lang.String", "java.lang.Class[]"}
method[40] = isAnnotationPresent	{"boolean", "java.lang.Class"}
method[41] = getNestHost	{"java.lang.Class"}
method[42] = descriptorString	{"java.lang.String"}
method[43] = getPermittedSubclasses	{"java.lang.Class[]"}
method[44] = arrayType	{"java.lang.Class"}
method[45] = arrayType	{"java.lang.invoke.TypeDescriptor$OfField"}
method[46] = toGenericString	{"java.lang.String"}
method[47] = getGenericSuperclass	{"java.lang.reflect.Type"}
method[48] = getPackage	{"java.lang.Package"}
method[49] = getGenericInterfaces	{"java.lang.reflect.Type[]"}
method[50] = accessFlags	{"java.util.Set"}
method[51] = getSigners	{"java.lang.Object[]"}
method[52] = getEnclosingMethod	{"java.lang.reflect.Method"}
method[53] = getEnclosingConstructor	{"java.lang.reflect.Constructor"}
method[54] = getDeclaringClass	{"java.lang.Class"}
method[55] = getTypeName	{"java.lang.String"}
method[56] = getClasses	{"java.lang.Class[]"}
method[57] = getFields	{"java.lang.reflect.Field[]"}
method[58] = getMethods	{"java.lang.reflect.Method[]"}
method[59] = getConstructors	{"java.lang.reflect.Constructor[]"}
method[60] = getField	{"java.lang.reflect.Field", "java.lang.String"}
method[61] = getConstructor	{"java.lang.reflect.Constructor", "java.lang.Class[]"}
method[62] = getDeclaredClasses	{"java.lang.Class[]"}
method[63] = getDeclaredFields	{"java.lang.reflect.Field[]"}
method[64] = getRecordComponents	{"java.lang.reflect.RecordComponent[]"}
method[65] = getDeclaredMethods	{"java.lang.reflect.Method[]"}
method[66] = getDeclaredConstructors	{"java.lang.reflect.Constructor[]"}
method[67] = getDeclaredField	{"java.lang.reflect.Field", "java.lang.String"}
method[68] = getDeclaredMethod	{"java.lang.reflect.Method", "java.lang.String", "java.lang.Class[]"}
method[69] = getDeclaredConstructor	{"java.lang.reflect.Constructor", "java.lang.Class[]"}
method[70] = getEnumConstants	{"java.lang.Object[]"}
method[71] = asSubclass	{"java.lang.Class", "java.lang.Class"}
method[72] = getAnnotation	{"java.lang.annotation.Annotation", "java.lang.Class"}
method[73] = getAnnotationsByType	{"java.lang.annotation.Annotation[]", "java.lang.Class"}
method[74] = getAnnotations	{"java.lang.annotation.Annotation[]"}
method[75] = getDeclaredAnnotation	{"java.lang.annotation.Annotation", "java.lang.Class"}
method[76] = getDeclaredAnnotationsByType	{"java.lang.annotation.Annotation[]", "java.lang.Class"}
method[77] = getDeclaredAnnotations	{"java.lang.annotation.Annotation[]"}
method[78] = getAnnotatedSuperclass	{"java.lang.reflect.AnnotatedType"}
method[79] = getAnnotatedInterfaces	{"java.lang.reflect.AnnotatedType[]"}
method[80] = isNestmateOf	{"boolean", "java.lang.Class"}
method[81] = getNestMembers	{"java.lang.Class[]"}
method[82] = isSealed	{"boolean"}
method[83] = equals	{"boolean", "java.lang.Object"}
method[84] = hashCode	{"int"}
method[85] = getClass	{"java.lang.Class"}
method[86] = notify	{"void"}
method[87] = notifyAll	{"void"}
method[88] = wait	{"void", "long"}
method[89] = wait	{"void", "long", "int"}
method[90] = wait	{"void"}
java.lang.reflect.Field has 2 fields and 49 methods and 0 constructors
field[0] = PUBLIC	int
field[1] = DECLARED	int
method[0] = getName	{"java.lang.String"}
method[1] = get	{"java.lang.Object", "java.lang.Object"}
method[2] = equals	{"boolean", "java.lang.Object"}
method[3] = toString	{"java.lang.String"}
method[4] = hashCode	{"int"}
method[5] = getModifiers	{"int"}
method[6] = getBoolean	{"boolean", "java.lang.Object"}
method[7] = getByte	{"byte", "java.lang.Object"}
method[8] = getShort	{"short", "java.lang.Object"}
method[9] = getChar	{"char", "java.lang.Object"}
method[10] = getInt	{"int", "java.lang.Object"}
method[11] = getLong	{"long", "java.lang.Object"}
method[12] = getFloat	{"float", "java.lang.Object"}
method[13] = getDouble	{"double", "java.lang.Object"}
method[14] = isSynthetic	{"boolean"}
method[15] = toGenericString	{"java.lang.String"}
method[16] = accessFlags	{"java.util.Set"}
method[17] = getDeclaringClass	{"java.lang.Class"}
method[18] = getAnnotation	{"java.lang.annotation.Annotation", "java.lang.Class"}
method[19] = getAnnotationsByType	{"java.lang.annotation.Annotation[]", "java.lang.Class"}
method[20] = getDeclaredAnnotations	{"java.lang.annotation.Annotation[]"}
method[21] = set	{"void", "java.lang.Object", "java.lang.Object"}
method[22] = setAccessible	{"void", "boolean"}
method[23] = getGenericType	{"java.lang.reflect.Type"}
method[24] = getType	{"java.lang.Class"}
method[25] = setBoolean	{"void", "java.lang.Object", "boolean"}
method[26] = setByte	{"void", "java.lang.Object", "byte"}
method[27] = setChar	{"void", "java.lang.Object", "char"}
method[28] = setShort	{"void", "java.lang.Object", "short"}
method[29] = setInt	{"void", "java.lang.Object", "int"}
method[30] = setLong	{"void", "java.lang.Object", "long"}
method[31] = setFloat	{"void", "java.lang.Object", "float"}
method[32] = setDouble	{"void", "java.lang.Object", "double"}
method[33] = isEnumConstant	{"boolean"}
method[34] = getAnnotatedType	{"java.lang.reflect.AnnotatedType"}
method[35] = isAnnotationPresent	{"boolean", "java.lang.Class"}
method[36] = getAnnotations	{"java.lang.annotation.Annotation[]"}
method[37] = getDeclaredAnnotation	{"java.lang.annotation.Annotation", "java.lang.Class"}
method[38] = getDeclaredAnnotationsByType	{"java.lang.annotation.Annotation[]", "java.lang.Class"}
method[39] = setAccessible	{"void", "java.lang.reflect.AccessibleObject[]", "boolean"}
method[40] = trySetAccessible	{"boolean"}
method[41] = canAccess	{"boolean", "java.lang.Object"}
method[42] = isAccessible	{"boolean"}
method[43] = getClass	{"java.lang.Class"}
method[44] = notify	{"void"}
method[45] = notifyAll	{"void"}
method[46] = wait	{"void", "long"}
method[47] = wait	{"void", "long", "int"}
method[48] = wait	{"void"}
java.lang.reflect.Method has 2 fields and 46 methods and 0 constructors
field[0] = PUBLIC	int
field[1] = DECLARED	int
method[0] = invoke	{"java.lang.Object", "java.lang.Object", "java.lang.Object[]"}
method[1] = getName	{"java.lang.String"}
method[2] = equals	{"boolean", "java.lang.Object"}
method[3] = toString	{"java.lang.String"}
method[4] = hashCode	{"int"}
method[5] = getModifiers	{"int"}
method[6] = getTypeParameters	{"java.lang.reflect.TypeVariable[]"}
method[7] = getReturnType	{"java.lang.Class"}
method[8] = getParameterTypes	{"java.lang.Class[]"}
method[9] = isSynthetic	{"boolean"}
method[10] = toGenericString	{"java.lang.String"}
method[11] = getDeclaringClass	{"java.lang.Class"}
method[12] = getAnnotation	{"java.lang.annotation.Annotation", "java.lang.Class"}
method[13] = getDeclaredAnnotations	{"java.lang.annotation.Annotation[]"}
method[14] = setAccessible	{"void", "boolean"}
method[15] = isVarArgs	{"boolean"}
method[16] = getParameterCount	{"int"}
method[17] = getParameterAnnotations	{"java.lang.annotation.Annotation[][]"}
method[18] = getGenericParameterTypes	{"java.lang.reflect.Type[]"}
method[19] = getGenericExceptionTypes	{"java.lang.reflect.Type[]"}
method[20] = isDefault	{"boolean"}
method[21] = getGenericReturnType	{"java.lang.reflect.Type"}
method[22] = getExceptionTypes	{"java.lang.Class[]"}
method[23] = isBridge	{"boolean"}
method[24] = getDefaultValue	{"java.lang.Object"}
method[25] = getAnnotatedReturnType	{"java.lang.reflect.AnnotatedType"}
method[26] = accessFlags	{"java.util.Set"}
method[27] = getAnnotationsByType	{"java.lang.annotation.Annotation[]", "java.lang.Class"}
method[28] = getAnnotatedParameterTypes	{"java.lang.reflect.AnnotatedType[]"}
method[29] = getParameters	{"java.lang.reflect.Parameter[]"}
method[30] = getAnnotatedReceiverType	{"java.lang.reflect.AnnotatedType"}
method[31] = getAnnotatedExceptionTypes	{"java.lang.reflect.AnnotatedType[]"}
method[32] = isAnnotationPresent	{"boolean", "java.lang.Class"}
method[33] = getAnnotations	{"java.lang.annotation.Annotation[]"}
method[34] = getDeclaredAnnotation	{"java.lang.annotation.Annotation", "java.lang.Class"}
method[35] = getDeclaredAnnotationsByType	{"java.lang.annotation.Annotation[]", "java.lang.Class"}
method[36] = setAccessible	{"void", "java.lang.reflect.AccessibleObject[]", "boolean"}
method[37] = trySetAccessible	{"boolean"}
method[38] = canAccess	{"boolean", "java.lang.Object"}
method[39] = isAccessible	{"boolean"}
method[40] = getClass	{"java.lang.Class"}
method[41] = notify	{"void"}
method[42] = notifyAll	{"void"}
method[43] = wait	{"void", "long"}
method[44] = wait	{"void", "long", "int"}
method[45] = wait	{"void"}
java.lang.reflect.Constructor has 2 fields and 41 methods and 0 constructors
field[0] = PUBLIC	int
field[1] = DECLARED	int
method[0] = getName	{"java.lang.String"}
method[1] = equals	{"boolean", "java.lang.Object"}
method[2] = toString	{"java.lang.String"}
method[3] = hashCode	{"int"}
method[4] = getModifiers	{"int"}
method[5] = getTypeParameters	{"java.lang.reflect.TypeVariable[]"}
method[6] = newInstance	{"java.lang.Object", "java.lang.Object[]"}
method[7] = getParameterTypes	{"java.lang.Class[]"}
method[8] = isSynthetic	{"boolean"}
method[9] = toGenericString	{"java.lang.String"}
method[10] = getDeclaringClass	{"java.lang.Class"}
method[11] = getAnnotation	{"java.lang.annotation.Annotation", "java.lang.Class"}
method[12] = getDeclaredAnnotations	{"java.lang.annotation.Annotation[]"}
method[13] = setAccessible	{"void", "boolean"}
method[14] = isVarArgs	{"boolean"}
method[15] = getParameterCount	{"int"}
method[16] = getParameterAnnotations	{"java.lang.annotation.Annotation[][]"}
method[17] = getGenericParameterTypes	{"java.lang.reflect.Type[]"}
method[18] = getGenericExceptionTypes	{"java.lang.reflect.Type[]"}
method[19] = getExceptionTypes	{"java.lang.Class[]"}
method[20] = getAnnotatedReturnType	{"java.lang.reflect.AnnotatedType"}
method[21] = getAnnotatedReceiverType	{"java.lang.reflect.AnnotatedType"}
method[22] = accessFlags	{"java.util.Set"}
method[23] = getAnnotationsByType	{"java.lang.annotation.Annotation[]", "java.lang.Class"}
method[24] = getAnnotatedParameterTypes	{"java.lang.reflect.AnnotatedType[]"}
method[25] = getParameters	{"java.lang.reflect.Parameter[]"}
method[26] = getAnnotatedExceptionTypes	{"java.lang.reflect.AnnotatedType[]"}
method[27] = isAnnotationPresent	{"boolean", "java.lang.Class"}
method[28] = getAnnotations	{"java.lang.annotation.Annotation[]"}
method[29] = getDeclaredAnnotation	{"java.lang.annotation.Annotation", "java.lang.Class"}
method[30] = getDeclaredAnnotationsByType	{"java.lang.annotation.Annotation[]", "java.lang.Class"}
method[31] = setAccessible	{"void", "java.lang.reflect.AccessibleObject[]", "boolean"}
method[32] = trySetAccessible	{"boolean"}
method[33] = canAccess	{"boolean", "java.lang.Object"}
method[34] = isAccessible	{"boolean"}
method[35] = getClass	{"java.lang.Class"}
method[36] = notify	{"void"}
method[37] = notifyAll	{"void"}
method[38] = wait	{"void", "long"}
method[39] = wait	{"void", "long", "int"}
method[40] = wait	{"void"}
java.lang.Object has 0 fields and 9 methods and 1 constructors
method[0] = equals	{"boolean", "java.lang.Object"}
method[1] = toString	{"java.lang.String"}
method[2] = hashCode	{"int"}
method[3] = getClass	{"java.lang.Class"}
method[4] = notify	{"void"}
method[5] = notifyAll	{"void"}
method[6] = wait	{"void", "long"}
method[7] = wait	{"void", "long", "int"}
method[8] = wait	{"void"}
constructor[0] = {"void"}
Object	JavaClass(java.lang.Object cdata<void *>: 0x60cfbbf23bb8)
A has 3 fields and 9 methods and 1 constructors
field[0] = a	int
field[1] = b	int
field[2] = c	int
method[0] = equals	{"boolean", "java.lang.Object"}
method[1] = toString	{"java.lang.String"}
method[2] = hashCode	{"int"}
method[3] = getClass	{"java.lang.Class"}
method[4] = notify	{"void"}
method[5] = notifyAll	{"void"}
method[6] = wait	{"void", "long"}
method[7] = wait	{"void", "long", "int"}
method[8] = wait	{"void"}
constructor[0] = {"void"}
A	JavaClass(A cdata<void *>: 0x60cfbbf24090)
B has 2 fields and 9 methods and 1 constructors
field[0] = b	int
field[1] = c	int
method[0] = equals	{"boolean", "java.lang.Object"}
method[1] = toString	{"java.lang.String"}
method[2] = hashCode	{"int"}
method[3] = getClass	{"java.lang.Class"}
method[4] = notify	{"void"}
method[5] = notifyAll	{"void"}
method[6] = wait	{"void", "long"}
method[7] = wait	{"void", "long", "int"}
method[8] = wait	{"void"}
constructor[0] = {"void"}
B	JavaClass(B cdata<void *>: 0x60cfbbf24688)
C has 1 fields and 9 methods and 1 constructors
field[0] = c	int
method[0] = equals	{"boolean", "java.lang.Object"}
method[1] = toString	{"java.lang.String"}
method[2] = hashCode	{"int"}
method[3] = getClass	{"java.lang.Class"}
method[4] = notify	{"void"}
method[5] = notifyAll	{"void"}
method[6] = wait	{"void", "long"}
method[7] = wait	{"void", "long", "int"}
method[8] = wait	{"void"}
constructor[0] = {"void"}
C	JavaClass(C cdata<void *>: 0x60cfbbf24aa0)
--]]
