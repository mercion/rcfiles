import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Actions.GridSelect
import XMonad.Actions.SpawnOn
import XMonad.Actions.WorkspaceNames

myManageHook = composeAll
   [ className =? "thunderbird" --> doShift "6:MailIRC"
   , className =? "firefox" --> doShift "5:Internet"
   , manageDocks
   ]

main = do
    xmproc <- spawnPipe "i3status | xmobar -o -t '%StdinReader%' -c '[Run StdinReader]'"
    xmonad $ defaultConfig
        { manageHook = myManageHook <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , workspaces = ["1:alpha","2:beta","3:gamma","4:delta","5:Internet","6:MailIRC"]
        , startupHook  = do
            spawn "feh --bg-scale ~/images/wallpaper.jpg"
            spawnOn "1:alpha" "terminator"
            spawnOn "6:MailIRC" "thunderbird"
        , borderWidth = 3
        , terminal = "terminator"
        , focusedBorderColor = "red"
        } `additionalKeys`
        [ ((mod1Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
	, ((mod4Mask, xK_space), spawn "screen -d -m /usr/bin/gmrun")
	, ((mod4Mask,  xK_g), goToSelected defaultGSConfig)
	, ((mod4Mask,  xK_s), spawn "spotify")
	, ((mod4Mask,  xK_d), spawn "wine Dashlane.exe")
	, ((mod4Mask,  xK_c), spawn "chrome")
	, ((mod4Mask,  xK_m), spawn "quicklinks")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
    	, ((mod1Mask, xK_g), goToSelected defaultGSConfig)
        , ((0, xK_Print), spawn "scrot")
        ]
