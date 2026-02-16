local function remapArg(arg)
	if type(arg) == 'table' then return arg.ptr end
	return arg
end

local function remapArgs(...)
	if select('#', ...) == 0 then return end
	return remapArg(...), remapArgs(select(2, ...))
end

return {
	remapArg = remapArg,
	remapArgs = remapArgs,
}
