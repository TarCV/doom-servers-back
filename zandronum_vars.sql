INSERT INTO CVARS(description, engine, show_inverted, varname, vartype, vardefault) VALUES
('Skill (affects item spawn, ammo and monster settings)', 0, false, 'skill', 'Int', '2'),
/*
	{ 0.0, "I'm too young to die." },
	{ 1.0, "Hey, not too rough." },
	{ 2.0, "Hurt me plenty." },
	{ 3.0, "Ultra-Violence." },
	{ 4.0, "Nightmare!" }
*/

('Botskill', 0, false, 'botskill', 'Int', '2'),
/*
	{ 0.0, "I want my mommy!" },
	{ 1.0, "I'm allergic to pain." },
	{ 2.0, "Bring it on." },
	{ 3.0, "I thrive off pain." },
	{ 4.0, "Nightmare!" }
*/

('Spawn voodoo dolls (COOP)', 0, false, 'sv_coopspawnvoodoodolls', 'Bool', 'true'),
('Spawn voodoo dolls for players not in the game (COOP)', 0, false, 'sv_coopunassignedvoodoodolls', 'Bool', 'true'),
('Spawn voodoo dolls for players not in the game and only for first N players(COOP)', 0, false, 'sv_coopunassignedvoodoodollsfornplayers', 'Int', '64'),
('Game mode', 0, false, '__gameMode', 'choice', 'cooperative'),
/*
('', 0, false, 'cooperative', 'Bool', 'true'),           	Cooperative" },
('', 0, false, 'survival', 'Bool', 'false'),             	Survival" },
('', 0, false, 'invasion', 'Bool', 'false'),             	Invasion" },
('', 0, false, 'deathmatch', 'Bool', 'false'),           	Deathmatch" },
('', 0, false, 'teamplay', 'Bool', 'false'),             	Team DM" },
('', 0, false, 'duel', 'Bool', 'false'),                 	Duel" },
('', 0, false, 'terminator', 'Bool', 'false'),           	Terminator" },
('', 0, false, 'lastmanstanding', 'Bool', 'false'),      	Last Man Standing" },
('', 0, false, 'teamlms', 'Bool', 'false'),              	Team LMS" },
('', 0, false, 'possession', 'Bool', 'false'),           	Possession" },
('', 0, false, 'teampossession', 'Bool', 'false'),       	"Team Possession" },
('', 0, false, 'teamgame', 'Bool', 'false'),             	"Teamgame (Custom)" },
('', 0, false, 'ctf', 'Bool', 'false'),                  	"Capture the Flag" },
('', 0, false, 'oneflagctf', 'Bool', 'false'),           	"One flag CTF" },
('', 0, false, 'skulltag', 'Bool', 'false'),             	"Skulltag" },
('', 0, false, 'domination', 'Bool', 'false'),           	"Domination" },
*/
('Unlimited inventory (including ammo)', 0, false, 'sv_unlimited_pickup', 'Bool', 'false'),
('Frag limit', 0, false, 'fraglimit', 'Int', '0'),
('Time limit', 0, false, 'timelimit', 'Float', '0.0'),
('Lobby map', 0, false, 'lobby', 'MapChoice', ''),
('Enable ice (BOOM friction effects)', 0, false, 'var_friction', 'Bool', 'true'),
('Enable wind (BOOM push/pull effects)', 0, false, 'var_pushers', 'Bool', 'true'),

-- TODO: consider always enable
('Apply DM flags for all game modes', 0, false, 'alwaysapplydmflags', 'Bool', 'false'),

('Team damage scalar', 0, false, 'teamdamage', 'Float', '0'),
('Enable monster infighting (except INVASION)', 0, false, 'infighting', 'Int', '0'),
('Enable Instagib modifier', 0, false, 'instagib', 'Bool', 'false'),
('Enable Buckshot modifier', 0, false, 'buckshot', 'Bool', 'false'),
('Sudden death on tie', 0, false, 'sv_suddendeath', 'Bool', 'true'),
('Maximum allowed view pitch', 0, false, 'maxviewpitch', 'Float', '90'),
('Use team player starts (TDM, TLMS)', 0, false, 'sv_useteamstartsindm', 'Bool', 'false'),
('Use random coops starts (COOP)', 0, false, 'sv_randomcoopstarts', 'Bool', 'false'),
('Automatically return Terminator and Possession Stone in seconds', 0, false, 'sv_artifactreturntime', 'Int', '30'),
('Wavelimit', 0, false, 'wavelimit', 'Int', '0'),
('Winlimit', 0, false, 'winlimit', 'Int', '0'),
('', 0, false, 'lmsallowedweapons', 'Int', '1023'),
('', 0, false, 'lmsspectatorsettings', 'Int', '2'),
('', 0, false, 'sv_dropstyle', 'Int', '0'),
('', 0, true, 'sv_disableautohealth', 'Bool', 'false'),
('', 0, false, 'sv_coop_damagefactor', 'Float', '1'),
('Smart Autoaim', 0, false, 'sv_smartaim', 'Int', '0'),
/*
	{ 0.0, "Off" },
	{ 1.0, "On" },
	{ 2.0, "Never friends" },
	{ 3.0, "Only monsters" }
*/

