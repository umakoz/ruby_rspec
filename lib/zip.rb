# -*- encoding: utf-8 -*-

class Zip
  def valid?(zipcode)
    return zipcode =~ /^[1-9]{3}(|(|-)[1-9]{4})$/
  end

end
