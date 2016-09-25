-- This information tells other players more about the mod
name = "Trash Can"
description = "You are tired of so many trash, but no room for them and dont want to see them. \nJust put them in this trash can and use torch ignite it, all things will gone and turn into ashes.\nEven gold! Burn, Burn everything!"
author = "ykl"
version = "2.3"

api_version = 10
dst_compatible = true
all_clients_require_mod = true
client_only_mod = false
forumthread = ""
icon_atlas = "images/modicon.xml"
icon = "modicon.tex"

priority = 0

configuration_options = {

  {
  		name = "Cutstones",
  		options = {
  			{ description = "1", data = 1, },
  			{ description = "2", data = 2, },
  			{ description = "3", data = 3, },
        { description = "4", data = 4, },
  			{ description = "5", data = 5, },
  			{ description = "6", data = 6, },
  		},
  		default = 5
  	},

    {
    		name = "Goldnugget",
    		options = {
    			{ description = "1", data = 1, },
    			{ description = "2", data = 2, },
    			{ description = "3", data = 3, },
          { description = "4", data = 4, },
    			{ description = "5", data = 5, },
    			{ description = "6", data = 6, },
    		},
    		default = 5
    	},
      {
      		name = "Charcoal",
      		options = {
      			{ description = "1", data = 1, },
      			{ description = "2", data = 2, },
      			{ description = "3", data = 3, },
            { description = "4", data = 4, },
      			{ description = "5", data = 5, },
      			{ description = "6", data = 6, },
      		},
      		default = 5
      	},
}