('Splash factor', 0, false, 'splashfactor', 'Float', '1'),

('Gravity factor', 0, false, '__sv_gravity', 'Float', '1'),
--('', 0, false, 'sv_gravity', 'Float', '800'),

('', 0, false, 'sv_fastweapons', 'Int', '0'),
('', 0, false, 'sv_killallmonsters_percentage', 'Int', '100'),
('Force water', 0, false, 'forcewater', 'Bool', 'false'),
('Air control factor', 0, false, 'sv_aircontrol', 'Float', '0.00390625'),
('Player lives (SURVIVAL)', 0, false, 'sv_maxlives', 'Int', '0'),
('Pointlimit', 0, false, 'pointlimit', 'Int', '0'),
('Maximum teams', 0, false, 'sv_maxteams', 'Int', '2'),

-- dmflags
('Spawn health items (DM)', 0, true , 'sv_nohealth', 'Bool', 'false'),

-- Not actually implemented in Zandronum: ('Spawn powerups (DM)', 0, true , 'sv_noitems', 'Bool', 'false'),

('Weapons stay (DM)', 0, false, 'sv_weaponstay', 'Bool', 'false'),
('Falling damage', 0, false, '__falldamage', 'Choice', 'Default', 'Default, Old ZDoom, Hexen, Strife'),
/*
	{ 0, "Off" },
	{ DF_FORCE_FALLINGZD, "Old" },
	{ DF_FORCE_FALLINGHX, "Hexen" },
	{ DF_FORCE_FALLINGZD|DF_FORCE_FALLINGHX, "Strife" }
*/

('Spawn farthest', 'Spawn players as far as possible from other players (DM)', 0, false, 'sv_spawnfarthest', 'Bool', 'false'),
('Force respawn', 'Automatically respawn dead players after respawn_time is up (DM)', 0, false, 'sv_forcerespawn', 'Bool', 'false'),
('Spawn armor (DM)', 0, true , 'sv_noarmor', 'Bool', 'false'),

-- TODO: combine these flags into one
('Restart the current level on level exit', 0, false, 'sv_samelevel', 'Bool', 'false'),
('Kill anyone who tries to exit the level (DM)', 0, false , 'sv_noexit', 'Bool', 'false'),

('Don\'t use up ammo when firing', 0, false, 'sv_infiniteammo', 'Bool', 'false'),
('Spawn monsters', 0, true , 'sv_nomonsters', 'Bool', 'false'),
('Monsters respawn sometime after their death', 0, false, 'sv_monsterrespawn', 'Bool', 'false'),
('Respawn items other than invulnerability and invisibility', 0, false, 'sv_itemrespawn', 'Bool', 'false'),
('Monsters are fast', 0, false, 'sv_fastmonsters', 'Bool', 'false'),

-- TODO: combine these flags into one
('Allow jumping', 0, true , 'sv_nojump', 'Bool', 'false'),
('Force allow jumping (overrides MAPINFO)', 0, false, 'sv_allowjump', 'Bool', 'false'),

('Allow freelook', 0, true , 'sv_nofreelook', 'Bool', 'false'),
('Respawn invulnerability and invisibility', 0, false, 'sv_respawnsuper', 'Bool', 'false'),
('Allow changing FOV', 0, true , 'sv_nofov', 'Bool', 'false'),
('Spawn multiplayer weapons in coop games', 0, true , 'sv_noweaponspawn', 'Bool', 'false'),

-- TODO: combine these flags into one
('Allow crouching', 0, true , 'sv_nocrouch', 'Bool', 'false'),
('Force allow crouching (overrides MAPINFO)', 0, false, 'sv_allowcrouch', 'Bool', 'false'),

