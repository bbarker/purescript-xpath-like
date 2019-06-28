# purescript-xpath-like

[![Latest release](http://img.shields.io/github/release/bbarker/purescript-xpath-like.svg)](https://github.com/bbarker/purescript-xpath-like/releases)
[![Build status](https://travis-ci.org/bbarker/purescript-xpath-like.svg?branch=master)](https://travis-ci.org/bbarker/purescript-xpath-like)

Utility functions for XPaths.

## Usage

### Path Concatenation using //

```purescript
recP :: String
recP = "record"

idP = "identifier"

recFromRootP :: String
recFromRootP = root // recP

idFromRootP :: String
idFromRootP = recFromRootP // idP

-- idFromRootP == "/record/identifier"

```


### Path Concatentation with Dummy Namespace using /?

This mode of usage is particularly handy when dealing with subtleties sometimes
present in XPath evaluation strategies dealing with namespaces. For examples of
how this might be used in practice see examples in the tests for
[purescript-web-dom-xpath](https://github.com/purescript-web/purescript-web-dom-xpath)


```purescript
recP :: String
recP = "record"

idP = "identifier"

recFromRootP :: String
recFromRootP = root /? recP

idFromRootP :: String
idFromRootP = recFromRootP /? idP

-- idFromRootP == "/x:record/x:identifier"

```

If you want more safety you can use an `XPath` newtype like this, instead of
using `String` directly, but so far, I haven't seen any advantage in
standardizing this (open an issue if you have thoughts):


```purescript
newtype XPath = XPath String
derive instance newtypeXPath :: Newtype XPath _
```

## Installation

```
bower install purescript-xpath-like
```

## Documentation

Module documentation is [published on Pursuit](http://pursuit.purescript.org/packages/purescript-xpath-like).

## Tests

`npm run test`
