import XMonad

import XMonad.Layout.Spacing
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Ungrab
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.NoBorders (noBorders, smartBorders)
import XMonad.Layout.ToggleLayouts (ToggleLayout(..), toggleLayouts)
import qualified Data.Map                            as M
import qualified XMonad.StackSet                     as W
import XMonad.Util.SpawnOnce

main :: IO ()
main = xmonad
  -- . withSB myXmobarPP
  $ myConfig

myConfig = def
  { terminal = "kitty"
  , layoutHook = smartBorders $ myLayouts
  }
  `additionalKeysP`
  [ ("M-S-s", spawn "flameshot gui")
  , ("M-f", sendMessage (Toggle "Full"))
  , ("M-t", withFocused toggleFloat)
  ]  
  where
            toggleFloat w = windows (\s -> if M.member w (W.floating s)
                            then W.sink w s
                            else (W.float w (W.RationalRect (1/3) (1/4) (1/2) (4/5)) s))


-- Layouts
myLayouts = toggleLayouts (noBorders Full) (myTiled)
    where
        myTiled = spacingWithEdge 10 $ Tall 1 (3/100) (1/2)
        myFullscreen = Tall 1 (3/100) (1/2)
