class Room
    attr_reader :capacity, :occupants
    def initialize(capacity)
        @capacity, @occupants = capacity, []
    end

    def full?
        occupants.length < capacity ? false : true
    end

    def available_space
        capacity - occupants.length
    end

    def add_occupant(name)
        unless full?
            @occupants << name
            true
        else
            false
        end
    end

end
