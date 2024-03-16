item modify entity @s[nbt={SelectedItem:{}}] weapon.mainhand emanhunt:enchant_poisonthorns
item modify entity @s[nbt={SelectedItem:{}}] weapon.mainhand emanhunt:_poisonthorns
tellraw @s[nbt=!{SelectedItem:{}}] {"text":"Vous devez avoir un objet en main pour l'enchanter !","color":"red"}