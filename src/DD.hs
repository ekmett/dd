{-# language TemplateHaskell, QuasiQuotes #-}
module DD where

import qualified Language.C.Inline.Cpp as C
-- import qualified Language.C.Inline.Unsafe as CU
import Text.Heredoc

C.context C.cppCtx
C.include "<iostream>"
C.include "bar.h"
C.verbatim
 [here|
    void foo() {
      std::cout << "Goodbye Cruel World\n";
    }
 |]

main :: IO ()
main = do
  [C.block| void{ std::cout << "Hello, World!\n"; } |]
  [C.block| void{ foo(); } |]
  [C.block| void{ bar(); } |]
