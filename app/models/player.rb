class Player < ApplicationRecord
  validates :first_name, :last_name, :name_brief, :position, :age,
    :type, presence: true
  validates :last_name, uniqueness: { scope: [:first_name, :age, :position] }

  def self.find_avg_age_by_position
    positions = pluck(:position).uniq
    avg_hash = {}
    positions.each do |position|
      avg_hash[position] = where('position = ? AND NOT age = 0', position).average(:age).round(2)
    end
    avg_hash
  end

  AVG_AGE_BY_POSITION = find_avg_age_by_position

  def self.import_players
    sport = self.name
    api = "http://api.cbssports.com/fantasy/players/list?version=3.0&SPORT=#{sport.downcase}&response_format=JSON"
    response = JSON.parse(HTTParty.get(api))
    response["body"]["players"].each do |player|
      next unless player["pro_status"] == "A"
      brief = format_name_brief(player["firstname"], player["lastname"])
      Player.create(
        first_name: player["firstname"],
        last_name: player["lastname"],
        name_brief: brief,
        position: player["position"],
        age: player["age"].to_i,
        type: sport,
      )
    end
  end

  def average_position_age_diff
    return "N/A" if age.zero?
    avg_hash = self.class::AVG_AGE_BY_POSITION
    age - avg_hash[position]
  end

  def display_age
    age.zero? ? "N/A" : age
  end
end