('Lose all your old inventory when respawning in coop', 0, false, 'sv_coop_loseinventory', 'Bool', 'false'),
('Lose keys when respawning in coop', 0, false, 'sv_coop_losekeys', 'Bool', 'false'),
('Lose weapons when respawning in coop', 0, false, 'sv_coop_loseweapons', 'Bool', 'false'),
('Lose armor when respawning in coop', 0, false, 'sv_coop_losearmor', 'Bool', 'false'),
('Lose powerups when respawning in coop', 0, false, 'sv_coop_losepowerups', 'Bool', 'false'),

-- TODO: combine these flags into one
('Lose ammo when respawning in coop', 0, false, 'sv_coop_loseammo', 'Bool', 'false'),
('Lose half your ammo when respawning in coop (but not less than the normal starting amount)', 0, false, 'sv_coop_halveammo', 'Bool', 'false'),

-- dmflags2
('Drop current weapon upon death', 0, false, 'sv_weapondrop', 'Bool', 'false'),
('Allow players to switch teams in teamgames', 0, true , 'sv_noteamswitch', 'Bool', 'false'),
('Double amount of ammo that items give you like skill 1 and 5 do', 0, false, 'sv_doubleammo', 'Bool', 'false'),
('Player slowly loses health when over 100% (Quake-style)', 0, false, 'sv_degeneration', 'Bool', 'false'),
('Allow BFG freeaiming in multiplayer games.', 0, false, 'sv_bfgfreeaim', 'Bool', 'false'),
('Barrels respawn', 0, false, 'sv_barrelrespawn', 'Bool', 'false'),
('Don\'t clear frags after each level', 0, false, 'sv_keepfrags', 'Bool', 'false'),
('Players can respawn', 0, true , 'sv_norespawn', 'Bool', 'false'),
('Lose a frag when killed. More incentive to try to not get yerself killed', 0, false, 'sv_losefrag', 'Bool', 'false'),
('Respawn invulnerability', 0, true , 'sv_norespawninvul', 'Bool', 'false'),
('Players respawn in the same place they died (co-op)', 0, false, 'sv_samespawnspot', 'Bool', 'false'),
('Infinite inventory', 0, false, 'sv_infiniteinventory', 'Bool', 'false'),
('All monsters must be killed before the level exits.', 0, false, 'sv_killallmonsters', 'Bool', 'false'),
('Players are allowed to see the automap.', 0, true , 'sv_noautomap', 'Bool', 'false'),
('Allies can been seen on the automap.', 0, true , 'sv_noautomapallies', 'Bool', 'false'),
('Allow spy on your allies.', 0, true, 'sv_disallowspying', 'Bool', 'false'),
('Players can use the chasecam command', 0, false, 'sv_chasecam', 'Bool', 'false'),
('Players are allowed to suicide.', 0, true, 'sv_disallowsuicide', 'Bool', 'false'),
('Players can use autoaim.', 0, true , 'sv_noautoaim', 'Bool', 'false'),
('Don\'t Check ammo when switching weapons.', 0, false, 'sv_dontcheckammo', 'Bool', 'false'),
('Kills all monsters spawned by a boss cube when the boss dies', 0, false, 'sv_killbossmonst', 'Bool', 'false'),
('Spawn runes', 0, true , 'sv_norunes', 'Bool', 'false'),
('Instantly return flags and skulls when player carrying it dies (ST/CTF)', 0, false, 'sv_instantreturn', 'Bool', 'false'),
('Player is automatically placed on a team.', 0, false , 'sv_noteamselect', 'Bool', 'false'),
('All playres start with a shotgun when they respawn', 0, false, 'sv_shotgunstart', 'Bool', 'false'),

-- zadmflags
('Allow client to identify players', 0, true , 'sv_noidentifytarget', 'Bool', 'false'),
('Force LMS Spectator restrictions in all game modes', 0, false, 'sv_applylmsspectatorsettings', 'Bool', 'false'),
('Allow displaying coop info', 0, true , 'sv_nocoopinfo', 'Bool', 'false'),

-- TODO: combine these settings
('Allow players block each other', 0, true, 'sv_unblockplayers', 'Bool', 'false'),
('Allow teammates block each other', 0, true, 'sv_unblockallies', 'Bool', 'false'),

