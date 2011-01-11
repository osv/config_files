# -*- mode: tcl -*-
# voltron config for voltgen.tcl

#=========================================================
# Config file example
# file format
#
# set X.Y. {
#     MenuTextForAll	CommandForAll
#     MenuAlienText	AlienCommands
#     MenuHumText	HumCommands
#     MenuSpecText	SpectatorCommands
# }
# where X, Y is [0-9-=]
# Comnts inside set FOOBAR { .... } not allowed!
#
# You can fill only several menu's texts and command
# Also string substitute available, like other tcl command here
# Uncomment some variable to manual setup 
#=========================================================

#----------------------------------------
# # Chat keys
# # default {1 2 3 4 5 6 7 8 9 0 - =}
# set bind_keys {1 2 3 4 5 6 7 8 9 0 - =}

# #----------------------------------------
# # Chat menu output file for team A
# # default is "chatmenu_alien.cfg"
set chatmenu_teama "~/.tremulous/base/ui/hud/common/chatmenu_alien.cfg"
# #----------------------------------------
# # Chat menu output file for team B
# # default is "chatmenu_human.cfg"
set chatmenu_teamb "~/.tremulous/base/ui/hud/common/chatmenu_human.cfg"

# #----------------------------------------
# # Chat menu output file for spectator
# # default is "chatmenu_spec.cfg"
set chatmenu_spect "~/.tremulous/base/ui/hud/common/chatmenu_spec.cfg"

# #----------------------------------------
# # Main chat menu exec script.
# # default is "chatmenu_install.cfg"
set binds_install "~/.tremulous/base/ui/hud/common/chatmenu_install.cfg"
#
# #   File will contain key binds for all teams.  This may be not good
# # if you  have different  command for different  teams like  say "Om
# # down" for teamA(alien) and "RC down" for teamB(human). If you exec
# # this script  and run key that  provide "say Om down"  you will see
# # both message  "Om down" and "RC  down".  To prevent  this you need
# # load different  binds set  (team specified) when  you join/un-join
# # team or just  don't use team specified binds.   Below is variables
# # for team specified chat menu commands:
# 
# # - team A binds_teama_install (default is "chatmenu_alien_install.cfg")
# set binds_teama_install "chatmenu_alien_install.cfg"
# # -team B binds_teamb_install (default is "chatmenu_human_install.cfg")
# set binds_teamb_install "chatmenu_human_install.cfg"
# # - team spectator binds_teamb_install (default is "chatmenu_spect_install.cfg")
# set binds_spect_install "chatmenu_spect_install.cfg"
set binds_teama_install "~/.tremulous/base/ui/hud/common/chatmenu_alien_install.cfg"
set binds_teamb_install "~/.tremulous/base/ui/hud/common/chatmenu_human_install.cfg"
set binds_spect_install "~/.tremulous/base/ui/hud/common/chatmenu_spect_install.cfg"

# #----------------------------------------
# # Template for menu. You may set different for all teams:
# # menu_alien_tmpl, menu_human_tmpl and menu_spectator_tmpl
# # Example:
# set menu_spectator_tmpl "    rect 6 210 400 190
#     visible 1
#     decoration
#     forecolor 45 45 45 1
#     textscale 0.25
#     autowrapped
#     textstyle ITEM_TEXTSTYLE_SHADOWED
#     cvartest cg_chatmenu"

# #----------------------------------------
# # BACKSPACE additional command
# # default "play sound/misc/menu4.wav"
# set backspace_cmd "play sound/misc/menu4.wav"

set snd_menuoff sound/misc/menu3
set snd_menuon  sound/misc/menu1.wav
set prefix ^3.oO(^5
set sufix ^3)

