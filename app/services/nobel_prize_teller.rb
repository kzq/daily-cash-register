# frozen_string_literal: true

class NobelPrizeTeller
  attr_reader :data

  def initialize(nobel_prizes_archive)
    @data = nobel_prizes_archive
  end

  def total_prizes_per_subject
    process_data
  end

  private

    def process_data
      # manipulate hash data
      # exp: {antisocial: 221, violent: 35 }
      total_categaories_with_count = @data["prizes"].each_with_object(Hash.new(0)) { |h1, h2| h2[h1["category"]] += 1 }
      # sort by number of crimes in desending order
      total_categaories_with_count = total_categaories_with_count.sort_by { |_key, value| value }.reverse.to_h
      # convert { key: value } single hash into array of hashes
      total_categaories_with_count.collect { |k, v| { label: k, value: v } }
    end
end
