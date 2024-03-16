#data get entity @s Inventory[{id:"minecraft:cobblestone"}].Count

#enchant @a[nbt={SelectedItem:{id:"minecraft:wooden_sword"}}] minecraft:sharpness 1
#enchant @a[nbt={SelectedItem:{id:"minecraft:wooden_sword"}}] minecraft:knockback 2

#enchant @a[nbt={SelectedItem:{id:"minecraft:stone_sword"}}] minecraft:sharpness 2
#enchant @a[nbt={SelectedItem:{id:"minecraft:stone_sword"}}] minecraft:unbreaking 3

#enchant @a[nbt={SelectedItem:{id:"minecraft:golden_sword"}}] minecraft:sharpness 5
#enchant @a[nbt={SelectedItem:{id:"minecraft:golden_sword"}}] minecraft:fire_aspect
#enchant @a[nbt={SelectedItem:{id:"minecraft:golden_sword"}}] minecraft:unbreaking 1

#enchant @a[nbt={SelectedItem:{id:"minecraft:iron_sword"}}] minecraft:sharpness 3
#enchant @a[nbt={SelectedItem:{id:"minecraft:iron_sword"}}] minecraft:sweeping 2

#enchant @a[nbt={SelectedItem:{id:"minecraft:diamond_sword"}}] minecraft:sharpness 4
#enchant @a[nbt={SelectedItem:{id:"minecraft:diamond_sword"}}] minecraft:sweeping 3


#enchant @a[nbt={SelectedItem:{id:"minecraft:wooden_axe"}}] minecraft:sharpness 1
#enchant @a[nbt={SelectedItem:{id:"minecraft:wooden_axe"}}] minecraft:knockback 2
#enchant @a[nbt={SelectedItem:{id:"minecraft:wooden_axe"}}] minecraft:efficiency 2

#enchant @a[nbt={SelectedItem:{id:"minecraft:stone_axe"}}] minecraft:sharpness 2
#enchant @a[nbt={SelectedItem:{id:"minecraft:stone_axe"}}] minecraft:unbreaking 3
#enchant @a[nbt={SelectedItem:{id:"minecraft:stone_axe"}}] minecraft:efficiency 3

#enchant @a[nbt={SelectedItem:{id:"minecraft:golden_axe"}}] minecraft:sharpness 5
#enchant @a[nbt={SelectedItem:{id:"minecraft:golden_axe"}}] minecraft:unbreaking 1
#enchant @a[nbt={SelectedItem:{id:"minecraft:golden_axe"}}] minecraft:efficiency 5

#enchant @a[nbt={SelectedItem:{id:"minecraft:iron_axe"}}] minecraft:sharpness 3
#enchant @a[nbt={SelectedItem:{id:"minecraft:iron_axe"}}] minecraft:efficiency 4

#enchant @a[nbt={SelectedItem:{id:"minecraft:diamond_axe"}}] minecraft:sharpness 4
#enchant @a[nbt={SelectedItem:{id:"minecraft:diamond_axe"}}] minecraft:efficiency 5

#enchant @a[nbt={SelectedItem:{id:"minecraft:wooden_pickaxe"}}] minecraft:efficiency 2
#enchant @a[nbt={SelectedItem:{id:"minecraft:stone_pickaxe"}}] minecraft:efficiency 3
#enchant @a[nbt={SelectedItem:{id:"minecraft:golden_pickaxe"}}] minecraft:efficiency 5
#enchant @a[nbt={SelectedItem:{id:"minecraft:iron_pickaxe"}}] minecraft:efficiency 4
#enchant @a[nbt={SelectedItem:{id:"minecraft:diamond_pickaxe"}}] minecraft:efficiency 5

