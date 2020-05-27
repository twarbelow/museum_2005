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

  private
  attr_writer :exhibits, :patrons
end
