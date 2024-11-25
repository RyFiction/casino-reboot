Casino Resource for QBCore

This is an updated version of the DOJ Casino resource for QBCore framework. I do not claim ownership of the original script. 
This update includes bug fixes and ensures compatibility with the latest QBCore versions.

Installation Instructions

1. Add Item Images

Navigate to the following directory in your server files:
resources\[qb]\qb-inventory\html\images

Copy the provided PNG files and paste them into the images folder.

2. Add Casino Items

Open the items.lua file in the following directory:
resources\[qb]\qb-core\shared\items.lua

Add the following lines of code to the file:

-- Casino Items
["casino_chip"]              = {["name"] = "casino_chip",            ["label"] = "Betting Chips",       ["weight"] = 3,         ["type"] = "item",      ["image"] = "casino_chip.png",              ["unique"] = false,     ["useable"] = false,    ["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Diamond Casino Chips"},
["casino_member"]            = {["name"] = "casino_member",          ["label"] = "Member Card",         ["weight"] = 50,        ["type"] = "item",      ["image"] = "casino_member.png",            ["unique"] = true,      ["useable"] = false,    ["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Diamond Casino Membership Card"},
["casino_vip"]               = {["name"] = "casino_vip",             ["label"] = "V.I.P Pass",          ["weight"] = 70,        ["type"] = "item",      ["image"] = "casino_vip.png",               ["unique"] = true,      ["useable"] = false,    ["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Diamond Casino V.I.P ALL ACCESS Pass"},

3. Restart Your Server

Credits
Original Script: DOJ Casino
Updates & Fixes: dotRy

Feel free to reach out if you encounter any issues! 🎲
Discord: @Ryfiction