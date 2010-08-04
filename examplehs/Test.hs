{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Test (
    newTestInt
  , newTestString
  , printTest
  , getTestText
  ) where

import Foreign
import Foreign.C
import Foreign.C.String
import Foreign.Ptr
import Foreign.ForeignPtr

import System.IO.Unsafe (unsafePerformIO)

import Control.Monad


data RawTest
type TestPtr = Ptr RawTest

data Test = Test (ForeignPtr RawTest) deriving (Show)

foreign import ccall "example_cpp.h new_int_test"
  new_int_test :: CInt -> IO TestPtr

foreign import ccall "example_cpp.h new_str_test"
  new_str_test :: CString -> IO TestPtr

foreign import ccall "example_cpp.h print_test_text"
  print_test_text :: TestPtr -> IO ()

foreign import ccall "example_cpp.h get_test_text"
  get_test_text :: TestPtr -> IO CString

foreign import ccall "example_cpp.h &free_test"
  free_test :: FunPtr (TestPtr -> IO ())

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