set 1. {
    {^2 ^2}		{play $snd_menuon}
    {Evolve "Evolve to:"} {}
    {Buy "Buy:"} {}
}
set 1.1. {  
    ""			{play $snd_menuoff}
    "Dretch"		{class level0}
    "^5Construction Kit" {sell weapons;sell upgrades;class ckit; buy ackit; buy ckit;itemact ackit;itemact ckit}
}
set 1.2. {
    ""			{play $snd_menuoff}
    Basilisk		{class level1}
    Rifle		{sell weapons;sell weapons;class rifle; buy rifle;itemact rifle}
}
set 1.3. {
    ""			{play $snd_menuoff}
    "Adv. Basilisk"	{class level1upg}
    "Pain Saw"		{sell weapons;sell weapons;buy psaw;itemact psaw}
}
set 1.4. { 
    ""			{play $snd_menuoff}
    Marauder		{class level2}
    Shotgun		{sell weapons;sell weapons;buy shotgun;itemact shotgun}
}
set 1.5. {
    ""			{play $snd_menuoff}
    "Adv. Marauder"	{class level2upg}
    "Las Gun"		{sell weapons;sell weapons;buy lgun;itemact lgun;buy battpack}
}

set 1.6. {
    ""			{play $snd_menuoff}
    Dragoon		{class level3}
    "Mass Driver"	{sell weapons;sell weapons;buy mdriver;itemact mdriver;buy battpack}
}
    
set 1.7. {
    {^6}		{play $snd_menuoff}
    "Adv. Dragoon"	{class level3upg}
    "Chaingun"		{sell weapons;sell weapons;buy chaingun;itemact chaingun}
}

set 1.8. {
    "^1"		{play $snd_menuoff}
    Tyrant		{class level4}
    "Pulse Rifl"	{sell weapons;sell weapons;buy prifle;itemact prifle;buy battpack}
}
set 1.9. {
    ""			{play $snd_menuoff}
    {^3Adv goon, asssum} {class level3upg; vstr AlienJoin}
    ^1Flamethrower	{sell weapons;sell weapons;buy flamer;itemact flamer}
}


set 1.0. {
    ""			{play $snd_menuoff}
    "^3Tyrant, asssum"	{class level4;vstr AlienJoin}
    "^1Lucifer Cannon"	{sell weapons;sell weapons;buy lcannon;itemact lcannon;buy battpack}
}
set 1.-. {
    ""			{play $snd_menuoff}
    {}			{}
    "^5Jet Pack"	{sell battpack;sell bsuit;buy helmet;buy larmour;buy jetpack}
}
set 1.=. {
    ""			{play $snd_menuoff}
    {}			{}
    ^5Battlesuit	{sell larmour; sell helmet; sell battpack; sell jetpack; buy bsuit}
}

set 2. {{^3Response "^3Send Response:"} {play $snd_menuon} }
set 2.1. {^3Yes "say_team ${prefix}Yes${sufix}" }
set 2.2. {^3No "say_team ${prefix}No${sufix}" }
set 2.3. {^3Thanks "say_team ${prefix}Thanks${sufix}" }
set 2.4. {^3Sorry "say_team ${prefix}Sorry!${sufix}" }
set 2.5. {^3Oops "say_team ${prefix}Oops${sufix}" }
set 2.6. {"^1I'm attacking" "say_team ${prefix}I'm attacking${sufix}"}
set 2.7. {"^2I'm defending" "say_team ${prefix}I'm defending${sufix}"}
set 2.8. {"^5I'm building" "say_team ${prefix}I'm building${sufix}"}
set 2.9. {^3Grenade "say_team ${prefix}Grenade!${sufix}"}
set 2.0. {^3Incoming "say_team ${prefix}Human incoming!${sufix}"}
set 2.-. {^3Flank "say_team ${prefix}Flank!${sufix}"}
set 2.=. {"Where to?" "say_team ${prefix}Where to?${sufix}"}

