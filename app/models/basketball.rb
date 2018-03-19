class Basketball < Player
  POSITIONS = ["SG", "SF", "C", "PF", "PG", "G"]
  AVG_AGE_BY_POSITION = find_avg_age_by_position(POSITIONS)
  def self.format_name_brief(first_name, last_name)
    "#{first_name} #{last_name[0]}."
  end
  def name_brief
    "#{first_name} #{last_name[0]}."
  end
end
