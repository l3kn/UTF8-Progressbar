module Paths_UTF8_Progressbar (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/leon/.cabal/bin"
libdir     = "/home/leon/.cabal/lib/x86_64-linux-ghc-7.8.4/UTF8-Progressbar-0.1.0.0"
datadir    = "/home/leon/.cabal/share/x86_64-linux-ghc-7.8.4/UTF8-Progressbar-0.1.0.0"
libexecdir = "/home/leon/.cabal/libexec"
sysconfdir = "/home/leon/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "UTF8_Progressbar_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "UTF8_Progressbar_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "UTF8_Progressbar_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "UTF8_Progressbar_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "UTF8_Progressbar_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
