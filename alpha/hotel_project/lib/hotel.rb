require_relative "room"

class Hotel
    attr_reader :rooms
    def initialize(name, rooms)
        @name = name
        @rooms = {}
        rooms.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        name_parts = @name.split
        new_name = name_parts.map { |part| part.capitalize }
        new_name.join(' ')
    end

    def room_exists?(room)
        rooms.keys.include?(room)
    end

    def check_in(person_name, room_name)
        unless room_exists?(room_name)
            puts 'sorry, room does not exist'
        else
            added = rooms[room_name].add_occupant(person_name)

            if added
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        rooms.values.any? { |room| !room.full? }
    end

    def list_rooms
        puts "#{'Room:'.ljust(10)} #{'Available space'}:"
        rooms.each do |name, room|
            puts "#{name.ljust(10)} #{room.available_space}"
        end
    end
end

