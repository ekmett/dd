{-# language TemplateHaskell, QuasiQuotes #-}
module DD where

import qualified Language.C.Inline.Cpp as C
import qualified Language.C.Inline.Unsafe as CU ()

C.context C.cppCtx
C.include "<iostream>"

main :: IO ()
main = [C.block|void{ std::cout << "Hello, World!\n"; }|]