#enchant @a[nbt={SelectedItem:{id:"minecraft:wooden_shovel"}}] minecraft:efficiency 2
#enchant @a[nbt={SelectedItem:{id:"minecraft:stone_shovel"}}] minecraft:efficiency 3
#enchant @a[nbt={SelectedItem:{id:"minecraft:golden_shovel"}}] minecraft:efficiency 5
#enchant @a[nbt={SelectedItem:{id:"minecraft:iron_shovel"}}] minecraft:efficiency 4
#enchant @a[nbt={SelectedItem:{id:"minecraft:diamond_shovel"}}] minecraft:efficiency 5

#enchant @a[nbt={SelectedItem:{id:"minecraft:leather_chestplate"}}] minecraft:protection 1
#enchant @a[nbt={SelectedItem:{id:"minecraft:chainmail_chestplate"}}] minecraft:protection 2
#enchant @a[nbt={SelectedItem:{id:"minecraft:iron_chestplate"}}] minecraft:protection 3
#enchant @a[nbt={SelectedItem:{id:"minecraft:diamond_chestplate"}}] minecraft:protection 4
#enchant @a[nbt={SelectedItem:{id:"minecraft:diamond_chestplate"}}] minecraft:thorns 1
#enchant @a[nbt={SelectedItem:{id:"minecraft:golden_chestplate"}}] minecraft:mending 1



effect give @a[nbt={SelectedItem:{id:"minecraft:feather"}}] slow_falling 1 0 true

effect give @a[nbt={SelectedItem:{id:"minecraft:rabbit_foot"}}] jump_boost 1 1 true
effect give @a[nbt={SelectedItem:{id:"minecraft:rabbit_foot"}}] speed 1 0 true

effect give @a[nbt={Inventory:[{Slot:103b,id:"minecraft:turtle_helmet"}]}] minecraft:dolphins_grace 1 1 true

execute at @a[scores={useStoneSword=1..},nbt={Inventory:[{Slot:-106b,id:"minecraft:flint"}],SelectedItem:{id:"minecraft:stone_sword"}}] at @e[distance=0.1..10] run fill ~ ~ ~ ~ ~ ~ fire replace air
clear @a[scores={useStoneSword=1..},nbt={Inventory:[{Slot:-106b,id:"minecraft:flint"}],SelectedItem:{id:"minecraft:stone_sword"}}] flint 1
scoreboard players set @a[scores={useStoneSword=1..}] useStoneSword 0

scoreboard players remove @a[scores={birchTimer=1..}] birchTimer 1

execute at @a[scores={placeBirch=1..}] at @e[distance=1..10] run place feature minecraft:birch
scoreboard players set @a[scores={placeBirch=1..,birchTimer=..0}] birchTimer 1200
scoreboard players set @a[scores={placeBirch=1..}] placeBirch 0


# Apple code non fonctionnel

execute as @a at @s if dimension minecraft:the_nether run effect give @s minecraft:strength 2 0 true
execute as @a at @s if dimension minecraft:the_nether run effect give @s minecraft:speed 2 0 true
execute as @a at @s if dimension minecraft:the_nether run effect give @s minecraft:jump_boost 2 1 true
execute as @a at @s if dimension minecraft:the_nether run effect give @s minecraft:haste 2 1 true

#execute as @e[type=arrow] at @s on origin run effect give @s poison
#execute as @a on attacker run kill @s
execute at @e[type=skeleton] on target run effect give @s slowness 10 0
execute at @a[nbt={SelectedItem:{id:"minecraft:bow",tag:{teleport:1b}}},scores={useTeleportBow=1..}] run tag @e[type=arrow,distance=..3] add teleport
execute as @e[type=arrow,tag=teleport,nbt={inGround:1b}] at @s on origin run tp @s ~ ~ ~
item modify entity @a[scores={useTeleportBow=1..},nbt={SelectedItem:{id:"minecraft:bow",tag:{teleport:1b}}}] weapon.mainhand emanhunt:damage_item
scoreboard players set @a[scores={useTeleportBow=1..}] useTeleportBow 0
kill @e[type=arrow,tag=teleport,nbt={inGround:1b}]


execute at @a[nbt={SelectedItem:{id:"minecraft:feather"}}] run data modify entity @e[type=boat,sort=nearest,limit=1] NoGravity set value 1b

