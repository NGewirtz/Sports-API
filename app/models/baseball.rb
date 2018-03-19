class Baseball < Player
  POSITIONS = ["SP", "RP", "P", "C", "1B", "2B", "3B", "SS", "DH", "LF", "RF", "CF"]
  AVG_AGE_BY_POSITION = find_avg_age_by_position(POSITIONS)
  def self.format_name_brief(first_name, last_name)
    "#{first_name[0]}. #{last_name[0]}."
  end
  def name_brief
    "#{first_name[0]}. #{last_name[0]}."
  end
end
