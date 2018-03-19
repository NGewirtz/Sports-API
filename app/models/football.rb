class Football < Player
  def self.format_name_brief(first_name, last_name)
    "#{first_name[0]}. #{last_name}"
  end
  def name_brief
    "#{first_name[0]}. #{last_name}"
  end
end