('Allow displaying medals', 0, true , 'sv_nomedals', 'Bool', 'false'),
('Share keys between all players', 0, false, 'sv_sharekeys', 'Bool', 'false'),
('Players keep teams after a map change', 0, false, 'sv_keepteams', 'Bool', 'false'),
('Enforces some Gl rendering options to their default values', 0, false, 'sv_forcegldefaults', 'Bool', 'false'),
('Enable z-momentum of radius attacks (enables rocket jumping)', 0, true , 'sv_norocketjumping', 'Bool', 'false'),
('Award actual damage dealt instead of kills', 0, false, 'sv_awarddamageinsteadkills', 'Bool', 'false'),
('Forces clients to display alpha', 0, false, 'sv_forcealpha', 'Bool', 'false'),
('Spawn map actors in coop as if the game was single player', 0, false, 'sv_coop_spactorspawn', 'Bool', 'false'),
('Force blood brightness to max scalar on clients to emulate vanilla screen damage', 0, false, 'sv_maxbloodscalar', 'Bool', 'false'),

-- compatflags
('Use Doom\'s shortest texture around behavior', 0, false, 'compat_shortTex', 'Bool', 'false'),
('Use old buggy stair building', 0, false, 'compat_stairs', 'Bool', 'false'),
('Pain elemental is limited to 20 lost souls', 0, false, 'compat_limitpain', 'Bool', 'false'),
('Pickups are only heard locally', 0, false, 'compat_silentpickup', 'Bool', 'false'),
('Pretend every actor is infinitely tall', 0, false, 'compat_nopassover', 'Bool', 'false'),
('Limit actors to one sound at a time', 0, false, 'compat_soundslots', 'Bool', 'false'),
('Enable buggier wall clipping so players can wallrun', 0, false, 'compat_wallrun', 'Bool', 'false'),
('Spawn dropped items directly on the floor', 0, false, 'compat_notossdrops', 'Bool', 'false'),
('Any special line can block a use line', 0, false, 'compat_useblocking', 'Bool', 'false'),
('Don\'t do the BOOM local door light effect', 0, false, 'compat_nodoorlight', 'Bool', 'false'),
('Raven\'s scrollers use their original carrying speed', 0, false, 'compat_ravenscroll', 'Bool', 'false'),
('Use sector based sound target code', 0, false, 'compat_soundtarget', 'Bool', 'false'),
('Limit deh.MaxHealth to the health bonus (as in Doom2.exe)', 0, false, 'compat_dehhealth', 'Bool', 'false'),
('Trace ignores lines with the same sector on both sides', 0, false, 'compat_trace', 'Bool', 'false'),
('Monsters cannot move when hanging over a dropoff', 0, false, 'compat_dropoff', 'Bool', 'false'),
('Scrolling sectors are additive like in Boom', 0, false, 'compat_boomscroll', 'Bool', 'false'),
('Monsters can see semi-invisible players', 0, false, 'compat_invisibility', 'Bool', 'false'),
('Instantly moving floors are not silent', 0, false, 'compat_silentinstantfloors', 'Bool', 'false'),
('Sector sounds use original method for sound origin', 0, false, 'compat_sectorsounds', 'Bool', 'false'),
('Use original Doom heights for clipping against projectiles', 0, false, 'compat_missileclip', 'Bool', 'false'),
('Monsters can\'t be pushed over dropoffs', 0, false, 'compat_crossdropoff', 'Bool', 'false'),
('Any monster which calls BOSSDEATH counts for level specials', 0, false, 'compat_anybossdeath', 'Bool', 'false'),
('Minotaur\'s floor flame is exploded immediately when feet are clipped', 0, false, 'compat_minotaur', 'Bool', 'false'),
('Force original velocity calculations for A_Mushroom in Dehacked mods.', 0, false, 'compat_mushroom', 'Bool', 'false'),
('Monsters are affected by friction and pushers/pullers.', 0, false, 'compat_mbfmonstermove', 'Bool', 'false'),
('Crushed monsters are turned into gibs, rather than replaced by gibs.', 0, false, 'compat_corpsegibs', 'Bool', 'false'),
('Friendly monsters aren\'t blocked by monster-blocking lines.', 0, false, 'compat_noblockfriends', 'Bool', 'false'),
('Invert sprite sorting order for sprites of equal distance', 0, false, 'compat_spritesort', 'Bool', 'false'),
('Hitscans use original blockmap and hit check code.', 0, false, 'compat_hitscan', 'Bool', 'false'),
('Find neighboring light level like Doom', 0, false, 'compat_light', 'Bool', 'false'),
('Draw polyobjects the old fashioned way', 0, false, 'compat_polyobj', 'Bool', 'false'),

