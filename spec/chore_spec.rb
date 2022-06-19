require 'chore'

RSpec.describe Chore do
  it 'has a default frequency of Weekly' do
    chore = Chore.new
    expect(chore.frequency).to eq :weekly
  end

  it 'has a latest assignment with person responsible and due date' do
    chore = Chore.new(assignees: ["Casey", "Elayne"])
    expect(chore.latest_assignment.person).to eq "Casey"
    expect(chore.latest_assignment.due_date).to be_instance_of Date
  end
end
