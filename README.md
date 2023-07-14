# cw-popup 🆙
Super small script that just allows for a large readable page to be displayed via an export.
Takes a header and a text, supports line breaks and fun stuff.

The script doesn't do anything by itself, and you'll have to implement it wherever you want. An example follows further down, that shows how it's implemented in cw-invasion (upcoming script, or maybe it's out already if we forget to update this readme) to show game rules.

```lua
exports['cw-popup']:showPopup(header, text)
``` 

![](https://cdn.discordapp.com/attachments/977876510620909579/1129380929526317086/gifboi.gif)


# Preview 📽
Coming soon... maybe
# Developed by Coffeelot and Wuggie
[More scripts by us](https://github.com/stars/Coffeelot/lists/cw-scripts)  👈

**Support, updates and script previews**:

[![Join The discord!](https://cdn.discordapp.com/attachments/977876510620909579/1013102122985857064/discordJoin.png)](https://discord.gg/FJY4mtjaKr )

**All our scripts are and will remain free**. If you want to support what we do, you can buy us a coffee here:

[![Buy Us a Coffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg)](https://www.buymeacoffee.com/cwscriptbois )

# Usage examples

## Add an option to a qb-menu to open a desciptive text

Taken from cw-invasion

### 1. Define the texts, in this example they are located in the config.lua file of cw-invasion
```lua
Config.RuleHeader = "Invasion"
Config.RuleText = "At random, two signed up people will be teamed up in a game of Invader. One will be an INVADER and one will be a TARGET. \n\n The goal of the invader is to hack the target, twice, without being noticed. \n The Goal of the target is to find the invader and ping them.\n\n The invader will get a marker for where the target is, and must get over there and successfully hack before the game really starts.\n As soon as the first hack is done, the target will be notified that they are in the game. The game lasts for "..Config.HackTime.. " seconds.\n Halfway through the game, the invader will have to complete a second hack. If the second hack is not completed at the end of the game, the target wins instead. \n\n   Moving outside of the marked circle will mean the game comes to a draw.\n"

``` 
### 2. Create a function that uses the export
```lua
local function displayRules()
    exports['cw-popup']:showPopup(Config.RuleHeader, Config.RuleText)
end
```
### 3. Create an option to call the function (simplified version of cw-invasion)
```lua
    local menu = {
        {
            header = "Invasion Game 202X" ,
            isMenuHeader = true
        },
        {
            header = "Rules",
            icon = "fas fa-chess-knight",
            params = {
                event = displayRules,
                isAction = true
            }
        }
    }
    exports['qb-menu']:openMenu(menu)
```