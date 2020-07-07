class Makeheaders < Formula
  desc "Utility to create a tailored .h file for a given .c or .cpp file"
  homepage "https://www.hwaci.com/sw/mkhdr/"
  url "https://www.fossil-scm.org/home/uv/fossil-src-2.11.1.tar.gz"
  sha256 "b391f34fada5f16eba452f36d2ad8baa3fe2a5267bf8f4169cb1b9832c0cb8eb"
  license "BSD-2-Clause"

  def install
    executable = "makeheaders"
    system ENV.cc, "src/makeheaders.c", "-o", executable
    bin.install executable
  end

  # @todo #0 Implement a test for brew formula Makeheaders

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test makeheaders`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
