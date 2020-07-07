class Makeheaders < Formula
  desc "Utility to automatically generate a .h file containing declarations for everything a .c file uses"
  homepage "https://www.hwaci.com/sw/mkhdr/"
  url "https://www.fossil-scm.org/home/uv/fossil-src-2.11.1.tar.gz"
  sha256 "b391f34fada5f16eba452f36d2ad8baa3fe2a5267bf8f4169cb1b9832c0cb8eb"
  license "BSD-2-Clause"

  def install
    system ENV.cc, "src/#{name}.c", "-o", name
    bin.install name
  end

  test do
    PROVIDER_C = "provider.c"
    CONSUMER_C = "consumer.c"
    CONSUMER_H = "consumer.h"

    (testpath/PROVIDER_C).write <<~EOS
      void something(void) {
        // ...
      }
    EOS

    (testpath/CONSUMER_C).write <<~EOS
      #include "#{CONSUMER_H}"

      void main(void) {
          something();
      }
    EOS

    system "#{bin}/#{name} *.c"
    assert_predicate testpath/CONSUMER_H, :exist?

    system "#{ENV.cc} -Werror=implicit-function-declaration *.c"
  end
end