#execute as @a[nbt={SelectedItem:{id:"minecraft:diamond"}}] store result score @s diamondCount run data get entity @s SelectedItem.Count
#item replace entity @a[nbt={SelectedItem:{id:"minecraft:diamond"}}] weapon.mainhand with minecraft:golden_carrot 
#item modify entity @a weapon.mainhand emanhunt:count_diamond

scoreboard players set @a[nbt={SelectedItem:{tag:{Enchantments:[{}]}}}] EnchantedSelectedItem 1
scoreboard players set @a[nbt=!{SelectedItem:{tag:{Enchantments:[{}]}}}] EnchantedSelectedItem 0
item modify entity @a[scores={EnchantedSelectedItem=..0}] weapon.mainhand emanhunt:enchant_randomly

#execute at @a[scores={useRepeater=1..}] at @a[distance=..10,nbt={Inventory:[{Slot:-106b,id:"minecraft:shield"}]}] run summon minecraft:item ~ ~ ~ {PickupDelay:40s,Item:{id:"minecraft:shield",Count:1b,tag:{dropped_shield:1b,Enchantments:[{id:unbreaking,lvl:1}]}}}
#execute as @e[type=item,nbt={Item:{tag:{dropped_shield:1b}}}] at @s store result entity @s Item.tag.Enchantments double 1 run data get entity @p Inventory[{Slot:-106b}].tag.Enchantments
#scoreboard players set @a[scores={useRepeater=1..}] useRepeater 0

#scoreboard players set @a itemConstant 2
#execute as @a store result score @s itemDurability run data get entity @s SelectedItem.tag.Damage
#execute as @a store result score @s itemLessDurability run scoreboard players operation @s itemDurability += @s itemConstant

execute as @a at @s anchored eyes if block ^ ^ ^1 obsidian run effect give @s haste 2 0 true
execute as @a at @s anchored eyes if block ^ ^ ^2 obsidian if block ^ ^ ^1 air run effect give @s haste 2 0 true

# usePickaxe = 1 si le joueur utilise une pioche
scoreboard players set @a[scores={useWoodenPickaxe=1..}] usePickaxe 1
scoreboard players set @a[scores={useStonePickaxe=1..}] usePickaxe 1
scoreboard players set @a[scores={useGoldenPickaxe=1..}] usePickaxe 1
scoreboard players set @a[scores={useIronPickaxe=1..}] usePickaxe 1
scoreboard players set @a[scores={useDiamondPickaxe=1..}] usePickaxe 1
scoreboard players set @a[scores={useNetheritePickaxe=1..}] usePickaxe 1
scoreboard players set @a[scores={usePickaxe=1..}] useWoodenPickaxe 0
scoreboard players set @a[scores={usePickaxe=1..}] useStonePickaxe 0
scoreboard players set @a[scores={usePickaxe=1..}] useGoldenPickaxe 0
scoreboard players set @a[scores={usePickaxe=1..}] useIronPickaxe 0
scoreboard players set @a[scores={usePickaxe=1..}] useDiamondPickaxe 0
scoreboard players set @a[scores={usePickaxe=1..}] useNetheritePickaxe 0
#execute as @a[scores={usePickaxe=1..}] at @s if predicate emanhunt:detect_bigpickaxe run fill ^-1 ^1 ^1 ^1 ^3 ^2 air destroy
#execute as @a[scores={usePickaxe=1..}] at @s run fill ^-1 ^1 ^1 ^1 ^3 ^2 air destroy
scoreboard players set @a[scores={usePickaxe=1..}] usePickaxe 0


