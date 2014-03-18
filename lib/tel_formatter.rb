require "nkf"
require "tel_formatter/version"

module TelFormatter
  AREA_CODES = File.read(File.expand_path("../../data/area_codes.txt", __FILE__)).split("\n").reverse
  SPECIAL_CODES = File.read(File.expand_path("../../data/special_codes.txt", __FILE__)).split("\n").reverse
  CELLPHONE_CODES = File.read(File.expand_path("../../data/cellphone_codes.txt", __FILE__)).split("\n").reverse
  AREA_CODE_REGEXP = /\A(#{AREA_CODES.join('|')})(\d{1,4})(\d{4})\Z/
  SPECIAL_CODE_REGEXP = /\A(#{SPECIAL_CODES.join('|')})(\d{6})\Z/
  CELLPHONE_CODE_REGEXP = /\A(#{CELLPHONE_CODES.join('|')})(\d{4})(\d{4})\Z/

  def self.format(tel)
    self.split(tel).join("-")
  end

  def self.split(tel)
    tel = self.preprocess(tel)
    case tel.length
    when 10
      if AREA_CODE_REGEXP =~ tel
        return [$1, $2, $3]
      elsif SPECIAL_CODE_REGEXP =~ tel
        return [$1, $2]
      else
        raise ArgumentError, "Invalid telephone number"
      end
    when 11
      if CELLPHONE_CODE_REGEXP =~ tel
        return [$1, $2, $3]
      else
        raise ArgumentError, "Invalid telephone number"
      end
    else
      raise ArgumentError, "Invalid telephone number"
    end
  end

  def self.preprocess(tel)
    NKF.nkf('-m0Z0 -w', tel).split('').select { |c| /\d/ =~ c }.join
  end
end
