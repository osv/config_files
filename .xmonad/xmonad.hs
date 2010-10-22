-- -*-coding: utf-8 -*-
--
-- xmonad config file.
-- 
-- by Olexandr Sydowrchuk
--
-- This config is based on rtalreja's xmonad.hs:
-- http://www.haskell.org/haskellwiki/Xmonad/Config_archive/rtalreja%27s_xmonad.hs 

-- Import XMonad core, but we will use (|||) from LayoutCombinators
import XMonad hiding ( (|||) )
--import XMonad
import System.Exit
 
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
 
-- GHC hierarchical libraries
import XMonad.Operations
import XMonad.Config
import XMonad.Util.Run
import System.IO
import Data.Ratio ((%))
 
--Contribs
import XMonad.Actions.CopyWindow
import XMonad.Actions.CycleWS
import XMonad.Actions.NoBorders
import XMonad.Actions.DynamicWorkspaces
import XMonad.Actions.WindowGo

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.FadeInactive
 

-- import XMonad.Layout
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Accordion
import XMonad.Layout.Grid
import XMonad.Layout.IM
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Tabbed
import XMonad.Layout.Circle
import XMonad.Layout.Spiral
import XMonad.Layout.Magnifier
import XMonad.Layout.MagicFocus
import XMonad.Layout.WindowNavigation
import XMonad.Layout.Named -- want to set custom layout names


-- prompt
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.Ssh
import XMonad.Prompt.Window
import XMonad.Prompt.RunOrRaise
 
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "xterm"
 
-- Width of the window border in pixels.
--
myBorderWidth   = 1
 
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask	= mod4Mask
altMask 	= mod1Mask 
myNumlockMask   = mod2Mask
 
-- The default number of workspaces (virtual screens) and their names.
--
myWorkspaces    = ["term","web","emacs","media","im", "6", "7", "8"]
 
-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#212121"
myFocusedBorderColor = "#00cdcd"

myTheme :: Theme
myTheme = defaultTheme
          { activeColor = lightBackgroundColor
          , inactiveColor = backgroundColor
--          , urgentColor = backgroundColor
          , activeBorderColor = textColor
          , inactiveTextColor = textColor
          , urgentTextColor = textColor
          , inactiveBorderColor = lightBackgroundColor
          , urgentBorderColor = backgroundColor
          , activeTextColor = lightTextColor
          , fontName = myFont
          , decoHeight = 14
          }

myXPConfig :: XPConfig
myXPConfig = defaultXPConfig
             {
               font        = myFont
             , bgColor     = backgroundColor
             , fgColor     = textColor
             , fgHLight    = lightTextColor
             , bgHLight    = lightBackgroundColor
             , borderColor = borderBackgroundColor
             }

myFont = "-*-terminus-bold-r-normal-*-12-*-*-*-*-*-*-*"

focusColor = "#670000"
textColor = "#a0a0cd"
lightTextColor = "#ffffff"
backgroundColor = "#000000"
lightBackgroundColor = "#670000"
urgentColor = "#ffc000"
borderBackgroundColor = "#ff8e43"

