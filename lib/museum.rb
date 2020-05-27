class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(new_exhibit)
    exhibits << new_exhibit
  end

  def recommend_exhibits(patron)
    exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(new_patron)
    patrons << new_patron
  end

  def patrons_by_exhibit_interest
    patrons_into_exhibits = {}
    exhibits.each do |exhibit|
      patrons_into_exhibits[exhibit] = []
    end
    patrons.each do |patron|
      interests = recommend_exhibits(patron)
      interests.each do |exhibit|
        patrons_into_exhibits[exhibit] << patron
      end
    end
    patrons_into_exhibits
  end

  def ticket_lottery_contestants(exhibit)
    patrons.find_all do |patron|
      patron.spending_money < exhibit.cost
    end
  end

  private
  attr_writer :exhibits, :patrons
end
