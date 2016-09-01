local STRINGS = GLOBAL.STRINGS
local RECIPETABS = GLOBAL.RECIPETABS
local Ingredient = GLOBAL.Ingredient
local TECH = GLOBAL.TECH
local TUNING = GLOBAL.TUNING
local TheSim = GLOBAL.TheSim
local Vector3 = GLOBAL.Vector3
local ACTIONS = GLOBAL.ACTIONS
local containers = GLOBAL.require "containers"

PrefabFiles = {
	"trashcan",
}
local assets=
{
    Asset("ATLAS", "images/inventoryimages/trashcan.xml"),
    Asset("IMAGE", "images/inventoryimages/trashcantex"),
}
AddMinimapAtlas("images/inventoryimages/trashcan.xml")

local materials = {
    { name = "Cutstones", material = "cutstone" },
    { name = "Goldnugget", material = "goldnugget" },
    { name = "Charcoal", material = "charcoal" },
}


local formula = { }
local fsize = 0

for i = 1, #materials do
    local name = materials[i]["name"]
    local material = materials[i]["material"]
    local count = GetModConfigData(name)
    if count > 0 then
        fsize = fsize + 1
        formula[fsize] = Ingredient(material, count)
    end
end


local trashcan = AddRecipe("trashcan", -- name
formula, -- ingredients Add more like so , {Ingredient("boards", 1), Ingredient("rope", 2), Ingredient("twigs", 1), etc}
GLOBAL.RECIPETABS.TOWN, -- tab ( FARM, WAR, DRESS etc)
GLOBAL.TECH.SCIENCE_TWO, -- level (GLOBAL.TECH.NONE, GLOBAL.TECH.SCIENCE_ONE, etc)
"trashcan_placer", -- placer
nil, -- min_spacing
nil, -- nounlock
nil, -- numtogive
nil, -- builder_tag
"images/inventoryimages/trashcan.xml", -- atlas
"trashcan.tex") -- image
trashcan.min_spacing = 1
--------------------------------------------------------------------------------
-- [[set container]]
--------------------------------------------------------------------------------
local params = {}

params.trashcan = {
  widget =
  {
      slotpos = {},
      animbank = "ui_chest_3x3",
      animbuild = "ui_chest_3x3",
      pos = Vector3(0, 200, 0),
      side_align_tip = 160,
  },
  type = "chest",
}

for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.trashcan.widget.slotpos, Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end

containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, params.trashcan.widget.slotpos ~= nil and #params.trashcan.widget.slotpos or 0)

local containers_widgetsetup = containers.widgetsetup

function containers.widgetsetup(container, prefab, data)
    local t = prefab or container.inst.prefab
    if t == "trashcan" then
        local t = params[t]
        if t ~= nil then
            for k, v in pairs(t) do
                container[k] = v
            end
            container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        end
    else
        return containers_widgetsetup(container, prefab)
    end
end


GLOBAL.STRINGS.NAMES.TRASHCAN = "Trash Can" --It's name in-game
GLOBAL.STRINGS.RECIPE_DESC.TRASHCAN = "It's a trash can! You can burn all things in int." --recipe description