------------------------------------------------------------------------
-- Key bindings
--
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
 
    -- launch a terminal
    [ ((modMask,                xK_space), spawn $ XMonad.terminal conf)

    -- DynamicWorkspaces
    , ((modMask .|. altMask, xK_r      ), renameWorkspace defaultXPConfig)

 
    -- MPC stuff
    , ((modMask .|. altMask,	xK_n	), spawn "mpc next")
    , ((modMask .|. altMask,	xK_p	), spawn "mpc prev")
    , ((modMask,		xK_semicolon	), spawn "mpc toggle")
    , ((modMask .|. shiftMask,	xK_semicolon	), spawn "mpc play")
    , ((modMask,                xK_KP_Add       ), spawn "mpc volume +5")
    , ((modMask,                xK_KP_Subtract  ), spawn "mpc volume -5")
 
    -- launch gmrun
    , ((modMask,		xK_F1	), spawn "gmrun")

    -- PROMPT RUN & RISE
    -- Run: Mod + Shift + key
    -- Rise: Mod + key
    --  Where Keys:
    --   p - prompt
    --   e - emacs
    --   f - firefox
    --   m - firefox
    , ((modMask,                xK_p    ), runOrRaisePrompt myXPConfig)
    , ((modMask .|. shiftMask,  xK_p    ), shellPrompt myXPConfig)
    , ((modMask,                xK_f    ), raise (className =? "Firefox"))
    , ((modMask .|. shiftMask,  xK_f    ), runOrRaise "firefox" (className =? "Firefox"))
    , ((modMask,                xK_e    ), raise (className =? "Emacs"))
    , ((modMask .|. shiftMask,  xK_e    ), runOrRaise "emacs" (className =? "Emacs"))

    , ((modMask,                xK_m    ), raise (className =? "MPlayer"))
    , ((modMask .|. shiftMask,  xK_m    ), runOrRaise "gmplayer" (className =? "MPlayer"))

    , ((modMask .|. shiftMask,  xK_w    ), windowPromptGoto
                                         defaultXPConfig { autoComplete = Just 500000 } )

    , ((modMask .|. shiftMask,  xK_b    ), windowPromptBring defaultXPConfig)

    , ((modMask .|. shiftMask,  xK_s    ), sshPrompt myXPConfig)
    -- close focused window
    , ((modMask .|. shiftMask,  xK_x    ), kill)
  
    -- Resize viewed windows to the correct size
    , ((modMask,                xK_n    ), refresh)
 
    -- Move focus to the next window
    , ((modMask,                xK_Tab   ), windows W.focusDown )
    , ((modMask,                xK_j     ), windows W.focusDown )
 
    -- Move focus to the previous window
    , ((modMask .|. shiftMask,  xK_Tab   ), windows W.focusUp )
    , ((modMask,                xK_k     ), windows W.focusUp )
 
    -- Move focus to the master window
    , ((modMask,                xK_m     ), windows W.focusMaster  )
 
    -- Swap the focused window and the master window
    , ((modMask .|. shiftMask,  xK_m     ), windows W.swapMaster)
 
    -- Swap the focused window with the next window
    , ((modMask .|. shiftMask,  xK_j     ), windows W.swapDown  )
 
    -- Swap the focused window with the previous window
    , ((modMask .|. shiftMask,  xK_k     ), windows W.swapUp    )
 
    -- Shrink the master area
    , ((modMask,                xK_h     ), sendMessage Shrink)
 
    -- Expand the master area
    , ((modMask,                xK_l     ), sendMessage Expand)
 
    -- Push window back into tiling
    , ((modMask,                xK_t     ), withFocused $ windows . W.sink)
 
    -- Increment the number of windows in the master area
    , ((modMask,                xK_comma ), sendMessage (IncMasterN 1))
 
    -- Deincrement the number of windows in the master area
    , ((modMask,                xK_period), sendMessage (IncMasterN (-1)))
 
    -- toggle the status bar gap
    , ((modMask,                xK_b     ), sendMessage ToggleStruts)
 
    -- Quit xmonad (Default)
    , ((modMask .|. shiftMask,  xK_q     ), io (exitWith ExitSuccess))
 
    -- Restart xmonad
    , ((modMask .|. shiftMask,  xK_r     ),
          broadcastMessage ReleaseResources >> restart "xmonad" True)
    ]
    ++
 
    --
    -- mod-[1..6], Switch to workspace N
    -- mod-shift-[1..8], Move client to workspace N
    -- mod-control-shift-[1..68, Copy client to workspace N
    --
   [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1, xK_2, xK_3, xK_4, xK_5, xK_6, xK_7, xK_8  ]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask), (copy, controlMask .|. shiftMask)]]
    ++
    --
    -- mod-{u,i}, Switch to {prev,next} workspace
    -- mod-shift-{u,i}, Move client and shift to {prev,next} workspace
    -- Requires Xmonad.Actions.CycleWS
    --
    [
     ((modMask  		, xK_u	  ), prevWS)
    ,((modMask                  , xK_i	  ), nextWS)
    ,((modMask                  , xK_Left ), prevWS)
    ,((modMask                  , xK_Right), nextWS)

    ,((modMask .|. shiftMask	, xK_u	  ), shiftToPrev >> prevWS)
    ,((modMask .|. shiftMask	, xK_i	  ), shiftToNext >> nextWS)
    ,((modMask  		, xK_Left ), prevWS)
    ,((modMask          	, xK_Right), nextWS)
    ,((modMask .|. shiftMask	, xK_Left ), shiftToPrev >> prevWS)
    ,((modMask .|. shiftMask	, xK_Right), shiftToNext >> nextWS)]
    ++
    -- Layout binds
    [
    -- jump to layout
    -- Rotate through the available layout algorithms
    ((modMask,                  xK_Return ), sendMessage NextLayout)
    --  Reset the layouts on the current workspace to default
    , ((modMask .|. shiftMask,  xK_Return ), setLayout $ XMonad.layoutHook conf)
    -- mod-C-t Tabbed 
    -- mod-C-l Tall 
    -- mod-C-f Full
    -- mod-C-a Accordion
    -- mod-C-c Circle
    -- mod-C-r spiral
    -- mod-C-s simple float
    , ((modMask .|. controlMask, xK_t), sendMessage $ JumpToLayout "Tabbed Simplest")
    , ((modMask .|. controlMask, xK_l), sendMessage $ JumpToLayout "Tall")
    , ((modMask .|. controlMask, xK_f), sendMessage $ JumpToLayout "Full")
    , ((modMask .|. controlMask, xK_a), sendMessage $ JumpToLayout "Accordion")
    , ((modMask .|. controlMask, xK_g), sendMessage $ JumpToLayout "Grid")
    , ((modMask .|. controlMask, xK_c), sendMessage $ JumpToLayout "Circle")
    , ((modMask .|. controlMask, xK_r), sendMessage $ JumpToLayout "Spiral")
    , ((modMask .|. controlMask, xK_s), sendMessage $ JumpToLayout "Simple Float")
    , ((modMask .|. controlMask, xK_3), sendMessage $ JumpToLayout "Combo 3")
    , ((modMask .|. controlMask, xK_d), sendMessage $ JumpToLayout "Dbl Tabb")
    , ((modMask .|. controlMask, xK_i), sendMessage $ JumpToLayout "IM grid")
    -- windowNavigation
    , ((modMask .|. altMask,                 xK_Right), sendMessage $ Go R)
    , ((modMask .|. altMask,                 xK_Left ), sendMessage $ Go L)
    , ((modMask .|. altMask,                 xK_Up   ), sendMessage $ Go U)
    , ((modMask .|. altMask,                 xK_Down ), sendMessage $ Go D)
    , ((modMask .|. controlMask,             xK_Right), sendMessage $ Swap R)
    , ((modMask .|. controlMask,             xK_Left ), sendMessage $ Swap L)
    , ((modMask .|. controlMask,             xK_Up   ), sendMessage $ Swap U)
    , ((modMask .|. controlMask,             xK_Down ), sendMessage $ Swap D)
    , ((modMask .|. shiftMask .|. controlMask, xK_Right), sendMessage $ Move R)
    , ((modMask .|. shiftMask .|. controlMask, xK_Left ), sendMessage $ Move L)
    , ((modMask .|. shiftMask .|. controlMask, xK_Up   ), sendMessage $ Move U)
    , ((modMask .|. shiftMask .|. controlMask, xK_Down ), sendMessage $ Move D)
    ]
 
 
