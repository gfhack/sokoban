module LevelReader
 def load_level(name)
    File.open("db/#{name}.txt", "r")
 end
end