set 3. {{^3Order "^3Send Order:"}	{play $snd_menuon} }
set 3.1. {"^3I need backup!"	"say_team ${prefix}I need backup!${sufix}"}
set 3.2. {"^5We need builders"	"say_team ${prefix}We need builders!${sufix}"}
set 3.3. {"^3We need spawns"	"say_team ${prefix}We need spawns!${sufix}"}
set 3.4. {"^3We need to regroup"	"say_team ${prefix}We need to regroup!${sufix}"}
set 3.5. {"^3Follow me"		"say_team ${prefix}Follow me!${sufix}"}
set 3.6. {"^1Attack"		"say_team ${prefix}Attack!${sufix}"}
set 3.7. {"^2Defend our base"	"say_team ${prefix}Defend our base!${sufix}"}
set 3.8. {"^3Stay alive"		"say_team ${prefix}Stay alive!${sufix}"}
set 3.9. {"^3Hold back"		"say_team ${prefix}Hold back!${sufix}"}
set 3.0. {"^3Clear the path"	"say_team ${prefix}Clear the path!${sufix}"}
set 3.-. {
    {} {}
    "Enemy telenode down"	"say_team ${prefix}Enemy TELENODE down${sufix}"
    "Enemy egg down"		"say_team ${prefix}Enemy EGG down${sufix}"
}
set 3.=. {
    {} {}
    "Enemy Reactor down"	"say_team ${prefix}Enemy Reactor down${sufix}"
    "Enemy Overmind down"	"say_team ${prefix}Enemy Overmind down${sufix}"
}

set 4. { {^6Build "^6Build:"} {play $snd_menuon} }
set 4.1. { {^5} {}
    Egg				"build eggpod"
    Telenode			"build telenode"}

set 4.2. { {^5} {}
    Overmind			"build overmind"
    Reactor			"build reactor"}

set 4.3. { {^2} {}
    Booster			"build booster"
    Armory			"build arm"}

set 4.4. { {} {}
    "Acid Tube"			"build acid_tube"
    Turret			"build mgturret"}

set 4.5. { {} {}
    Trapper			"build trapper"
    Medistation			"build medistat"}

set 4.6. { {} {}
    Hive			"build hive"
    "Defence Computer"		"build dcc"}

set 4.7. { {} {}
    Barricade			"build barricade"
    Tesla			"build tesla"}
set 4.8. { {} {}
    Repeater			"build repeater"
    Hovel			"build hovel"
}
 
set 5. {{Admin "Admin:"}	{play $snd_menuon} }
set 5.1. {"!namelog"		"!namelog;toggleconsole"}
set 5.2. {"!buildlog humans"	"!buildlog h;toggleconsole"}
set 5.3. {"!buildlog aliens"	"!buildlog a;toggleconsole"}
set 5.4. {!pause			"!pause 0"}
set 5.5. {!listplayers		"!listplayers;toggleconsole"}
#set 5.6. {!allready		"!allready"}
set 5.7. {!spec999		"!spec999"}
#set 5.8. {"!lock aliens"		"!lock a;vstr menu0"}
#set 5.9. {"!lock humans"		"!lock h;vstr menu0"}
#set 5.0. {!passvote		"!passvote"}
#set 5.-. {!cancelvote		"!cancelvote"}
#set 5.=. {!unlockteams		"!unlock h;!unlock a;vstr menu0"}

set 6. {{"^3Base state" "^3Base state:"} {play $snd_menuon}}
set 6.5. { {} {}
    "^1OM 50 percent"		{say_team ${prefix}Our ^1OM^5: \[==========>__________\] 50 perc${sufix}}
    "^1RC 50 percent"		{say_team ${prefix}Our ^1RC^5: \[==========>__________\] 50 perc${sufix}}
}
set 6.6. {
    "Base: ^3Low danger" {say_team ${prefix}Base under attack: ^3Low danger${sufix}}
}
set 6.7. { {} {}
    "^3OM 75 percent"	{say_team ${prefix}Our ^1OM^5: \[===============>_____\] 75 perc${sufix}}
    "^3RC 75 percent"	{say_team ${prefix}Our ^1RC^5: \[===============>_____\] 75 perc${sufix}}
}
set 6.8. {
    "Base: ^1High danger" {say_team ${prefix}Base under attack: ^1HIGH DANGER${sufix}}
}
set 6.0. {
    "Base: ^5Clear" {say_team ${prefix}Base clear${sufix}}
}

