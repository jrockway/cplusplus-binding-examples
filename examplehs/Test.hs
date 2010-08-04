module Test (
  Test
  , newTestInt
  , newTestString
  , printTest
  , getTestText
  ) where

import Test.Internal
import System.IO.Unsafe (unsafePerformIO)

import Foreign.C.String
import Foreign.Ptr
import Foreign.ForeignPtr

newTestInt :: Int -> Test
newTestInt i = unsafePerformIO $ do
  ptr <- new_int_test (fromIntegral i)
  fptr <- newForeignPtr free_test ptr
  return $ Test fptr

newTestString :: String -> Test
newTestString x = unsafePerformIO $ withCString x $ \str -> do
  ptr <- new_str_test str
  fptr <- newForeignPtr free_test ptr
  return $ Test fptr

printTest :: Test -> IO ()
printTest (Test t) = withForeignPtr t (\ptr -> print_test_text ptr)

getTestText :: Test -> String
getTestText (Test t) = unsafePerformIO $ withForeignPtr t (\ptr -> get_test_text ptr >>= peekCString)