------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
 
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w))
 
    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2), (\w -> focus w >> windows W.swapMaster))
 
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w))
 
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]
 
------------------------------------------------------------------------
-- Layouts:

comboLayout = windowNavigation ( 
                 named "Combo 3" (tabs **||*** main ***||** rst) 
                               )
    where
      tabs = tabbed shrinkText myTheme -- tabs win
      main  = Tall 0 (3/100) (1/2) --  main windows
      rst = Tall 0 (3/100) (1/2) -- rosters

bigLeftLayout = windowNavigation (
                      named "Big Left Column" (Accordion ****||* Accordion)
                                    )
doubleTabbedLayout = windowNavigation (
                        named "Dbl Tabb" (
                           tabbedAlways shrinkText myTheme *||*
                           tabbedAlways shrinkText myTheme
                                           )
                                      )
imLayout =  windowNavigation (
                comboLayout
                ||| doubleTabbedLayout
                ||| bigLeftLayout
                ||| named "IM grid" (withIM (1%7) (ClassName "Tkabber") Grid)
                ||| named "IM tiled" (withIM (1%8) (ClassName "Tkabber") tiled)
                ||| named "IM full" (withIM (1%7) (ClassName "Tkabber")  Full)
                             )
    where          
      tiled   = Tall nmaster delta ratio
      nmaster = 1
      ratio   = 1/2
      delta   = 3/100
                                                           

emacsLayout = windowNavigation (
                 noBorders Full 
                 ||| doubleTabbedLayout
                 ||| tiled
                 ||| Mirror tiled 
                 ||| tabbed shrinkText myTheme
                               )
   where
     tiled   = Tall nmaster delta ratio
 
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100
            
genericLayout =	windowNavigation (
                  tiled
	          ||| Mirror tiled 
	          ||| noBorders Full 
	          ||| Grid
	          ||| Accordion
	          ||| simpleFloat
                  ||| Circle
                  ||| spiral (6/7)
                  ||| tabbed shrinkText myTheme
	          ||| imLayout
                                 )
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio
 
     -- The default number of windows in the master pane
     nmaster = 1
 
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
 
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100
 
 
myLayout =   onWorkspace "im" imLayout $
             onWorkspace "emacs" emacsLayout $
             genericLayout
 
