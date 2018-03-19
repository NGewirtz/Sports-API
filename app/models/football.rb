class Football < Player
  POSITIONS = ["DB", "WR", "DL", "RB", "LB", "K", "QB", "TE", "C", "P"]
  AVG_AGE_BY_POSITION = find_avg_age_by_position(POSITIONS)
  def self.format_name_brief(first_name, last_name)
    "#{first_name[0]}. #{last_name}"
  end
  def name_brief
    "#{first_name[0]}. #{last_name}"
  end
end
