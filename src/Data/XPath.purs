module Data.XPath (
    class XPathLike,
    pathAppend, (//), pathAppendNSx, (/?)
  , root
) where

import Prelude

import Data.Newtype                      (class Newtype)

-- | Provides utility functions for working with XPaths.
class Semigroup m <= XPathLike m where
  -- | Put a path seperator between two XPaths and return the resulting XPath.
  pathAppend :: m -> m -> m

  -- | Useful variant of `pathAppend` needed for some XPath implementations;
  -- | insert a separator with a dummy namespace ("x") for the second XPath
  -- | fragment. For example:
  -- | `root /? "record" /? "identifier"  == "/x:record/x:identifier"`.
  pathAppendNSx :: m -> m -> m
  -- | The root XPath representation.
  root :: m

newtype XPath = XPath String
derive instance newtypeXPath :: Newtype XPath _

instance stringXPath :: XPathLike String where
  pathAppend p1 p2 | p1 == root  = root <> p2
  pathAppend p1 p2 = p1 <> "/" <> p2
  pathAppendNSx p1 p2 | p1 == root  = root <> "x:" <> p2
  pathAppendNSx p1 p2 = p1 <> "/x:" <> p2
  root = "/"

infixr 5 pathAppend as //
infixr 5 pathAppendNSx as /?