set 7. {{"^3Tactic" "^3Tactic group:"}	{play $snd_menuon}}
set 7.1. {"^3Tunel/vent"		{say_team ${prefix}Tunel/Vent${sufix}} }
set 7.2. {"^3Front"			{say_team ${prefix}Front${sufix}} }
set 7.7. {"^3Cover me!"			{say_team ${prefix}Cover me!${sufix}} }
set 7.8. {"^3I cover you!"		{say_team ${prefix}I cover you${sufix}} }

set 0. {{^1Join "^1Join:"}		{play $snd_menuon} }
set 0.1. {Alien		{team aliens;exec ui/hud/common/chatmenu_alien_install.cfg;play $snd_menuoff}}
set 0.2. {Human		{team humans;exec ui/hud/common/chatmenu_human_install.cfg;play $snd_menuoff}}
set 0.3. {Spectate	{team spectate;exec ui/hud/common/chatmenu_spect_install.cfg;play $snd_menuoff}}


set 9. {{Messages "Messages:"}	{play $snd_menuon} }
set 9.9. { {} {}
    "Alien fuck hums :P"  "vstr AlienJoking"
    
}
set 9.1. { {} {}
    "RELEASING CONTROL." "say ${prefix}^1RELEASING CONTROL.${sufix}"
}

set 9.0. { {} {}
    "^1HUMAN, YOU HAVE CHANGED NOTHING..." "say ^1HUMAN, YOU HAS CHANGED NOTHING."
}
set 9.-. { {} {}
    "^1...WE IS YOUR SALVATION THRU DIS-TRUC-SHUN" "say ^1WE IS YOUR SALVATION THRU DIS-TRUC-SHUN. YOU HAVE FAILED! WE SHALL FIND ANOTHER WAY."
}


# spawn as builder
bindTeams INS {
    {echo ^1Spawn as builder;play $snd_menuoff}
    {class builderupg;class builder}
    {class ackit; class ckit;sell weapons;sell upgrades;buy ackit; buy ckit;itemact ackit;itemact ckit;buy larmour; buy helmet}
    {echo ^1You are spectate}
}

# spawn and buy/evolve my best 
bindTeams DEL {
    {echo ^1Spawn as solder;play $snd_menuoff}
    {class level0; class level3upg}
    {class rifle; sell weapons; sell upgrades; buy prifle; itemact prifle; buy larmour; buy battpack; buy helmet}
    {echo ^1You are spectate}
}

# unbind v key
unbind v
#==============================================
# Key binds
#==============================================
bind j "itemtoggle jetpack"

# Sell armour, suit, grenade, etc
bind l "sell upgrades;buy ammo"
# light armor + helmet + battery
bind LEFTARROW "echo Battery Pack & Armour;sell bsuit;sell jetpack;buy battpack;buy larmour;buy helmet" 
# prev, but without battery
bind DOWNARROW "echo Helmet and Light Armour;sell upgrades;buy ammo;buy larmour;buy helmet"
# battlesuit
bind RIGHTARROW "echo Battlesuit;sell upgrades;buy bsuit;buy ammo"
# jet
bind UPARROW "echo Jetpack & Armour;sell bsuit;sell battpack;buy jetpack;buy helmet;buy larmour;buy ammo"

bind F3 "say_team ^3.oO(^5Sorry^3)"
bind F4 "say_team ^3.oO(^5Confirmed. Applied your order^3)"
bind F9 "say  ^1\\o/ ^3.oO(^2Hi^3)"
bind F10 "say ^1-O-"
bind F11 "say ^1/ \\ "
bind F12 "screenshotJPEG"

bind home "say ^3.oO(^1emergy reconnecting^3); reconnect"

