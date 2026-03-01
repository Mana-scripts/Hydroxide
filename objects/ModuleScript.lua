local ModuleScript = {}

local function _getConstants(func)
    if typeof(func) ~= "function" then
        error("Expected function", 2)
    end
    
    if not debug.getconstants then
        error("debug.getconstants is not available in this environment", 2)
    end
    
    return debug.getconstants(func)
end

function ModuleScript.new(instance)
    local moduleScript = {}
    local closure = getScriptClosure(instance)

    moduleScript.Instance = instance
    moduleScript.Constants = _getConstants(closure)
    moduleScript.Protos = getProtos(closure)
    --moduleScript.ReturnValue = require(instance) // causes detection

    return moduleScript
end

return ModuleScript
