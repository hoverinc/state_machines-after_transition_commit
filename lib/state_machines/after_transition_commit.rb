require "state_machines"
require "state_machines-activerecord"
require "state_machines/after_transition_commit/version"

module StateMachines
  module AfterTransitionCommit
    def add_after_transition_commit_callback
      owner_class.after_commit do
        if @blocks_to_call_after_commit.present?
          @blocks_to_call_after_commit.each do |after_commit_block|
            after_commit_block.call(self)
          end

          @blocks_to_call_after_commit = []
        end
      end
    end

    def after_transition_commit(*args, &after_transistion_block)
      state_machine = self
      state_machine.after_transition(*args) do |object, _transition|
        blocks_to_call_after_commit = object.instance_variable_get(:@blocks_to_call_after_commit) || []
        blocks_to_call_after_commit << after_transistion_block
        object.instance_variable_set(:@blocks_to_call_after_commit, blocks_to_call_after_commit)
      end
    end
  end
end

StateMachines::Machine.include StateMachines::AfterTransitionCommit
