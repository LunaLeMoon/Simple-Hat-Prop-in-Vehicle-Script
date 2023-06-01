# Simple-Hat-Prop-in-Vehicle-Script

Hello! I am Luna, I am a texture artist, videographer and amateur script developer. This is the first script I publish. With that said, say hello to the Simple Hat-Prop-In-Vehicle Script! 

This script is designed to detect whether a player is wearing a hat/helmet (has a hat prop equipped), and ensures that said hat/helmet stays equipped when the player enters a vehicle. The purpose of this script is for aesthetic consistency, therefore, better gameplay.

The original intention for this script is for ensuring continuity when filming videos on FiveM, but, I would like to extend this for anyone who would like to use it for their server, recordings, etc.

Please refrain from making edits to the script if you're unsure of what you're doing, otherwise it will not work for you. However, since it is free to use/edit, you may customize it for your needs, although please ensure you've credited me should you publish your version of my script. Cheers!

If you're interested in my other work, or would like to reach me out, here is my **CFX Forums page:**
https://forum.cfx.re/u/mangolemoon/

Join my **Discord**, get news on my videos, server development projects and texture designs/clothing, and for inquiries.
https://discord.gg/wQUhaBBYj5

# Changelog:

## v1.0.3-beta
> (2023-06-01)

After testing the previous version, I realized that the reason it doesn't work may be one of a few things:

1. Inputting the wrong event names
2. Missing event registration.
3. Resource loading order

So, to accomodate for these possible issues, I made the following changes:
1. The client-side script should now register the custom events `attachHatToPlayer` and `detachHatFromPlayer` before using them. 
2. On the server-side, the events are registered and handle broadcasting the hat prop information to all clients.

I might have to adjust the event names again if I'm wrong, I suppose.

## v1.0.2-beta
> (2023-06-01)

In this version, the client-side script sends the hat prop information to the server using `TriggerServerEvent` when the player enters a vehicle or leaves a vehicle. The server-side script then receives these events and broadcasts them to all clients using `TriggerClientEvent`.

On the client-side, other players will receive the hat prop information through the `attachHatToPlayer` event and attach the hat prop to their respective player models. Similarly, when the `detachHatFromPlayer` event is received, other players will remove the hat prop from their player models.

Fixed spelling error on _fxmanifest.lua_

Changed tagging and semantic versioning to ensure it's known that this is a rather crude script, and not exactly ready for public use (FiveM servers and all that)

## v1.0.1-beta
> (2023-06-01)

In this updated version, the `AttachHatToPlayer` function uses the `GetPropModelName` function to get the model name of the current hat prop. It then uses `GetHashKey` to get the hash value of the prop model dynamically. This way, the script can attach any hat prop that the player is wearing.

But, that does mean that some hat props might not attach 'correctly' to the player's character model due to their size or position. This might need adjustments to the attachment position parameters (0.09, 0.06, 0.12) in the `AttachEntityToEntity` function to ensure the hat is properly aligned and positioned on the character's head bone.

This udpate is still only client-sided, meaning, other players would not see a player's hat/helmet remain equipped when in a vehicle. Will fix that.

Hopefully this works better.

## v1.0.0-beta
> (2023-05-30)

First Version. Tested, the script did not work. This is probably due to the following:

1. Hat prop index: In the line `local currentProp = GetPedPropIndex(playerPed, 0)`, I'd then need to make sure that the hat prop index (0) matches the correct prop index for the hat used in-game. In other words, if the hat prop index is different, I would then need to adjust this value accordingly. And honestly, no. That would be too much work, and it is inefficient. 

2. Hat prop preservation: The `SetPedPropIndex` function does not guarantee the hat prop when entering a vehicle. I realized that this is due to limitations of the game's mechanics, so I'd need an alternative.
