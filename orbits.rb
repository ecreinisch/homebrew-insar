# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Orbits < Formula
  desc "Orbit files that correspond with GMTSAR interferometric processing software"
  url "http://topex.ucsd.edu/gmtsar/tar/ORBITS.tar"
  sha256 ""

#  option "without-gmt", "Does not install GMT5; use this option only if you already installed GMT5 with all of the (previously optional) libraries (e.g., gdal, pcre, etc).  This is not recommended."
  
#  if build.without? "gmt"
#    depends_on "cmake" => :build
#    depends_on "autoconf" => :build
#  else
#    depends_on "cmake" => :build
#    depends_on "autoconf" => :build
#    depends_on "gmt" => "with-v5"
#  end

  def install
    ENV.deparallelize  # if your formula fails when building in parallel

     system "autoconf"
     system "./configure", "--with-orbits-dir=/usr/local/orbits",
                           "--prefix=#{prefix}"
     system "make"
     system "make", "install"
  end

#  def caveats; <<-EOS.undent
#      GMTSARv5.4 currently uses GMT5.  Installing without options will automatically install GMT5 with all libraries using a Homebrew formula.  
#If you already have GMT5 installed with all the (previously optional) libraries, use the without-gmt option at installation. If you choose to use the without-gmt option, please make sure that GMT5 will be accessible to GMTSAR at runtime (i.e., included in your path). This is strongly discouraged because it is unlikely that you will have all of the dependencies in the correct locations for Homebrew. 
#      EOS
#  end


  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test GMTSAR`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
