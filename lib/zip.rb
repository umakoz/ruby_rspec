# -*- encoding: utf-8 -*-

class Zip
  def valid?(zipcode)
    if zipcode == ""
      false
    end
    if zipcode =~/^\d{3}$/
      true
    end
  end
end
