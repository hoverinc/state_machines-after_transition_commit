class Cat < ApplicationRecord
  validates :name, presence: true
  validates :state, presence: true

  state_machine :state, initial: :asleep do
    add_after_transition_commit_callback

    state :grumpy
    state :hungry

    event :poke do
      transition asleep: :grumpy
    end

    event :pet do
      transition grumpy: :hungry
    end

    event :feed do
      transition hungry: :asleep
    end

    after_transition_commit asleep: :grumpy do |cat|
      cat.name = 'Grumpy Cat'
    end
  end
end