-- zacompatflags
('Limited movement in the air', 0, false, 'compat_limited_airmovement', 'Bool', 'false'),
('Allow the map01 "plasma bump"', 0, false, 'compat_plasmabump', 'Bool', 'false'),
('Allow instant respawn after death', 0, false, 'compat_instantrespawn', 'Bool', 'false'),
('Allow taunts', 0, true, 'compat_disabletaunts', 'Bool', 'false'),
('Use doom2.exe\'s original sound curve', 0, false, 'compat_originalsoundcurve', 'Bool', 'false'),
('Use doom2.exe\'s original intermission screens/music', 0, false, 'compat_oldintermission', 'Bool', 'false'),
('Allow stealth monsters', 0, true, 'compat_disablestealthmonsters', 'Bool', 'false'),
('Always use the old radius damage code (infinite height)', 0, false, 'compat_oldradiusdmg', 'Bool', 'false'),
('Allow crosshair use', 0, true, 'compat_nocrosshair', 'Bool', 'false'),
('Force use the vanilla Doom weapon on pickup behavior', 0, false, 'compat_oldweaponswitch', 'Bool', 'false'),
('Execute NET scripts on client', 0, false, 'compat_netscriptsareclientside', 'Bool', 'false'),
('Support all buttons for server-side GetPlayerInput calls (generates more net traffic)', 0, false, 'compat_clientssendfullbuttoninfo', 'Bool', 'false'),
('Allow \'land\' console command that causes additional speed boost for flying players on landing', 0, true, 'compat_noland', 'Bool', 'false'),
('Use Doom\'s random table instead of ZDoom\'s random number generator.', 0, false, 'compat_oldrandom', 'Bool', 'false'),
('Disable gravity for Invulnerability, Soulsphere, Megasphere and Invis items', 0, false, 'compat_nogravity_spheres', 'Bool', 'false'),
('When a player leaves the game, don\'t stop any scripts of that player that are still running', 0, false, 'compat_dont_stop_player_scripts_on_disconnect', 'Bool', 'false'),
('Use the horizontal thrust of old ZDoom versions in radius damage attacks', 0, false, 'compat_explosionthrust', 'Bool', 'false'),
('Allow non-SOLID things (like flags) to fall through invisible bridges', 0, false, 'compat_bridgedrops', 'Bool', 'false'),
('Use old buggy ZDoom jump physics', 0, false, 'compat_oldzdoomzmovement', 'Bool', 'false'),
('Force waiting for weapons change animation to complete', 0, false, 'compat_fullweaponlower', 'Bool', 'false'),
('Use old autoaim (less precise)', 0, false, 'compat_autoaim', 'Bool', 'false'),
('Make west spawns silent', 0, false, 'compat_silentwestspawns', 'Bool', 'false')
('Require minimal number of voters to call a vote', 0, true, 'sv_minvoters', 'Int', '1'),
('Allow calling a vote', 0, false, 'sv_nocallvote', 'Choice', '0', 'Anybody, Nobody, Players'),
('Allow calling duellimit vote', 0, true, 'sv_noduellimitvote', 'Bool', '0'),
('Allow calling fraglimit vote', 0, true, 'sv_nofraglimitvote', 'Bool', '0'),
('Allow calling kick vote', 0, true, 'sv_nokickvote', 'Bool', '0'),
('Allow calling pointlimit vote', 0, true, 'sv_nopointlimitvot', 'Bool', '0'),
('Allow calling timelimit vote', 0, true, 'sv_notimelimitvote', 'Bool', '0'),
('Allow calling winlimit vote', 0, true, 'sv_nowinlimitvote', 'Bool', '0'),
('Allow calling map vote', 0, true, 'sv_nomapvote', 'Bool', '0'),
('Allow calling changemap vote', 0, true, 'sv_nochangemapvote', 'Bool', '0'),
('Allow calling forcespec vote', 0, true, 'sv_noforcespecvote', 'Bool', '0'),
('Prevent vote flooding', 0, true, 'sv_limitnumvotes', 'Bool', 'true'),

