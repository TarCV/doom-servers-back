-- PgSQL dialect

CREATE SEQUENCE cvar_id_seq
    START WITH 192
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cvar_id_seq OWNER TO servers;

CREATE TABLE cvars (
    id bigint DEFAULT nextval('cvar_id_seq'::regclass) NOT NULL,
    engine bigint NOT NULL,
    name character varying(80) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    default_value character varying(20),
    options character varying(800),
    CONSTRAINT cvar_check_defaultvalue CHECK ((((type)::text = 'String'::text) OR ((type)::text = 'MapChoice'::text) OR ((type)::text = 'MapList'::text) OR (default_value IS NOT NULL))),
    CONSTRAINT cvar_check_options CHECK ((((type)::text = 'String'::text) OR ((type)::text = 'Bool'::text) OR ((type)::text = 'MapChoice'::text) OR ((type)::text = 'MapList'::text) OR (options IS NOT NULL)))
);


ALTER TABLE cvars OWNER TO servers;

CREATE TABLE engines (
    id bigint NOT NULL,
    name character varying(20)
);


ALTER TABLE engines OWNER TO servers;

INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (1, 0, 'skill', 'Skill (affects item spawn, ammo and monster settings)', 'choice', '2', '"choices": [{ "value": 0, "name": "I\"m too young to die." }, { "value": 1, "name": "Hey, not too rough." }, { "value": 2, "name": "Hurt me plenty." }, { "value": 3, "name": "Ultra-Violence." }, { "value": 4, "name": "Nightmare!" }]');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (2, 0, 'botskill', 'Botskill', 'choice', '2', '"choices": [{"value": 0, "name": "I want my mommy!" }, {"value": 1, "name": "I''m allergic to pain." }, {"value": 2, "name": "Bring it on." }, {"value": 3, "name": "I thrive off pain." }, {"value": 4, "name": "Nightmare!" }]');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (3, 0, 'sv_coopunassignedvoodoodollsfornplayers', 'Spawn voodoo dolls for players not in the game and only for first N players(COOP)', 'Int', '64', '"min_value": 1, "max_value": 64');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (4, 0, '__gameMode', 'Game mode', 'choice', 'cooperative', '"choices": [{"value": "cooperative", "name": "Cooperative"}, {"value": "survival", "name": "Survival" }, {"value": "invasion", "name": "Invasion" }, {"value": "deathmatch", "name": "Deathmatch" }, {"value": "teamplay", "name": "Team DM" }, {"value": "duel", "name": "Duel" }, {"value": "terminator", "name": "Terminator" }, {"value": "lastmanstanding", "name": "Last Man Standing" }, {"value": "teamlms", "name": "Team LMS" }, {"value": "possession", "name": "Possession" }, {"value": "teampossession", "name": "Team Possession" }, {"value": "teamgame", "name": "Teamgame (Custom)" }, {"value": "ctf", "name": "Capture the Flag" }, {"value": "oneflagctf", "name": "One flag CTF" }, {"value": "skulltag", "name": "Skulltag" }, {"value": "domination", "name": "Domination" }]');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (5, 0, 'fraglimit', 'Frag limit', 'Int', '0', '"min_value": 0, "max_value": 32767, "zero_name": "No limit"');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (6, 0, 'timelimit', 'Time limit', 'Float', '0.0', '"min_value": 0.0, "max_value": 32767.0, "zero_name": "No limit"');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (8, 0, 'teamdamage', 'Team damage scalar', 'Float', '0', '"min_value": 0.0');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (9, 0, 'infighting', 'Monster infighting (except INVASION)', 'Choice', '0', '"choices": [
{"value": "-1", "name": "No infightng" },
{"value": "0", "name": "Normal infightng" },
{"value": "1", "name": "Total infightng" },
]');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (10, 0, 'maxviewpitch', 'Maximum allowed view pitch', 'Float', '90', '"min_value": -90.0, "max_value": 90.0');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (11, 0, 'sv_artifactreturntime', 'Automatically return Terminator and Possession Stone in seconds', 'Int', '30', '"min_value": 0');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (12, 0, '__wavelimit', 'Wavelimit', 'Int', '0', '"min_value": 0, "max_value": 255, "zero_name": "Use map setting"');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (13, 0, 'winlimit', 'Winlimit', 'Int', '0', '"min_value": 0, "max_value": 255, "zero_name": "No limit"');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (14, 0, 'sv_dropstyle', 'Dropped item style', 'choice', '0', '"choices": [{"value": 0, "name": "Game default"}, {"value": 1, "name": "As in Doom (?)"}, {"value": 2, "name": "As in Strife"}]');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (15, 0, 'sv_coop_damagefactor', 'Damage factor (dealt to players by monsters) (COOP)', 'Float', '1', '"min_value": 0.0');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (16, 0, 'sv_smartaim', 'Smart Autoaim', 'Choice', '0', '"choices": [{"value": 0, "name": "Off" }, {"value": 1, "name": "On" }, {"value": 2, "name": "Never friends" }, {"value": 3, "name": "Only monsters" }]');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (17, 0, 'splashfactor', 'Splash factor', 'Float', '1', '"min_value": 0.0');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (18, 0, '__sv_gravity', 'Gravity factor', 'Float', '1', '"min_value": 0.0, "step": 0.00125');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (19, 0, 'sv_fastweapons', 'Fast weapons mode', 'Choice', '0', '"choices": [{"value": 0, "name": "No" }, {"value": 1, "name": "Fast (all animation frames are 1 tick)" }, {"value": 2, "name": "Ultra fast (most animation frames are 0 tick)" }]');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (20, 0, 'sv_killallmonsters_percentage', 'Have to kill this percentage of monsters to be able to exit a level', 'Int', '100', '"min_value": 0, "max_value": 100, "zero_name": "Disabled"');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (21, 0, 'sv_aircontrol', 'Air control factor', 'Float', '0.00390625', '"min_value": 0.0');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (22, 0, 'sv_maxlives', 'Player lives (SURVIVAL)', 'Int', '0', '"min_value": 0.0, "max_value": 255.0, "zero_name": "Unlimited"');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (23, 0, 'pointlimit', 'Pointlimit', 'Int', '0', '"min_value": 0, "max_value": 65535, "zero_name": "Unlimited"');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (24, 0, 'sv_maxteams', 'Maximum teams', 'Int', '2', '"min_value": 2');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (25, 0, '__falldamage', 'Falling damage', 'Choice', '0', '"choices":[{"value": 0, "name": "Off" }, {"value": 1, "name": "Old" }, {"value": 2, "name": "Hexen" }, {"value": 3, "name": "Strife" }]');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (26, 0, '__sv_exit', 'On attempt to exit level', 'Choice', '0', '"choices": [{"value": 0, "name": "Load next level"} ,{"value": 1, "name": "Restart current level"}, {"value": 2, "name": "Kill anyone who tries (DM)"}]');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (27, 0, '__sv_exit', 'Jumping', 'Choice', '0', '"choices": [{"value": 0, "name": "Allow by default"}, {"value": 1, "name": "Disallow by default"}, {"value": 2, "name": "Allow always (overrides MAPINFO)"}]');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (28, 0, '__sv_coop_loseammo', 'Lose ammo when respawning (COOP)', 'Choice', '0', '"choices": [{"value": 0, "name": "No"}, {"value": 1, "name": "All ammo"}, {"value": 2, "name": "Half of your ammo"}]');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (29, 0, '__sv_blockplayers', 'Allow players to block each other', 'Choice', '0', '"choices": [{"value": 0, "name": "Allow everybody"}, {"value": 1, "name": "Nobody"}, {"value": 2, "name": "Not same team"}]');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (30, 0, 'sv_minvoters', 'Require minimal number of voters to call a vote', 'Int', '1', '"min_value": 1, "max_value": 64');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (31, 0, 'sv_nocallvote', 'Allow calling a vote', 'Choice', '0', 'Anybody, Nobody, Players');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (32, 0, '__countdowntime', 'Countdown time', 'Int', '10', '"min_value": 0, "zero_name": "None"');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (34, 0, '__sv_possessionholdtime', 'Possesion hold time required to score', 'Int', '0', '"min_value": 0, "zero_name": "Map setting"');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (35, 0, 'sv_afk2spec', 'Force inactive players to spectators after N minutes', 'Int', '0', '"min_value": 0, "zero_name": "Disabled"');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (36, 0, 'sv_flagreturntime', 'Automatically return dropped flag in N seconds (CTF)', 'Int', '15', '"min_value": 0');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (37, 0, 'sv_maxclients', 'Max clients', 'Int', '32', '"min_value": 1, "max_value": 64');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (38, 0, 'sv_maxplayers', 'Max active players', 'Int', '32', '"min_value": 1, "max_value": 64');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (40, 0, 'sv_coopspawnvoodoodolls', 'Spawn voodoo dolls (COOP)', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (41, 0, 'sv_coopunassignedvoodoodolls', 'Spawn voodoo dolls for players not in the game (COOP)', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (42, 0, 'sv_unlimited_pickup', 'Unlimited inventory (including ammo)', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (43, 0, 'var_friction', 'Enable ice (BOOM friction effects)', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (33, 0, '__maplist', 'Map list for rotation', 'MapList', NULL, NULL);
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (39, 0, '__sv_motd', 'Message of the day', 'String', NULL, NULL);
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (44, 0, 'var_pushers', 'Enable wind (BOOM push/pull effects)', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (45, 0, 'alwaysapplydmflags', 'Apply DM flags for all game modes', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (46, 0, 'instagib', 'Enable Instagib modifier', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (47, 0, 'buckshot', 'Enable Buckshot modifier', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (48, 0, 'sv_suddendeath', 'Sudden death on tie', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (49, 0, 'sv_useteamstartsindm', 'Use team player starts (TDM, TLMS)', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (50, 0, 'sv_randomcoopstarts', 'Use random coops starts (COOP)', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (51, 0, 'lms_allowpistol', 'Allow using pistol (LMS)', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (52, 0, 'lms_allowshotgun', 'Allow using shotgun (LMS)', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (53, 0, 'lms_allowssg', 'Allow using SSG (LMS)', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (54, 0, 'lms_allowchaingun', 'Allow using chaingun (LMS)', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (55, 0, 'lms_allowminigun', 'Allow using minigun (LMS)', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (56, 0, 'lms_allowrocketlauncher', 'Allow using rocket launcher (LMS)', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (57, 0, 'lms_allowgrenadelauncher', 'Allow using grenade launcher (LMS)', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (58, 0, 'lms_allowplasma', 'Allow using plasmagun (LMS)', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (59, 0, 'lms_allowrailgun', 'Allow using railgun (LMS)', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (60, 0, 'lms_allowchainsaw', 'Allow using chainsaw (LMS)', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (61, 0, 'lms_spectatorchat', 'Allow spectators to talk to active players (LMS)', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (62, 0, 'lms_spectatorview', 'Allow spectators to view the game (LMS)', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (63, 0, 'sv_disableautohealth', 'Automatically use Strife health when <50% left (not DM)', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (64, 0, 'forcewater', 'Force water', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (65, 0, 'sv_nohealth', 'Spawn health items (DM)', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (66, 0, 'sv_weaponstay', 'Weapons stay (DM)', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (69, 0, 'sv_noarmor', 'Spawn armor (DM)', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (70, 0, 'sv_infiniteammo', 'Don''t use up ammo when firing', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (71, 0, 'sv_nomonsters', 'Spawn monsters', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (72, 0, 'sv_monsterrespawn', 'Monsters respawn sometime after their death', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (73, 0, 'sv_itemrespawn', 'Respawn items other than invulnerability and invisibility', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (74, 0, 'sv_fastmonsters', 'Monsters are fast', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (75, 0, 'sv_nofreelook', 'Allow freelook', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (76, 0, 'sv_respawnsuper', 'Respawn invulnerability and invisibility', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (77, 0, 'sv_nofov', 'Allow changing FOV', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (78, 0, 'sv_noweaponspawn', 'Spawn multiplayer weapons in coop games', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (79, 0, 'sv_nocrouch', 'Allow crouching', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (80, 0, 'sv_allowcrouch', 'Force allow crouching (overrides MAPINFO)', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (81, 0, 'sv_coop_loseinventory', 'Lose all your old inventory when respawning in coop', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (82, 0, 'sv_coop_losekeys', 'Lose keys when respawning in coop', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (83, 0, 'sv_limitnumvotes', 'Prevent vote flooding', 'Bool', 'true', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (84, 0, 'sv_coop_loseweapons', 'Lose weapons when respawning in coop', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (85, 0, 'sv_coop_losearmor', 'Lose armor when respawning in coop', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (86, 0, 'sv_coop_losepowerups', 'Lose powerups when respawning in coop', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (87, 0, 'sv_weapondrop', 'Drop current weapon upon death', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (88, 0, 'sv_noteamswitch', 'Allow players to switch teams in teamgames', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (89, 0, 'sv_doubleammo', 'Double amount of ammo that items give you like skill 1 and 5 do', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (90, 0, 'sv_degeneration', 'Player slowly loses health when over 100% (Quake-style)', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (91, 0, 'sv_bfgfreeaim', 'Allow BFG freeaiming in multiplayer games.', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (92, 0, 'sv_barrelrespawn', 'Barrels respawn', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (93, 0, 'sv_keepfrags', 'Don''t clear frags after each level', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (94, 0, 'sv_norespawn', 'Players can respawn', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (95, 0, 'sv_losefrag', 'Lose a frag when killed. More incentive to try to not get yerself killed', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (96, 0, 'sv_norespawninvul', 'Respawn invulnerability', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (97, 0, 'sv_samespawnspot', 'Players respawn in the same place they died (co-op)', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (98, 0, 'sv_infiniteinventory', 'Infinite inventory', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (99, 0, 'sv_killallmonsters', 'All monsters must be killed before the level exits.', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (100, 0, 'sv_noautomap', 'Players are allowed to see the automap.', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (101, 0, 'sv_noautomapallies', 'Allies can been seen on the automap.', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (68, 0, 'sv_forcerespawn', 'Force respawn (Automatically respawn dead players after respawn_time is up) (DM)', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (102, 0, 'sv_disallowspying', 'Allow spy on your allies.', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (103, 0, 'sv_chasecam', 'Players can use the chasecam command', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (104, 0, 'sv_disallowsuicide', 'Players are allowed to suicide.', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (105, 0, 'sv_noautoaim', 'Players can use autoaim.', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (106, 0, 'sv_dontcheckammo', 'Don''t Check ammo when switching weapons.', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (107, 0, 'sv_killbossmonst', 'Kills all monsters spawned by a boss cube when the boss dies', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (108, 0, 'sv_norunes', 'Spawn runes', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (109, 0, 'sv_instantreturn', 'Instantly return flags and skulls when player carrying it dies (ST/CTF)', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (110, 0, 'sv_noteamselect', 'Player is automatically placed on a team.', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (111, 0, 'sv_shotgunstart', 'All playres start with a shotgun when they respawn', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (112, 0, 'sv_noidentifytarget', 'Allow client to identify players', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (113, 0, 'sv_applylmsspectatorsettings', 'Force LMS Spectator restrictions in all game modes', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (114, 0, 'sv_nocoopinfo', 'Allow displaying coop info', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (115, 0, 'sv_nomedals', 'Allow displaying medals', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (116, 0, 'sv_sharekeys', 'Share keys between all players', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (117, 0, 'sv_keepteams', 'Players keep teams after a map change', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (118, 0, 'sv_forcegldefaults', 'Enforces some Gl rendering options to their default values', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (119, 0, 'sv_norocketjumping', 'Enable z-momentum of radius attacks (enables rocket jumping)', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (120, 0, 'sv_awarddamageinsteadkills', 'Award actual damage dealt instead of kills', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (121, 0, 'sv_forcealpha', 'Forces clients to display alpha', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (122, 0, 'sv_coop_spactorspawn', 'Spawn map actors in coop as if the game was single player', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (123, 0, 'sv_maxbloodscalar', 'Force blood brightness to max scalar on clients to emulate vanilla screen damage', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (124, 0, 'compat_shortTex', 'Use Doom''s shortest texture around behavior', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (125, 0, 'compat_stairs', 'Use old buggy stair building', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (126, 0, 'compat_limitpain', 'Pain elemental is limited to 20 lost souls', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (127, 0, 'compat_silentpickup', 'Pickups are only heard locally', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (128, 0, 'compat_nopassover', 'Pretend every actor is infinitely tall', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (129, 0, 'compat_soundslots', 'Limit actors to one sound at a time', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (130, 0, 'compat_wallrun', 'Enable buggier wall clipping so players can wallrun', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (131, 0, 'compat_notossdrops', 'Spawn dropped items directly on the floor', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (132, 0, 'compat_useblocking', 'Any special line can block a use line', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (133, 0, 'compat_nodoorlight', 'Don''t do the BOOM local door light effect', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (134, 0, 'compat_ravenscroll', 'Raven''s scrollers use their original carrying speed', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (135, 0, 'compat_soundtarget', 'Use sector based sound target code', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (136, 0, 'compat_dehhealth', 'Limit deh.MaxHealth to the health bonus (as in Doom2.exe)', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (137, 0, 'compat_trace', 'Trace ignores lines with the same sector on both sides', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (138, 0, 'compat_dropoff', 'Monsters cannot move when hanging over a dropoff', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (139, 0, 'compat_boomscroll', 'Scrolling sectors are additive like in Boom', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (140, 0, 'compat_invisibility', 'Monsters can see semi-invisible players', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (141, 0, 'compat_silentinstantfloors', 'Instantly moving floors are not silent', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (142, 0, 'compat_sectorsounds', 'Sector sounds use original method for sound origin', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (143, 0, 'compat_missileclip', 'Use original Doom heights for clipping against projectiles', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (144, 0, 'compat_crossdropoff', 'Monsters can''t be pushed over dropoffs', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (145, 0, 'compat_anybossdeath', 'Any monster which calls BOSSDEATH counts for level specials', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (146, 0, 'compat_minotaur', 'Minotaur''s floor flame is exploded immediately when feet are clipped', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (147, 0, 'compat_mushroom', 'Force original velocity calculations for A_Mushroom in Dehacked mods.', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (148, 0, 'compat_mbfmonstermove', 'Monsters are affected by friction and pushers/pullers.', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (149, 0, 'compat_corpsegibs', 'Crushed monsters are turned into gibs, rather than replaced by gibs.', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (150, 0, 'compat_noblockfriends', 'Friendly monsters aren''t blocked by monster-blocking lines.', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (151, 0, 'compat_spritesort', 'Invert sprite sorting order for sprites of equal distance', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (152, 0, 'compat_hitscan', 'Hitscans use original blockmap and hit check code.', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (153, 0, 'compat_light', 'Find neighboring light level like Doom', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (154, 0, 'compat_polyobj', 'Draw polyobjects the old fashioned way', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (155, 0, 'compat_limited_airmovement', 'Limited movement in the air', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (156, 0, 'compat_plasmabump', 'Allow the map01 "plasma bump"', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (157, 0, 'compat_instantrespawn', 'Allow instant respawn after death', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (158, 0, 'compat_disabletaunts', 'Allow taunts', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (159, 0, 'compat_originalsoundcurve', 'Use doom2.exe''s original sound curve', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (160, 0, 'compat_oldintermission', 'Use doom2.exe''s original intermission screens/music', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (161, 0, 'compat_disablestealthmonsters', 'Allow stealth monsters', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (162, 0, 'compat_oldradiusdmg', 'Always use the old radius damage code (infinite height)', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (163, 0, 'compat_nocrosshair', 'Allow crosshair use', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (164, 0, 'compat_oldweaponswitch', 'Force use the vanilla Doom weapon on pickup behavior', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (165, 0, 'compat_netscriptsareclientside', 'Execute NET scripts on client', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (166, 0, 'compat_clientssendfullbuttoninfo', 'Support all buttons for server-side GetPlayerInput calls (generates more net traffic)', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (167, 0, 'compat_noland', 'Allow ''land'' console command that causes additional speed boost for flying players on landing', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (168, 0, 'compat_oldrandom', 'Use Doom''s random table instead of ZDoom''s random number generator.', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (169, 0, 'compat_nogravity_spheres', 'Disable gravity for Invulnerability, Soulsphere, Megasphere and Invis items', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (170, 0, 'compat_dont_stop_player_scripts_on_disconnect', 'When a player leaves the game, don''t stop any scripts of that player that are still running', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (171, 0, 'compat_explosionthrust', 'Use the horizontal thrust of old ZDoom versions in radius damage attacks', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (172, 0, 'compat_bridgedrops', 'Allow non-SOLID things (like flags) to fall through invisible bridges', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (173, 0, 'compat_oldzdoomzmovement', 'Use old buggy ZDoom jump physics', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (174, 0, 'compat_fullweaponlower', 'Force waiting for weapons change animation to complete', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (175, 0, 'compat_autoaim', 'Use old autoaim (less precise)', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (176, 0, 'compat_silentwestspawns', 'Make west spawns silent', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (177, 0, 'sv_noduellimitvote', 'Allow calling duellimit vote', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (178, 0, 'sv_nofraglimitvote', 'Allow calling fraglimit vote', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (179, 0, 'sv_nokickvote', 'Allow calling kick vote', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (180, 0, 'sv_nopointlimitvot', 'Allow calling pointlimit vote', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (181, 0, 'sv_notimelimitvote', 'Allow calling timelimit vote', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (182, 0, 'sv_nowinlimitvote', 'Allow calling winlimit vote', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (183, 0, 'sv_nomapvote', 'Allow calling map vote', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (184, 0, 'sv_nochangemapvote', 'Allow calling changemap vote', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (185, 0, 'sv_noforcespecvote', 'Allow calling forcespec vote', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (186, 0, 'sv_maprotation', 'Enable map rotation', 'Bool', 'true', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (187, 0, 'sv_randommaprotation', 'Randomize map rotation', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (188, 0, 'sv_disallowbots', 'Enable bots', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (189, 0, 'sv_nokill', 'Allow suicide command', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (190, 0, 'sv_nodrop', 'Allow dropping items', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (191, 0, 'sv_forcerandomclass', 'Force random player class', 'Bool', 'false', '"show_inverted": false');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (192, 0, 'sv_nounlagged', 'Allow unlagged', 'Bool', 'false', '"show_inverted": true');
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (7, 0, 'lobby', 'Lobby map', 'MapChoice', NULL, NULL);
INSERT INTO cvars (id, engine, name, description, type, default_value, options) VALUES (67, 0, 'sv_spawnfarthest', 'Spawn farthest (Spawn players as far as possible from other players) (DM)', 'Bool', 'false', '"show_inverted": false');


INSERT INTO engines (id, name) VALUES (0, 'zandronum');


ALTER TABLE ONLY cvars
    ADD CONSTRAINT cvars_id PRIMARY KEY (id);

ALTER TABLE ONLY engines
    ADD CONSTRAINT engine_id PRIMARY KEY (id);

ALTER TABLE ONLY cvars
    ADD CONSTRAINT cvars_engine_fkey FOREIGN KEY (engine) REFERENCES engines(id);
