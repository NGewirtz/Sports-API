class Basketball < Player
  def self.format_name_brief(first_name, last_name)
    "#{first_name} #{last_name[0]}."
  end
  def name_brief
    "#{first_name} #{last_name[0]}."
  end
end
