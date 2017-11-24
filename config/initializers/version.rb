# frozen_string_literal: true

module DailyCashRegister

  def self.version
    Gem::Version.new VERSION::STRING
  end

  module VERSION
    MAJOR = 0
    MINOR = 2
    PATCH  = 0

    STRING = [MAJOR, MINOR, PATCH].compact.join(".")
  end
end