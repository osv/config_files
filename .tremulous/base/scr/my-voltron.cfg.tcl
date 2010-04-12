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
    {}			{play $snd_menuon}
    {Evolve "Evolve to:"} {}
    {Buy "Buy:"} {}
}
set 1.1. {  
    ""			{play $snd_menuoff}
    "Dretch"		{class level0}
    "Construction Kit"	{sell weapons;sell upgrades;class ckit; buy ackit; buy ckit;itemact ackit;itemact ckit}
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
    {}			{play $snd_menuoff}
    "Adv. Dragoon"	{class level3upg}
    "Chaingun"		{sell weapons;sell weapons;buy chaingun;itemact chaingun}
}

set 1.8. {
    ""			{play $snd_menuoff}
    Tyrant		{class level4}
    "Pulse Rifl"	{sell weapons;sell weapons;buy prifle;itemact prifle;buy battpack}
}
set 1.9. {
    ""			{play $snd_menuoff}
    {Adv goon, asssum}	{class level3upg; vstr AlienJoin}
    Flamethrower	{sell weapons;sell weapons;buy flamer;itemact flamer}
}


set 1.0. {
    ""			{play $snd_menuoff}
    Tyrant		{class level4;vstr AlienJoin}
    "Lucifer Cannon"	{sell weapons;sell weapons;buy lcannon;itemact lcannon;buy battpack}
}
set 1.-. {
    ""			{play $snd_menuoff}
    {}			{}
    "Jet Pack"		{sell battpack;sell bsuit;buy helmet;buy larmour;buy jetpack}
}
set 1.=. {
    ""			{play $snd_menuoff}
    {}			{}
    Battlesuit		{sell larmour; sell helmet; sell battpack; sell jetpack; buy bsuit}
}

set 2. {{Response "Send Response:"} {play $snd_menuon} }
set 2.1. {Yes "say_team ${prefix}Yes${sufix}" }
set 2.2. {No "say_team ${prefix}No${sufix}" }
set 2.3. {Thanks "say_team ${prefix}Thanks${sufix}" }
set 2.4. {Sorry "say_team ${prefix}Sorry!${sufix}" }
set 2.5. {Oops "say_team ${prefix}Oops${sufix}" }
set 2.6. {"I'm attacking" "say_team ${prefix}I'm attacking${sufix}"}
set 2.7. {"I'm defending" "say_team ${prefix}I'm defending${sufix}"}
set 2.8. {"I'm building" "say_team ${prefix}I'm building${sufix}"}
set 2.9. {Grenade "say_team ${prefix}Grenade!${sufix}"}
set 2.0. {Incoming "say_team ${prefix}Human incoming!${sufix}"}
set 2.-. {Flank "say_team ${prefix}Flank!${sufix}"}
set 2.=. {"Where to?" "say_team ${prefix}Where to?${sufix}"}

set 3. {{Order "Send Order:"}	{play $snd_menuon} }
set 3.1. {"I need backup!"	"say_team ${prefix}I need backup!${sufix}"}
set 3.2. {"We need builders"	"say_team ${prefix}We need builders!${sufix}"}
set 3.3. {"We need spawns"	"say_team ${prefix}We need spawns!${sufix}"}
set 3.4. {"We need to regroup"	"say_team ${prefix}We need to regroup!${sufix}"}
set 3.5. {"Follow me"		"say_team ${prefix}Follow me!${sufix}"}
set 3.6. {"Attack"		"say_team ${prefix}Attack!${sufix}"}
set 3.7. {"Defend our base"	"say_team ${prefix}Defend our base!${sufix}"}
set 3.8. {"Stay alive"		"say_team ${prefix}Stay alive!${sufix}"}
set 3.9. {"Hold back"		"say_team ${prefix}Hold back!${sufix}"}
set 3.0. {"Clear the path"	"say_team ${prefix}Clear the path!${sufix}"}
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

set 4. { {Build "Build:"} {play $snd_menuon} }
set 4.1. { {} {}
    Egg				"build eggpod"
    Telenode			"build telenode"}

set 4.2. { {} {}
    Overmind			"build overmind"
    Reactor			"build reactor"}

set 4.3. { {} {}
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
set 5.6. {!allready		"!allready"}
set 5.7. {!spec999		"!spec999"}
set 5.8. {"!lock aliens"		"!lock a;vstr menu0"}
set 5.9. {"!lock humans"		"!lock h;vstr menu0"}
set 5.0. {!passvote		"!passvote"}
set 5.-. {!cancelvote		"!cancelvote"}
set 5.=. {!unlockteams		"!unlock h;!unlock a;vstr menu0"}

set 6. {{"Base state" "Base state:"} {play $snd_menuon}}
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

set 7. {{"Tactic" "Tactic group:"}	{play $snd_menuon}}
set 7.1. {"Tunel/vent"			{say_team ${prefix}Tunel/Vent${sufix}} }
set 7.2. {"Front"			{say_team ${prefix}Front${sufix}} }
set 7.7. {"Cover me!"			{say_team ${prefix}Cover me!${sufix}} }
set 7.8. {"I cover you!"		{say_team ${prefix}I cover you${sufix}} }

set 0. {{^1Join "^1Join:"}		{play $snd_menuon} }
set 0.1. {Alien		{team aliens;exec ui/hud/common/chatmenu_alien_install.cfg;play $snd_menuoff}}
set 0.2. {Human		{team humans;exec ui/hud/common/chatmenu_human_install.cfg;play $snd_menuoff}}
set 0.3. {Spectate	{team spectate;exec ui/hud/common/chatmenu_spect_install.cfg;play $snd_menuoff}}


set 9. {{Messages "Messages:"}	{play sound/misc/menu1.wav} }
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

set postInstall "$postInstall

unbind v
"

bind j "itemtoggle jetpack"

# Sell armour, suit, grenade, etc
bind l "sell upgrades;buy ammo"
bind KP_ENTER "echo ^1Grenade;buy gren;itemact gren"
bind LEFTARROW "echo Battery Pack & Armour;sell bsuit;sell jetpack;buy battpack;buy larmour;buy helmet" 
bind DOWNARROW "echo Helmet and Light Armour;sell upgrades;buy ammo;buy larmour;buy helmet"
bind RIGHTARROW "echo Battlesuit;sell upgrades;buy bsuit;buy ammo"
bind UPARROW "echo Jetpack & Armour;sell bsuit;sell battpack;buy jetpack;buy helmet;buy larmour;buy ammo"

bind F3 "say_team ^3.oO(^5Sorry^3)"
bind F4 "say_team ^3.oO(^5Confirmed. Applied your order^3)"
bind F9 "say  ^1\\o/ ^3.oO(^2Hi^3)"
bind F10 "say ^1-O-"
bind F11 "say ^1/ \\"
bind F12 "screenshotJPEG"


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

