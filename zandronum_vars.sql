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
    section bigint NOT NULL,
    CONSTRAINT cvar_check_defaultvalue CHECK ((((type)::text = 'String'::text) OR ((type)::text = 'MapChoice'::text) OR ((type)::text = 'MapList'::text) OR (default_value IS NOT NULL))),
    CONSTRAINT cvar_check_options CHECK ((((type)::text = 'String'::text) OR ((type)::text = 'Bool'::text) OR ((type)::text = 'MapChoice'::text) OR ((type)::text = 'MapList'::text) OR (options IS NOT NULL)))
);


ALTER TABLE cvars OWNER TO servers;

CREATE TABLE engines (
    id bigint NOT NULL,
    name character varying(20)
);


ALTER TABLE engines OWNER TO servers;

CREATE TABLE sections (
    id bigint NOT NULL,
    name character varying(20),
    engine bigint
);


ALTER TABLE sections OWNER TO servers;

CREATE TABLE sections_settings (
    setting_sections_entity_id bigint NOT NULL,
    settings_id bigint NOT NULL
);


ALTER TABLE sections_settings OWNER TO servers;


INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (1, 'skill', 'Skill (affects item spawn, ammo and monster settings)', 'choice', '2', '"choices": [{ "value": 0, "name": "I\"m too young to die." }, { "value": 1, "name": "Hey, not too rough." }, { "value": 2, "name": "Hurt me plenty." }, { "value": 3, "name": "Ultra-Violence." }, { "value": 4, "name": "Nightmare!" }]', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (4, '__gameMode', 'Game mode', 'choice', 'cooperative', '"choices": [{"value": "cooperative", "name": "Cooperative"}, {"value": "survival", "name": "Survival" }, {"value": "invasion", "name": "Invasion" }, {"value": "deathmatch", "name": "Deathmatch" }, {"value": "teamplay", "name": "Team DM" }, {"value": "duel", "name": "Duel" }, {"value": "terminator", "name": "Terminator" }, {"value": "lastmanstanding", "name": "Last Man Standing" }, {"value": "teamlms", "name": "Team LMS" }, {"value": "possession", "name": "Possession" }, {"value": "teampossession", "name": "Team Possession" }, {"value": "teamgame", "name": "Teamgame (Custom)" }, {"value": "ctf", "name": "Capture the Flag" }, {"value": "oneflagctf", "name": "One flag CTF" }, {"value": "skulltag", "name": "Skulltag" }, {"value": "domination", "name": "Domination" }]', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (5, 'fraglimit', 'Frag limit', 'Int', '0', '"min_value": 0, "max_value": 32767, "zero_name": "No limit"', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (6, 'timelimit', 'Time limit', 'Float', '0.0', '"min_value": 0.0, "max_value": 32767.0, "zero_name": "No limit"', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (8, 'teamdamage', 'Team damage scalar', 'Float', '0', '"min_value": 0.0', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (10, 'maxviewpitch', 'Maximum allowed view pitch', 'Float', '90', '"min_value": -90.0, "max_value": 90.0', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (11, 'sv_artifactreturntime', 'Automatically return Terminator and Possession Stone in seconds', 'Int', '30', '"min_value": 0', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (12, '__wavelimit', 'Wavelimit', 'Int', '0', '"min_value": 0, "max_value": 255, "zero_name": "Use map setting"', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (13, 'winlimit', 'Winlimit', 'Int', '0', '"min_value": 0, "max_value": 255, "zero_name": "No limit"', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (14, 'sv_dropstyle', 'Dropped item style', 'choice', '0', '"choices": [{"value": 0, "name": "Game default"}, {"value": 1, "name": "As in Doom (?)"}, {"value": 2, "name": "As in Strife"}]', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (15, 'sv_coop_damagefactor', 'Damage factor (dealt to players by monsters) (COOP)', 'Float', '1', '"min_value": 0.0', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (16, 'sv_smartaim', 'Smart Autoaim', 'Choice', '0', '"choices": [{"value": 0, "name": "Off" }, {"value": 1, "name": "On" }, {"value": 2, "name": "Never friends" }, {"value": 3, "name": "Only monsters" }]', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (17, 'splashfactor', 'Splash factor', 'Float', '1', '"min_value": 0.0', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (18, '__sv_gravity', 'Gravity factor', 'Float', '1', '"min_value": 0.0, "step": 0.00125', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (19, 'sv_fastweapons', 'Fast weapons mode', 'Choice', '0', '"choices": [{"value": 0, "name": "No" }, {"value": 1, "name": "Fast (all animation frames are 1 tick)" }, {"value": 2, "name": "Ultra fast (most animation frames are 0 tick)" }]', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (20, 'sv_killallmonsters_percentage', 'Have to kill this percentage of monsters to be able to exit a level', 'Int', '100', '"min_value": 0, "max_value": 100, "zero_name": "Disabled"', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (22, 'sv_maxlives', 'Player lives (SURVIVAL)', 'Int', '0', '"min_value": 0.0, "max_value": 255.0, "zero_name": "Unlimited"', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (23, 'pointlimit', 'Pointlimit', 'Int', '0', '"min_value": 0, "max_value": 65535, "zero_name": "Unlimited"', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (24, 'sv_maxteams', 'Maximum teams', 'Int', '2', '"min_value": 2', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (25, '__falldamage', 'Falling damage', 'Choice', '0', '"choices":[{"value": 0, "name": "Off" }, {"value": 1, "name": "Old" }, {"value": 2, "name": "Hexen" }, {"value": 3, "name": "Strife" }]', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (26, '__sv_exit', 'On attempt to exit level', 'Choice', '0', '"choices": [{"value": 0, "name": "Load next level"} ,{"value": 1, "name": "Restart current level"}, {"value": 2, "name": "Kill anyone who tries (DM)"}]', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (28, '__sv_coop_loseammo', 'Lose ammo when respawning (COOP)', 'Choice', '0', '"choices": [{"value": 0, "name": "No"}, {"value": 1, "name": "All ammo"}, {"value": 2, "name": "Half of your ammo"}]', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (29, '__sv_blockplayers', 'Allow players to block each other', 'Choice', '0', '"choices": [{"value": 0, "name": "Allow everybody"}, {"value": 1, "name": "Nobody"}, {"value": 2, "name": "Not same team"}]', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (30, 'sv_minvoters', 'Require minimal number of voters to call a vote', 'Int', '1', '"min_value": 1, "max_value": 64', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (32, '__countdowntime', 'Countdown time', 'Int', '10', '"min_value": 0, "zero_name": "None"', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (34, '__sv_possessionholdtime', 'Possesion hold time required to score', 'Int', '0', '"min_value": 0, "zero_name": "Map setting"', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (35, 'sv_afk2spec', 'Force inactive players to spectators after N minutes', 'Int', '0', '"min_value": 0, "zero_name": "Disabled"', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (36, 'sv_flagreturntime', 'Automatically return dropped flag in N seconds (CTF)', 'Int', '15', '"min_value": 0', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (37, 'sv_maxclients', 'Max clients', 'Int', '32', '"min_value": 1, "max_value": 64', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (38, 'sv_maxplayers', 'Max active players', 'Int', '32', '"min_value": 1, "max_value": 64', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (40, 'sv_coopspawnvoodoodolls', 'Spawn voodoo dolls (COOP)', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (41, 'sv_coopunassignedvoodoodolls', 'Spawn voodoo dolls for players not in the game (COOP)', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (42, 'sv_unlimited_pickup', 'Unlimited inventory (including ammo)', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (3, 'sv_coopunassignedvoodoodollsfornplayers', 'Spawn voodoo dolls for players not in the game and only for first N players(COOP)', 'Int', '64', '"min_value": 1, "max_value": 64', 2, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (9, 'infighting', 'Monster infighting (except INVASION)', 'Choice', '0', '"choices": [
{"value": "-1", "name": "No infightng" },
{"value": "0", "name": "Normal infightng" },
{"value": "1", "name": "Total infightng" }
]', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (31, 'sv_nocallvote', 'Allow calling a vote', 'Choice', '0', '"choices": [{"value": "0", "name": "Anybody"}, {"value": "1", "name": "Nobody"}, {"value": "2", "name": "Players"}]', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (27, '__sv_jump', 'Jumping', 'Choice', '0', '"choices": [{"value": 0, "name": "Allow by default"}, {"value": 1, "name": "Disallow by default"}, {"value": 2, "name": "Allow always (overrides MAPINFO)"}]', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (21, '__sv_aircontrol', 'Air control factor', 'Float', '1', '"min_value": 0.0', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (43, 'var_friction', 'Enable ice (BOOM friction effects)', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (33, '__maplist', 'Map list for rotation', 'MapList', NULL, NULL, 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (39, '__sv_motd', 'Message of the day', 'String', NULL, NULL, 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (44, 'var_pushers', 'Enable wind (BOOM push/pull effects)', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (45, 'alwaysapplydmflags', 'Apply DM flags for all game modes', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (46, 'instagib', 'Enable Instagib modifier', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (47, 'buckshot', 'Enable Buckshot modifier', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (48, 'sv_suddendeath', 'Sudden death on tie', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (49, 'sv_useteamstartsindm', 'Use team player starts (TDM, TLMS)', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (50, 'sv_randomcoopstarts', 'Use random coops starts (COOP)', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (51, 'lms_allowpistol', 'Allow using pistol (LMS)', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (52, 'lms_allowshotgun', 'Allow using shotgun (LMS)', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (53, 'lms_allowssg', 'Allow using SSG (LMS)', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (54, 'lms_allowchaingun', 'Allow using chaingun (LMS)', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (55, 'lms_allowminigun', 'Allow using minigun (LMS)', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (56, 'lms_allowrocketlauncher', 'Allow using rocket launcher (LMS)', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (57, 'lms_allowgrenadelauncher', 'Allow using grenade launcher (LMS)', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (58, 'lms_allowplasma', 'Allow using plasmagun (LMS)', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (59, 'lms_allowrailgun', 'Allow using railgun (LMS)', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (60, 'lms_allowchainsaw', 'Allow using chainsaw (LMS)', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (61, 'lms_spectatorchat', 'Allow spectators to talk to active players (LMS)', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (62, 'lms_spectatorview', 'Allow spectators to view the game (LMS)', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (63, 'sv_disableautohealth', 'Automatically use Strife health when <50% left (not DM)', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (64, 'forcewater', 'Force water', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (65, 'sv_nohealth', 'Spawn health items (DM)', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (66, 'sv_weaponstay', 'Weapons stay (DM)', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (69, 'sv_noarmor', 'Spawn armor (DM)', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (70, 'sv_infiniteammo', 'Don''t use up ammo when firing', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (71, 'sv_nomonsters', 'Spawn monsters', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (72, 'sv_monsterrespawn', 'Monsters respawn sometime after their death', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (73, 'sv_itemrespawn', 'Respawn items other than invulnerability and invisibility', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (74, 'sv_fastmonsters', 'Monsters are fast', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (75, 'sv_nofreelook', 'Allow freelook', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (76, 'sv_respawnsuper', 'Respawn invulnerability and invisibility', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (77, 'sv_nofov', 'Allow changing FOV', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (78, 'sv_noweaponspawn', 'Spawn multiplayer weapons in coop games', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (79, 'sv_nocrouch', 'Allow crouching', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (80, 'sv_allowcrouch', 'Force allow crouching (overrides MAPINFO)', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (81, 'sv_coop_loseinventory', 'Lose all your old inventory when respawning in coop', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (82, 'sv_coop_losekeys', 'Lose keys when respawning in coop', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (83, 'sv_limitnumvotes', 'Prevent vote flooding', 'Bool', 'true', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (84, 'sv_coop_loseweapons', 'Lose weapons when respawning in coop', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (85, 'sv_coop_losearmor', 'Lose armor when respawning in coop', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (86, 'sv_coop_losepowerups', 'Lose powerups when respawning in coop', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (87, 'sv_weapondrop', 'Drop current weapon upon death', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (88, 'sv_noteamswitch', 'Allow players to switch teams in teamgames', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (89, 'sv_doubleammo', 'Double amount of ammo that items give you like skill 1 and 5 do', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (90, 'sv_degeneration', 'Player slowly loses health when over 100% (Quake-style)', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (91, 'sv_bfgfreeaim', 'Allow BFG freeaiming in multiplayer games.', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (92, 'sv_barrelrespawn', 'Barrels respawn', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (93, 'sv_keepfrags', 'Don''t clear frags after each level', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (94, 'sv_norespawn', 'Players can respawn', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (95, 'sv_losefrag', 'Lose a frag when killed. More incentive to try to not get yerself killed', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (96, 'sv_norespawninvul', 'Respawn invulnerability', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (97, 'sv_samespawnspot', 'Players respawn in the same place they died (co-op)', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (98, 'sv_infiniteinventory', 'Infinite inventory', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (99, 'sv_killallmonsters', 'All monsters must be killed before the level exits.', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (100, 'sv_noautomap', 'Players are allowed to see the automap.', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (101, 'sv_noautomapallies', 'Allies can been seen on the automap.', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (68, 'sv_forcerespawn', 'Force respawn (Automatically respawn dead players after respawn_time is up) (DM)', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (102, 'sv_disallowspying', 'Allow spy on your allies.', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (103, 'sv_chasecam', 'Players can use the chasecam command', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (104, 'sv_disallowsuicide', 'Players are allowed to suicide.', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (105, 'sv_noautoaim', 'Players can use autoaim.', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (106, 'sv_dontcheckammo', 'Don''t Check ammo when switching weapons.', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (107, 'sv_killbossmonst', 'Kills all monsters spawned by a boss cube when the boss dies', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (108, 'sv_norunes', 'Spawn runes', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (109, 'sv_instantreturn', 'Instantly return flags and skulls when player carrying it dies (ST/CTF)', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (110, 'sv_noteamselect', 'Player is automatically placed on a team.', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (111, 'sv_shotgunstart', 'All playres start with a shotgun when they respawn', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (112, 'sv_noidentifytarget', 'Allow client to identify players', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (113, 'sv_applylmsspectatorsettings', 'Force LMS Spectator restrictions in all game modes', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (114, 'sv_nocoopinfo', 'Allow displaying coop info', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (115, 'sv_nomedals', 'Allow displaying medals', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (116, 'sv_sharekeys', 'Share keys between all players', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (117, 'sv_keepteams', 'Players keep teams after a map change', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (118, 'sv_forcegldefaults', 'Enforces some Gl rendering options to their default values', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (119, 'sv_norocketjumping', 'Enable z-momentum of radius attacks (enables rocket jumping)', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (120, 'sv_awarddamageinsteadkills', 'Award actual damage dealt instead of kills', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (121, 'sv_forcealpha', 'Forces clients to display alpha', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (122, 'sv_coop_spactorspawn', 'Spawn map actors in coop as if the game was single player', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (123, 'sv_maxbloodscalar', 'Force blood brightness to max scalar on clients to emulate vanilla screen damage', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (124, 'compat_shortTex', 'Use Doom''s shortest texture around behavior', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (125, 'compat_stairs', 'Use old buggy stair building', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (126, 'compat_limitpain', 'Pain elemental is limited to 20 lost souls', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (127, 'compat_silentpickup', 'Pickups are only heard locally', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (128, 'compat_nopassover', 'Pretend every actor is infinitely tall', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (129, 'compat_soundslots', 'Limit actors to one sound at a time', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (130, 'compat_wallrun', 'Enable buggier wall clipping so players can wallrun', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (131, 'compat_notossdrops', 'Spawn dropped items directly on the floor', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (132, 'compat_useblocking', 'Any special line can block a use line', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (133, 'compat_nodoorlight', 'Don''t do the BOOM local door light effect', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (134, 'compat_ravenscroll', 'Raven''s scrollers use their original carrying speed', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (135, 'compat_soundtarget', 'Use sector based sound target code', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (136, 'compat_dehhealth', 'Limit deh.MaxHealth to the health bonus (as in Doom2.exe)', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (137, 'compat_trace', 'Trace ignores lines with the same sector on both sides', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (138, 'compat_dropoff', 'Monsters cannot move when hanging over a dropoff', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (139, 'compat_boomscroll', 'Scrolling sectors are additive like in Boom', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (140, 'compat_invisibility', 'Monsters can see semi-invisible players', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (141, 'compat_silentinstantfloors', 'Instantly moving floors are not silent', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (142, 'compat_sectorsounds', 'Sector sounds use original method for sound origin', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (143, 'compat_missileclip', 'Use original Doom heights for clipping against projectiles', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (144, 'compat_crossdropoff', 'Monsters can''t be pushed over dropoffs', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (145, 'compat_anybossdeath', 'Any monster which calls BOSSDEATH counts for level specials', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (146, 'compat_minotaur', 'Minotaur''s floor flame is exploded immediately when feet are clipped', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (147, 'compat_mushroom', 'Force original velocity calculations for A_Mushroom in Dehacked mods.', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (148, 'compat_mbfmonstermove', 'Monsters are affected by friction and pushers/pullers.', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (149, 'compat_corpsegibs', 'Crushed monsters are turned into gibs, rather than replaced by gibs.', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (150, 'compat_noblockfriends', 'Friendly monsters aren''t blocked by monster-blocking lines.', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (151, 'compat_spritesort', 'Invert sprite sorting order for sprites of equal distance', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (152, 'compat_hitscan', 'Hitscans use original blockmap and hit check code.', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (153, 'compat_light', 'Find neighboring light level like Doom', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (154, 'compat_polyobj', 'Draw polyobjects the old fashioned way', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (155, 'compat_limited_airmovement', 'Limited movement in the air', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (156, 'compat_plasmabump', 'Allow the map01 "plasma bump"', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (157, 'compat_instantrespawn', 'Allow instant respawn after death', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (158, 'compat_disabletaunts', 'Allow taunts', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (159, 'compat_originalsoundcurve', 'Use doom2.exe''s original sound curve', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (160, 'compat_oldintermission', 'Use doom2.exe''s original intermission screens/music', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (161, 'compat_disablestealthmonsters', 'Allow stealth monsters', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (162, 'compat_oldradiusdmg', 'Always use the old radius damage code (infinite height)', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (163, 'compat_nocrosshair', 'Allow crosshair use', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (164, 'compat_oldweaponswitch', 'Force use the vanilla Doom weapon on pickup behavior', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (165, 'compat_netscriptsareclientside', 'Execute NET scripts on client', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (166, 'compat_clientssendfullbuttoninfo', 'Support all buttons for server-side GetPlayerInput calls (generates more net traffic)', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (167, 'compat_noland', 'Allow ''land'' console command that causes additional speed boost for flying players on landing', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (168, 'compat_oldrandom', 'Use Doom''s random table instead of ZDoom''s random number generator.', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (169, 'compat_nogravity_spheres', 'Disable gravity for Invulnerability, Soulsphere, Megasphere and Invis items', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (170, 'compat_dont_stop_player_scripts_on_disconnect', 'When a player leaves the game, don''t stop any scripts of that player that are still running', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (171, 'compat_explosionthrust', 'Use the horizontal thrust of old ZDoom versions in radius damage attacks', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (172, 'compat_bridgedrops', 'Allow non-SOLID things (like flags) to fall through invisible bridges', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (173, 'compat_oldzdoomzmovement', 'Use old buggy ZDoom jump physics', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (174, 'compat_fullweaponlower', 'Force waiting for weapons change animation to complete', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (175, 'compat_autoaim', 'Use old autoaim (less precise)', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (176, 'compat_silentwestspawns', 'Make west spawns silent', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (177, 'sv_noduellimitvote', 'Allow calling duellimit vote', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (178, 'sv_nofraglimitvote', 'Allow calling fraglimit vote', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (179, 'sv_nokickvote', 'Allow calling kick vote', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (180, 'sv_nopointlimitvot', 'Allow calling pointlimit vote', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (181, 'sv_notimelimitvote', 'Allow calling timelimit vote', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (182, 'sv_nowinlimitvote', 'Allow calling winlimit vote', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (183, 'sv_nomapvote', 'Allow calling map vote', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (184, 'sv_nochangemapvote', 'Allow calling changemap vote', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (185, 'sv_noforcespecvote', 'Allow calling forcespec vote', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (186, 'sv_maprotation', 'Enable map rotation', 'Bool', 'true', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (187, 'sv_randommaprotation', 'Randomize map rotation', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (188, 'sv_disallowbots', 'Enable bots', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (189, 'sv_nokill', 'Allow suicide command', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (190, 'sv_nodrop', 'Allow dropping items', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (191, 'sv_forcerandomclass', 'Force random player class', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (192, 'sv_nounlagged', 'Allow unlagged', 'Bool', 'false', '"show_inverted": true', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (7, 'lobby', 'Lobby map', 'MapChoice', NULL, NULL, 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (67, 'sv_spawnfarthest', 'Spawn farthest (Spawn players as far as possible from other players) (DM)', 'Bool', 'false', '"show_inverted": false', 0, 0);
INSERT INTO cvars (id, name, description, type, default_value, options, section, engine) VALUES (2, 'botskill', 'Botskill', 'choice', '2', '"choices": [{"value": 0, "name": "I want my mommy!" }, {"value": 1, "name": "I''m allergic to pain." }, {"value": 2, "name": "Bring it on." }, {"value": 3, "name": "I thrive off pain." }, {"value": 4, "name": "Nightmare!" }]', 1, 0);


INSERT INTO engines (id, name) VALUES (0, 'zandronum');


INSERT INTO sections (id, name, engine) VALUES (0, 'server', 0);
INSERT INTO sections (id, name, engine) VALUES (1, 'map', 0);
INSERT INTO sections (id, name, engine) VALUES (2, 'gameplay', 0);

ALTER TABLE ONLY cvars
    ADD CONSTRAINT cvars_id PRIMARY KEY (id);

ALTER TABLE ONLY cvars
    ADD CONSTRAINT cvar_section FOREIGN KEY (section) REFERENCES sections(id);

ALTER TABLE ONLY cvars
    ADD CONSTRAINT fkdage06qprqw4sys0wjqsmrmbw FOREIGN KEY (engine) REFERENCES engines(id);

ALTER TABLE ONLY engines
    ADD CONSTRAINT engine_id PRIMARY KEY (id);

ALTER TABLE ONLY cvars
    ADD CONSTRAINT cvars_engine_fkey FOREIGN KEY (engine) REFERENCES engines(id);
ALTER TABLE ONLY sections
    ADD CONSTRAINT section_id PRIMARY KEY (id);

ALTER TABLE ONLY sections
    ADD CONSTRAINT sections_engine_fkey FOREIGN KEY (engine) REFERENCES engines(id);

ALTER TABLE ONLY sections_settings
    ADD CONSTRAINT uk_gtonlxtbp3krly73g4wa4cbv7 UNIQUE (settings_id);

ALTER TABLE ONLY sections_settings
    ADD CONSTRAINT fkcwk0n6fhe71cpqys3pxerondi FOREIGN KEY (setting_sections_entity_id) REFERENCES sections(id);

ALTER TABLE ONLY sections_settings
    ADD CONSTRAINT fkpldvxnleg6jxjpqlfmnmhyi8s FOREIGN KEY (settings_id) REFERENCES cvars(id);
