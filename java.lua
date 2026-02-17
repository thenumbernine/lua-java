-- return the jni, which will hold the vm, and the vm will hold the jni, so if either is lost they wont gc on their own
return function(args)
	return require 'java.vm'(args).jniEnv
end