------------------------------------------------------------------------
-- Window rules:
--
myManageHook = composeAll
    [ className =? "Emacs"              --> doF(W.shift "emacs" )
    , className =? "gmrun"		--> doFloat
    , className =? "Firefox"		--> doF (W.shift "web")
    , resource =? "desktop_window"	--> doIgnore
    , resource =? "kdesktop"		--> doIgnore
    , className =? "MPlayer"            --> doFloat
    , className =? "Gimp"               --> doFloat
    , appName =? "Ediff"          --> doCenterFloat
    , className =? "Tkabber"          --> doF (W.shift "im")
    , className =? "Chat"          --> doF (W.shift "im")
    ]
 
 
-- Whether focus follows the mouse pointer.
--
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False
 
-- Dzen stuff
--
myStatusBar :: String
myStatusBar = "dzen2 -fn '-*-terminus-bold-r-normal-*-12-*-*-*-*-*-*-*' -bg '#311511' -fg '#444444' -h 18 -sa c -x 0 -y 0 -e '' -ta l"

myConkyBarTop :: String
myConkyBarTop = "sleep 2 &&  conky -c ~/.xmonad/conky/conkyrct | dzen2 -fn '-*-terminus-bold-r-normal-*-12-*-*-*-*-*-*-*' -bg '#311511' -fg green -h 18 -sa c -x 800 -y 0 -e '' -ta r"
 
myConkyBarBot :: String
--myConkyBar = "sleep 1 && conky -c ~/.conkyrcdzen | dzen2 -fn '-*-terminus-bold-r-normal-*-12-*-*-*-*-*-*-*' -bg black -fg green -h 22 -sa c -x 800 -y 1028 -e '' -ta r"
myConkyBarBot = "sleep 1 &&  conky -c ~/.xmonad/conky/conkyrcb | dzen2 -fn 'IPAUIGothic:pixelsize=13' -bg '#311511' -fg green -h 14 -sa c -x 0 -y 1036 -e 'button1=exec:~/.xmonad/scripts/thc-listplayers-qstat.sh' -ta l"
 
myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ defaultPP
      {   ppCurrent	= dzenColor "black" "#008b8b" . pad
	, ppVisible	= dzenColor "lightgreen" "" . pad
	, ppHidden	= dzenColor "#00ffff" "" . pad
	, ppHiddenNoWindows = dzenColor "#646464"  "" . pad --"#646464"
	, ppUrgent	= dzenColor "" "red"
	, ppWsSep    = ""
	, ppSep      = "|"
	, ppLayout   = dzenColor "#00cdcd" "" .
			  (\ x -> case x of
			      "Tall"                            -> "├"
			      "Mirror Tall"             	-> "┬"
			      "Full"                            -> "◻"
			      "Grid"                            -> "+++"
			      "Spiral"                          -> "(@)"
			      "Accordion"                       -> "Acc"
			      "Tabbed Simplest"                 -> "Tab"
			      "Combo 3"                         -> "TΞΞ"
                              "Big Left Column"                 -> "A***|*A"
			      _                                 -> pad x
			  )
	, ppTitle    = (" " ++) . dzenColor "#00c5cd" "" . dzenEscape
	, ppOutput   = hPutStrLn h
 
      }
 
------------------------------------------------------------------------
 
main :: IO ()
main = do 
       workspaceBarPipe <- spawnPipe myStatusBar 
       conkyBarPipe <- spawnPipe myConkyBarBot
       conkyBarPipe <- spawnPipe myConkyBarTop
--       spawn "xcompmgr"
       xmonad $ withUrgencyHook NoUrgencyHook defaultConfig {
 
      -- simple stuff
      	 terminal           = myTerminal,
	 focusFollowsMouse  = myFocusFollowsMouse,
         borderWidth        = myBorderWidth,
	 modMask            = myModMask,
	 numlockMask        = myNumlockMask,
         workspaces         = myWorkspaces,
         normalBorderColor  = myNormalBorderColor,
         focusedBorderColor = myFocusedBorderColor,
 
      -- key bindings
         keys               = myKeys,
         mouseBindings      = myMouseBindings,
 
      -- hooks, layouts
         manageHook         = myManageHook <+> manageDocks,
         logHook	    = myLogHook workspaceBarPipe >> fadeInactiveLogHook 0xdddddddd,
 
      -- For use with no panels or just dzen2
         layoutHook         = ewmhDesktopsLayout $ avoidStruts $ myLayout
    }
