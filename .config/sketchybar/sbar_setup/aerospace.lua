function GetWorkspaces()
    local workspaces = RunCommand("aerospace list-workspaces --all")
    local strList = Split(workspaces, "\n")
    local spaces = {}

    for i, space in ipairs(strList) do
        spaces[i] = tonumber(space)
    end
    return spaces
end

function GetCurrentSpace()
    local cmd = RunCommand("aerospace list-workspaces --focused")
    local trimmed = string.gsub(cmd, "^%s*(.-)%s*$", "%1")
    return trimmed
end

function GetWindows(workspace)
    local cmd = RunCommand("aerospace list-windows --workspace " .. workspace .. " --format %{app-name}")
    cmd = Split(cmd, "\n")
    cmd = Deduplicate(cmd)

    local name = ""
    for _, app in ipairs(cmd) do
        local icon = icon_map(app)
        name = name .. " " .. icon
    end
    return name
end

function GetWindowsAndSpaces()
    local cmd = RunCommand("aerospace list-windows --monitor all --format %{app-name}::::%{workspace}")
    cmd = Split(cmd, "\n")
    cmd = Deduplicate(cmd)

    local spaces = {}
    for _, app in pairs(cmd) do
        local nameSpace = Split(app, "::::")
        local icon = icon_map(nameSpace[1])

        if spaces[nameSpace[2]] == nil then
            spaces[nameSpace[2]] = icon
        else
            spaces[nameSpace[2]] = spaces[nameSpace[2]] .. " " .. icon
        end
    end

    return spaces
end
