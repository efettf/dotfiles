
(defsrc
  esc 
  tab 
  caps
  h j k l 
  n g
  e d
)

(deflayer base
  caps ;; Escape to caps lock.
  (tap-hold 75 150 tab (layer-while-held nav)) ;; Navigation layer while holding tab.
  (tap-hold 75 150 esc lctl) ;; Ctrl while holding caps lock, otherwise esc.
  _ _ _ _ 
  g n ;; Swap 'n' and 'g'.
  d e ;; Swap 'e' and 'd'.
)

(deflayer nav
  _
  _
  _
  left down up right ;; Vim like keys everywhere.
  _ _
  _ _
)

