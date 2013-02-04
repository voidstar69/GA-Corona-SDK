----------------------------------------------------------------------------------------
-- This is example code for the Game Analytics wrapper for Corona SDK
-- Before using it add the GameAnalytics.lua file to the root directory of your project
-- and paste your game/secret keys in the fields in the GameAnalytics.init call.
-- Look in the Corona Terminal for event responses and error messages.
----------------------------------------------------------------------------------------

------------------------------------------------------------
-- Import Game Analytics wrapper
------------------------------------------------------------
require ( "GameAnalytics" )

------------------------------------------------------------
-- Game Analytics properties. 
-- Always set wrapper properties before initializing!
------------------------------------------------------------
GameAnalytics.isDebug				= true
GameAnalytics.runInSimulator		= true
GameAnalytics.submitSystemInfo		= true
GameAnalytics.submitWhileRoaming	= false
GameAnalytics.archiveEvents			= true
GameAnalytics.archiveEventsLimit	= 256 -- kb
GameAnalytics.waitForCustomUserID	= false

------------------------------------------------------------
-- Initialize Game Analytics
------------------------------------------------------------
GameAnalytics.init ({
	game_key	= 'paste_your_game_key_here',
	secret_key	= 'paste_your_secret_key_here',
	build_name  = "1",
})

------------------------------------------------------------
-- Submit some events
-----------------------------------------------------------
GameAnalytics.newEvent ( "design", { event_id = "test:position", area = "menu", x = 50, y=50 } )

local productIdentifier = "bag_of_coins"
GameAnalytics.newEvent ( "business", { event_id = "iap:"..productIdentifier , currency = "USD", amount = 0.99 } )  

local  memUsage =  tostring (collectgarbage( "count" ) )
local  textureMemUsage = tostring (system.getInfo( "textureMemoryUsed" ))

GameAnalytics.newEvent ( "quality", 
	{ event_id = "performance:MemoryUsed", message = memUsage },
	{ event_id = "performance:TextureMemoryUsed", message = textureMemUsage }
)

GameAnalytics.newEvent ( "user", { gender = "F", birth_year = "1990", country = "DE" } )