# Steaks stockables tous en une case : celle de notre main
#scoreboard players set @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"}}] haveSteakinHand 100
#scoreboard players remove @a[nbt=!{SelectedItem:{id:"minecraft:cooked_beef"}},scores={haveSteakinHand=1..}] haveSteakinHand 1
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"}}] store result score @s countItem run clear @s cooked_beef 0
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"}}] run item modify entity @s weapon.mainhand emanhunt:count_steak
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:0b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.0 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:1b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.1 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:2b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.2 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:3b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.3 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:4b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.4 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:5b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.5 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:6b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.6 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:7b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.7 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:8b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.8 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:9b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.9 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:10b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.10 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:11b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.11 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:12b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.12 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:13b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.13 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:14b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.14 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:15b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.15 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:16b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.16 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:17b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.17 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:18b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.18 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:19b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.19 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:20b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.20 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:21b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.21 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:22b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.22 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:23b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.23 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:24b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.24 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:25b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.25 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:26b,id:"minecraft:cooked_beef"}]}] run item replace entity @s inventory.26 with air

#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:27b,id:"minecraft:cooked_beef"}]},nbt=!{SelectedItemSlot:0}] run item replace entity @s hotbar.0 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:28b,id:"minecraft:cooked_beef"}]},nbt=!{SelectedItemSlot:1}] run item replace entity @s hotbar.1 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:29b,id:"minecraft:cooked_beef"}]},nbt=!{SelectedItemSlot:2}] run item replace entity @s hotbar.2 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:30b,id:"minecraft:cooked_beef"}]},nbt=!{SelectedItemSlot:3}] run item replace entity @s hotbar.3 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:31b,id:"minecraft:cooked_beef"}]},nbt=!{SelectedItemSlot:4}] run item replace entity @s hotbar.4 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:32b,id:"minecraft:cooked_beef"}]},nbt=!{SelectedItemSlot:5}] run item replace entity @s hotbar.5 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:33b,id:"minecraft:cooked_beef"}]},nbt=!{SelectedItemSlot:6}] run item replace entity @s hotbar.6 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:34b,id:"minecraft:cooked_beef"}]},nbt=!{SelectedItemSlot:7}] run item replace entity @s hotbar.7 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:35b,id:"minecraft:cooked_beef"}]},nbt=!{SelectedItemSlot:8}] run item replace entity @s hotbar.8 with air
#execute as @a[nbt={SelectedItem:{id:"minecraft:cooked_beef"},Inventory:[{Slot:36b,id:"minecraft:cooked_beef"}]},nbt=![{SelectedItemSlot:9}] run item replace entity @s hotbar.9 with air

# Melting Snow
#execute as @e[type=area_effect_cloud,tag=meltingSnow] store result entity @s Duration double 1 run scoreboard players get entity @s duration
#scoreboard players set @e[type=area_effect_cloud,tag=mS] duration 200
#execute at @e[type=area_effect_cloud,tag=meltingSnow,nbt={Duration:200}] run fill ~ ~ ~ ~ ~ ~ snow_block
#tag @e[type=area_effect_cloud,tag=mS] remove mS


#execute as @a[nbt={Inventory:[{Slot:103b,tag:{Enchantments:[{id:obsidian_walker}]}}]}] run function emanhunt:obsidian_walker

#execute at @a if block ^ ^ ^2 tnt unless entity @e[type=interaction,tag=tntInteraction,distance=..5] run summon minecraft:interaction ~ ~0.5 ~ {Tags:[tntInteraction],eight:1,width:1}
#execute as @e[type=interaction,tag=tntInteraction] on target at @s if block ^ ^ ^2 tnt run summon tnt ^ ^ ^2

execute as @a[nbt={Inventory:[{Slot:100b,tag:{Enchantments:[{id:poison_thorns}]}}]}] on attacker run effect give @s poison 10 0 true
execute as @a[nbt={Inventory:[{Slot:101b,tag:{Enchantments:[{id:poison_thorns}]}}]}] on attacker run effect give @s poison 10 0 true
execute as @a[nbt={Inventory:[{Slot:102b,tag:{Enchantments:[{id:poison_thorns}]}}]}] on attacker run effect give @s poison 10 0 true
execute as @a[nbt={Inventory:[{Slot:103b,tag:{Enchantments:[{id:poison_thorns}]}}]}] on attacker run effect give @s poison 10 0 true

