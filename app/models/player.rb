class Player < ApplicationRecord
  validates :first_name, :last_name, :name_brief, :position, :age,
    :type, presence: true

  def self.find_avg_age_by_position
    positions = pluck(:position).uniq
    avg_hash = {}
    positions.each do |position|
      avg_hash[position] = where('position = ? AND NOT age = 0', position).average(:age).round(2)
    end
    avg_hash
  end

  AVG_AGE_BY_POSITION = find_avg_age_by_position

  def average_position_age_diff
    return "N/A" if age.zero?
    avg_hash = self.class::AVG_AGE_BY_POSITION
    age - avg_hash[position]
  end

  def display_age
    age.zero? ? "N/A" : age
  end
end
