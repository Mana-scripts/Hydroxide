local ModuleScript = {}

--local getConstants = debug.getconstants or getconstants or getconsts

function ModuleScript.new(instance)
    local moduleScript = {}
    local closure = getScriptClosure(instance)

    moduleScript.Instance = instance
    moduleScript.Constants = debug.getconstants(closure)
    moduleScript.Protos = debug.getprotos(closure)
    --moduleScript.ReturnValue = require(instance) // causes detection

    return moduleScript
end

return ModuleScript
