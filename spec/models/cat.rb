class Cat < ApplicationRecord
  validates :name, presence: true
  validates :state, presence: true

  state_machine :state, initial: :asleep do
    state :asleep
    state :hungry
    state :angry
    state :bored
    state :happy

    event :poke! do
      transition asleep: :angry
    end

    event :pet! do
      transition [:bored, :angry] => :asleep
    end

    event :feed! do
      transition hungry: :asleep
    end
  end
end
