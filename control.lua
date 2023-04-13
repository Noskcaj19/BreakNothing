script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}, function(event)
	local entity = event.created_entity or event.entity
	if entity.name == "entity-ghost" then 
		return
	end
	entity.minable = false
	entity.destructible = false
end)

-- Why do some tiles not get created?
-- script.on_event({defines.events.on_pre_player_mined_item, defines.events.on_robot_pre_mined}, function(event) 
-- 	local entity = event.created_entity or event.entity
-- 	if entity.force.name ~= "player" then
-- 		return
-- 	end
-- 	game.print(entity.name)
-- 	local new_entity = entity.surface.create_entity{
-- 		name = entity.name,
-- 		position = entity.position,
-- 		force = entity.force,
-- 	}
-- end)

-- TODO: How to only prevent mining of player tiles?
-- script.on_event({defines.events.on_pre_player_mined_item, defines.events.on_robot_pre_mined}, function(event) 
-- 	event.created_entity = event.created_entity or event.entity
-- 	local entity_type = event.created_entity.type
-- 	game.print(serpent.block(event.created_entity.type))
-- 	game.print(serpent.block(event.created_entity.prototype.resource_category ))
-- 	if entity_type == "resource" or entity_type == "tree" then
-- 		return
-- 	end
-- 	event.created_entity.minable = false
-- 	log(event)
-- 	-- TODO: copy_settings
-- 	local new_entity = event.created_entity.surface.create_entity{
-- 		name = event.created_entity.name,
-- 		position = event.created_entity.position,
-- 		force = event.created_entity.force,
-- 	}
-- 	-- new_entity.minable = false
-- end)