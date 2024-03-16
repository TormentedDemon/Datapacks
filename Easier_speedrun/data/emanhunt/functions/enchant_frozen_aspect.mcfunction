item modify entity @s[nbt={SelectedItem:{}}] weapon.mainhand emanhunt:enchant_frozenaspect
item modify entity @s[nbt={SelectedItem:{}}] weapon.mainhand emanhunt:lore_frozenaspect
item modify entity @s[nbt={SelectedItem:{}}] weapon.mainhand emanhunt:nbt_frozenaspect
tellraw @s[nbt=!{SelectedItem:{}}] {"text":"Vous devez avoir un objet en main pour l'enchanter !","color":"red"}