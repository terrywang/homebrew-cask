cask 'goldendict' do
  version '1.5.0-RC2'

  if MacOS.version <= :mavericks
    sha256 'c6590241a6d2a76b2a357b6999930d2bb46d3bd01dcd8af4e5dadbb796520739'
    # sourceforge.net/project/goldendict was verified as official when first introduced to the cask
    url "https://download.sourceforge.net/project/goldendict/early%20access%20builds/MacOS/GoldenDict-#{version}-372-gc3ff15f%28Qt_563%29.dmg"
  else
    sha256 'bc04acbd5db51d50b8b6262d69117304df96776472b7a1df7ad42dafafe573ff'
    # sourceforge.net/project/goldendict was verified as official when first introduced to the cask
    url "https://download.sourceforge.net/project/goldendict/early%20access%20builds/MacOS/GoldenDict-#{version}-372-gc3ff15f%28Qt_5121%29.dmg"
  end

  appcast 'https://github.com/goldendict/goldendict/releases.atom'
  name 'GoldenDict'
  homepage 'http://goldendict.org/'

  depends_on macos: '>= :mavericks'

  app 'GoldenDict.app'
  binary "#{appdir}/GoldenDict.app/Contents/MacOS/GoldenDict"

  zap trash: [
               '~/Library/Preferences/org.goldendict.plist',
               '~/Library/Saved Application State/org.goldendict.savedState',
               '~/.goldendict',
             ]
end
