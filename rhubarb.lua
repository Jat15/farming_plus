minetest.register_craftitem("farming_plus:rhubarb_seed", {
	description = "Rhubarb Seeds",
	inventory_image = "farming_rhubarb_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		local above = minetest.get_node(pointed_thing.above)
		if above.name == "air" then
			above.name = "farming_plus:rhubarb_1"
			minetest.set_node(pointed_thing.above, above)
			itemstack:take_item(1)
			return itemstack
		end
	end
})

minetest.register_node("farming_plus:rhubarb_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_rhubarb_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+5/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:rhubarb_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_rhubarb_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+11/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:rhubarb", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_rhubarb_3.png"},
	drop = {
		max_items = 6,
		items = {
			{ items = {'farming_plus:rhubarb_seed'} },
			{ items = {'farming_plus:rhubarb_seed'}, rarity = 2},
			{ items = {'farming_plus:rhubarb_seed'}, rarity = 5},
			{ items = {'farming_plus:rhubarb_item'} },
			{ items = {'farming_plus:rhubarb_item'}, rarity = 2 },
			{ items = {'farming_plus:rhubarb_item'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("farming_plus:rhubarb_item", {
	description = "Rhubarb",
	inventory_image = "farming_rhubarb.png",
})

farming:add_plant("farming_plus:rhubarb", {"farming_plus:rhubarb_1", "farming_plus:rhubarb_2"}, 50, 20)
