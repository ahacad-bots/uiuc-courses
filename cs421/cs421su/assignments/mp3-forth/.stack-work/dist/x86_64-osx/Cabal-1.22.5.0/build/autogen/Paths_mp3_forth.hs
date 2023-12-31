module Paths_mp3_forth (
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
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/pw/cs421su/assignments/mp3-forth/.stack-work/install/x86_64-osx/lts-6.5/7.10.3/bin"
libdir     = "/Users/pw/cs421su/assignments/mp3-forth/.stack-work/install/x86_64-osx/lts-6.5/7.10.3/lib/x86_64-osx-ghc-7.10.3/mp3-forth-0.1.0.0-0R7GXOJoHugGrLsd7oXm8T"
datadir    = "/Users/pw/cs421su/assignments/mp3-forth/.stack-work/install/x86_64-osx/lts-6.5/7.10.3/share/x86_64-osx-ghc-7.10.3/mp3-forth-0.1.0.0"
libexecdir = "/Users/pw/cs421su/assignments/mp3-forth/.stack-work/install/x86_64-osx/lts-6.5/7.10.3/libexec"
sysconfdir = "/Users/pw/cs421su/assignments/mp3-forth/.stack-work/install/x86_64-osx/lts-6.5/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "mp3_forth_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "mp3_forth_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "mp3_forth_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "mp3_forth_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "mp3_forth_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
