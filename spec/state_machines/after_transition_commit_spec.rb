require 'spec_helper'

RSpec.describe StateMachines::AfterTransitionCommit do
  it "has a version number" do
    expect(StateMachines::AfterTransitionCommit::VERSION).not_to be nil
  end

  subject { cat.poke! }
  let(:cat) { create(:cat) }

  it 'only executes callbacks after the record was committed' do
    block_was_run = false
    cat_name = cat.name

    block = lambda do |record|
      block_was_run = true
      cat_name = record.name
    end

    cat.class.after_commit(&block)

    expect do
      expect { cat.poke! && cat.save }.not_to(change { cat_name })
    end.to change { cat.state.to_sym }.from(:asleep).to(:grumpy)

    expect(cat.name).to eq('Grumpy Cat')
  end
end
