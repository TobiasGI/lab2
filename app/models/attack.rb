class Attack < ApplicationRecord
  belongs_to :monster
  belongs_to :victim

  validate :age_of_victims

  def age_of_victims
    if monster.scare_level > 5
      age = Time.now.utc.to_date.year - victim.birthdate.year - ((Time.now.utc.to_date.month > victim.birthdate.month || (Time.now.utc.to_date.month == victim.birthdate.month && Time.now.utc.to_date.day >= victim.birthdate.day)) ? 0 : 1)
      if age < 18
        errors.add(:base, "Monsters with scare level over 5 cannot have victims under 18.")
      end
    end
  end
end
