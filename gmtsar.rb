# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Gmtsar < Formula
  desc "An open source (GNU General Public License) InSAR processing system designed for users familiar with Generic Mapping Tools (GMT). The code is written in C and will compile on any computer where GMT and NETCDF are installed."
  homepage "http://gmt.soest.hawaii.edu/projects/gmt5sar"
  url "https://elenacreinisch.com/gmtsar/GMTSAR-5.4.tar.gz"
  sha256 "ed7c2b8a923787adf47908b888c8fa2e7f81cc496cc56dfca2f88da67aac3de2"

   depends_on "cmake" => :build
   depends_on "autoconf" => :build
   depends_on "gmt"

  def install
    ENV.deparallelize  # if your formula fails when building in parallel

     system "autoconf"
     system "./configure", "--with-orbits-dir=/usr/local/orbits",
                           "--prefix=#{prefix}"
     system "make"
     system "make", "install"
  end

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