('Countdown time', 0, false, '__countdowntime', 'Int', '10'),
/*
('', 0, false, 'sv_duelcountdowntime', 'Int', '10'),
('', 0, false, 'sv_invasioncountdowntime', 'Int', '10'),
('', 0, false, 'sv_possessioncountdowntime', 'Int', '10'),
('', 0, false, 'sv_survivalcountdowntime', 'Int', '10'),
('', 0, false, 'sv_lmscountdowntime', 'Int', '10'),
*/

('Use wavelimit from map settings', 0, false, 'sv_usemapsettingswavelimit', 'Bool', 'true'),

('Enable map rotation', 0, false, 'sv_maprotation', 'Bool', 'true'),
('Randomize map rotation', 0, false, 'sv_randommaprotation', 'Bool', 'false'),
('Map list for rotation', 0, false, '__maplist', 'MapList', null),

('', 0, false, '__sv_possessionholdtime', 'Int', '0'),
/*
('', 0, false, 'sv_possessionholdtime', 'Int', '30'),
('', 0, false, 'sv_usemapsettingspossessionholdtime', 'Bool', 'true'),
*/
('Enable bots', 0, true, 'sv_disallowbots', 'Bool', 'false'),
('Allow suicide command', 0, true, 'sv_nokill', 'Bool', 'false'),
('Allow dropping items', 0, true, 'sv_nodrop', 'Bool', 'false'),
('Force inactive players to spectators after N minutes', 0, false, 'sv_afk2spec', 'Int', 0),
('Force random player class', 0, false, 'sv_forcerandomclass', 'Bool', 'false'),
('Automatically return dropped flag in N seconds (CTF)', 0, false, 'sv_flagreturntime', 'Int', '15'),
('Allow unlagged', 0, true, 'sv_nounlagged', 'Bool', 'false')
('Max clients', 0, false, 'sv_maxclients', 'Int', '32'),
('Max active players', 0, false, 'sv_maxplayers', 'Int', '32')
('Message of the day', 0, false, '__sv_motd', 'String', ''),
;

/*
 Individual flags are used instead
('', 0, false, 'dmflags', 'Int', '0'),
('', 0, false, 'dmflags2', 'Int', '0'),
('', 0, false, 'zadmflags', 'Int', '0'),
('', 0, false, 'compatflags', 'Int', '0'),
('', 0, false, 'zacompatflags', 'Int', '0'),


 Utility cvars that should not be changed
sv_measureoutboundtraffic = false
sv_corpsequeuesize = 64
genblockmap = false
gennodes = false
genglnodes = false
sv_logfilenametimestamp
sv_logfile_append
sv_logfiletimestamp
sv_logfiletimestamp_usedate
sv_showlauncherqueries = false
sv_timestamp = false
sv_timestampformat = 0
sv_colorstripmethod = 0
sv_useticbuffer = true
sv_maxpacketsize = 1024
sv_emulatepacketloss = false
sv_unlagged_debugactors = false
sv_markchatlines = false //TODO: enable on controlled servers

 Is not allowed to change on our servers
sv_cheats = false
sv_pure = true
sv_updatemaster = true
sv_enforcebans = true
sv_queryignoretime = 10
sv_banfilereparsetime = 0
sv_enforcemasterbanlist true
sv_banfile = 'banlist.txt'
sv_banexemptionfile = 'whitelist.txt'
sv_showwarnings = false
sv_hackerlistfile = 'hackerlist.txt'
sv_defaultdmflags = false //TODO: search source code for presets using this name
sv_forcelogintojoin = false
authhostname = 'localhost'
sv_adminlistfile = 'adminlist.txt'
sv_limitcommands = true
('Server name', 0, false, 'sv_hostname', 'String', 'Unnamed <> Server'),
('Server website', 0, false, 'sv_website', 'String', ''),
('Admin e-mail', 0, false, 'sv_hostemail', 'String', ''),
('LAN broadcast', 0, false, 'sv_broadcast', 'Bool', 'true'),
('Connect password', 0, false, 'sv_password', 'Int', '0'),
('Require password to connect', 0, false, 'sv_forcepassword', 'Int', '0'),
('Join password', 0, false, 'sv_joinpassword', 'String', '0'),
('Require password to actually join the game', 0, false, 'sv_forcejoinpassword', 'Bool', 'false'),
('Max clients per IP address', 0, false, 'sv_maxclientsperip', 'Int', '2'),
('Server control password', 0, false, 'sv_rconpassword', 'Int', '0')
*/
