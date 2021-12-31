module Main where

import System.Process
import System.IO

main :: IO ()
main = do
  (Just stdin, _, _, ph) <- createProcess ((proc "ghci" []){std_in = CreatePipe})
  hPutStrLn stdin "import Library"
  hFlush stdin
  hPutStrLn stdin "import LibraryExtra"
  hFlush stdin
  hPutStrLn stdin ":q"
  hFlush stdin
  waitForProcess ph
  pure ()
