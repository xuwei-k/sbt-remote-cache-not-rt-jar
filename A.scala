package example

import javax.crypto.Mac

class A {
  def get(name: String) = Mac.getInstance(name)
}