execute as @a run function emanhunt:have_chestplateinhand
execute as @a[scores={frozeEnnemy=1..},nbt={SelectedItem:{tag:{frozen_aspect:1b}}}] at @s as @e[type=!item,distance=0.01..5,nbt={HurtTime:10s}] at @s if predicate emanhunt:randomchance run summon armor_stand ~ ~ ~ {Marker:1b,Tags:["frozenAspect"]}
execute as @a[scores={frozeEnnemy=1..},nbt={SelectedItem:{tag:{frozen_aspect:1b}}}] at @s as @e[type=!item,distance=0.01..5,nbt={HurtTime:10s}] if predicate emanhunt:randomchance run effect give @s weakness 10 0
execute as @a[scores={frozeEnnemy=1..},nbt={SelectedItem:{tag:{frozen_aspect:1b}}}] at @s as @e[type=!item,distance=0.01..5,nbt={HurtTime:10s}] if predicate emanhunt:randomchance run effect give @s mining_fatigue 10 0
execute as @a[scores={frozeEnnemy=1..},nbt={SelectedItem:{tag:{frozen_aspect:1b}}}] at @s as @e[type=!item,distance=0.01..5,nbt={HurtTime:10s}] if predicate emanhunt:randomchance run effect give @s slowness 10 0
execute at @e[type=armor_stand,tag=frozenAspect,scores={frozenTimer=..38}] run fill ~ ~ ~ ~ ~1 ~ ice replace air
scoreboard players add @e[type=armor_stand,tag=frozenAspect] frozenTimer 1
execute at @e[type=armor_stand,tag=frozenAspect] run tp @e[type=!armor_stand,sort=nearest,limit=1,distance=..2] ~ ~ ~
execute at @e[type=armor_stand,tag=frozenAspect,scores={frozenTimer=39}] run fill ~ ~ ~ ~ ~1 ~ air destroy
kill @e[type=armor_stand,tag=frozenAspect,scores={frozenTimer=40..}]

execute as @e[type=armor_stand,tag=iceWorld] at @s run tp @s ~ ~ ~ ~10 ~
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^ air run fill ^ ^ ^ ^ ^ ^ ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^1 air run fill ^ ^ ^1 ^ ^ ^1 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^2 air run fill ^ ^ ^2 ^ ^ ^2 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^3 air run fill ^ ^ ^3 ^ ^ ^3 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^4 air run fill ^ ^ ^4 ^ ^ ^4 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^5 air run fill ^ ^ ^5 ^ ^ ^5 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^6 air run fill ^ ^ ^6 ^ ^ ^6 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^7 air run fill ^ ^ ^7 ^ ^ ^7 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^8 air run fill ^ ^ ^8 ^ ^ ^8 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^9 air run fill ^ ^ ^9 ^ ^ ^9 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^10 air run fill ^ ^ ^10 ^ ^ ^10 ice

execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^-1 air run fill ^ ^ ^-1 ^ ^ ^-1 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^-2 air run fill ^ ^ ^-2 ^ ^ ^-2 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^-3 air run fill ^ ^ ^-3 ^ ^ ^-3 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^-4 air run fill ^ ^ ^-4 ^ ^ ^-4 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^-5 air run fill ^ ^ ^-5 ^ ^ ^-5 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^-6 air run fill ^ ^ ^-6 ^ ^ ^-6 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^-7 air run fill ^ ^ ^-7 ^ ^ ^-7 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^-8 air run fill ^ ^ ^-8 ^ ^ ^-8 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^-9 air run fill ^ ^ ^-9 ^ ^ ^-9 ice
execute at @e[type=armor_stand,tag=iceWorld] unless block ^ ^ ^-10 air run fill ^ ^ ^-10 ^ ^ ^-10 ice

scoreboard players add @e[type=armor_stand,tag=iceWorld] iceWorldTimer 1
kill @e[type=armor_stand,tag=iceWorld,scores={iceWorldTimer=40..}]
