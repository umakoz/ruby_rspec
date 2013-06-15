# -*- encoding: utf-8 -*-

class Zip
  def valid?(zipcode)
    if zipcode =~/^\d{3}$/
      return true
    end
    if zipcode =~/^\d{7}$/
      return true
    end
    if zipcode =~/^\d{3}-\d{4}$/
      return true
    end
    false
  end

end
