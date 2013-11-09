{-----------------------------------------------------------------------------}
{-- Static Page Compiler                                        jaburns.net --}
{-----------------------------------------------------------------------------}

module Main (main) where

-------------------------------------------------------------------------------

import Text.XmlHtml
import TemplateEngine
import System.Directory (createDirectoryIfMissing)

-------------------------------------------------------------------------------


things = map (\x -> [("name",x)])
  [ "platformer",
    "elastoball",
    "galaxyrider",
    "skistuntstudio",
    "nescorder",
    "avrcaster",
    "vgadac",
    "key360",
    "tim2adder",
    "flashtrees",
    "flashbees",
    "column",
    "marble",
    "ships",
    "rope",
    "sphere" ];


main = do
    createDirectoryIfMissing True "compiled"
    makeIndex
    putStrLn "Done!"

makeIndex = do
    putStrLn "Compiling \"index.html\"..."
    doc <- loadView "index.view.html"
    panel <- loadView "indexpanel.partial.html"
    let panelSet = map (\x -> insertValues x panel) things
    let panels = concat $ map docContent panelSet
    let docWithPanels = insertContent "panels" panels doc
    writeFile "compiled/index.html" $ renderView $ docWithPanels



