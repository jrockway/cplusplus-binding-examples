{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}

module Test.Internal (
    RawTest
  , TestPtr
  , Test(..)
  , new_int_test
  , new_str_test
  , print_test_text
  , get_test_text
  , free_test
  )
       where

import Foreign
import Foreign.C

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