# swap shift and x key, more optimal for me:)
bind x "+speed"
bind SHIFT "boost"
bind CTRL "+speed"

# fuck, I'm sometimes decon rc, fuckit e key to p key! 
# e good too togle blaster for me now
bind e "itemtoggle blaster"
bind p "deconstruct"
bind k "buy gren"
bind g "itemact medkit"

#==============================================
# KP_* keys
#==============================================
bind KP_PLUS "say ^3.oO(^1Burn ^3heretics^1!^3)"
# special for funserver, buy and activate grenade
bind KP_ENTER "echo ^1Grenade;buy gren;itemact gren"
# my name
bind KP_DEL "seta name ^4O^3lexandr^6@^1FreeBSD"
# my lsd-name
bind KP_DOWNARROW "name ^3O^7l^6e^3x^7a^3n^5n^6d^7r^1!"
# Joking. Petrosyan will cry blood
bind KP_MINUS "say ^3.oO(^2xD^3)"
bind KP_END "say_team ^3.oO(^1Meat ^5incoming^3)" ; # Meat incoming, Yeah freshmeat
# some from my panteon of gods
bind KP_HOME "say ^3.oO(^2There is no god except ^3H^1a^4r^2u^3h^7i^2 and ^3Kyon ^2is her messenger^3)"
bind KP_UPARROW "say ^3.oO(^3H^1a^4r^2u^3h^7i^2 akbar^1!^3)"
bind KP_PGUP "say ^3.oO(^2Good game, ^3H^1a^4r^2u^3h^7i^2 would be satisfied^3)"
bind KP_PGDN "say ^3.oO(^2Plain game, if ^3H^1a^4r^2u^3h^7i^2 saw this game, she'd  ^1overload world^2, make next game more fun^1!^3)"
# bind KP_LEFTARROW "say ^3.oO(^4T^3his ^6is ^1SPARTAAA!^3)"
bind KP_LEFTARROW "say ^3.oO(^2When I come you, you will shit bricks!^3)"
bind KP_RIGHTARROW "say ^4G^1o^3oooooo^4g^2l^1e ^4e^1a^3t ^3y^2o^1u^3!"
# bind KP_HOME "say ^3.oO( ^1This ..^3)"
# bind KP_UPARROW "say ^3.oO( ^1..is..  ^3)"
# bind KP_PGUP "say ^3.oO( ^1... SPARTA!!! ^3)"

seta cg_drawdot "1"
seta cg_drawscanner "2"
seta cg_drawacross "2"
seta cg_alienxhair "2"
seta cg_drawstagereport "1"
seta cg_draw_usable "1"
seta cg_consolesize "big"
seta cg_drawfullscreenboost "0"
seta cg_mappreviewbox "1"
seta s_musicvolume "0.245"
seta s_volume "1.000000"
seta cg_background "3"
seta cg_loading "1"
seta cg_flashlight "0"
seta cg_flashlightx "0"
seta cg_alienhealthbar "1"
seta cg_humanhealthbar "1"
seta cg_teamscore "volt"
seta cg_lagometer "1"
seta r_flares "1"
seta cl_allowDownload "1"
seta cg_disableWarningDialogs "1"
seta cg_wwToggle 1                ;# Wall Walk Toggle
seta cg_wwFollow 0                ;# Wall Walk Auto Pitching

#==============================================
# Message lists
# Make sure that text files exist in this 
# config file's directory
#==============================================

messages-from-file AlienJoking \
    "Alien.txt"\
    "~/.tremulous/base/ui/hud/common/msg/alien.cfg" \
    ui/hud/common/msg/alien.cfg \
    $prefix^1 $sufix

# join msg for ali
messages-from-file AlienJoin \
    "AlienJoin.txt"\
    "~/.tremulous/base/ui/hud/common/msg/alienjoin.cfg" \
    ui/hud/common/msg/alienjoin.cfg \
    $prefix^1 $sufix

