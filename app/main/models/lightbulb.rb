class Lightbulb < Volt::Model
  validate :_name, length: 5, presence: true
  validate :_group, length: 5, presence: true
end
