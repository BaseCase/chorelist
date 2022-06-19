require 'date'
require 'chore'

RSpec.describe Chore do
  it 'has a default frequency of Weekly' do
    chore = Chore.new
    expect(chore.frequency).to eq :weekly
  end

  describe '#latest_assignment' do
    it 'has a latest assignment with person responsible and due date' do
      chore = Chore.new(assignees: ["Casey", "Elayne"])
      expect(chore.latest_assignment.person).to eq "Casey"
      expect(chore.latest_assignment.due_date).to be_instance_of Date
    end

    it 'takes a list of previous Assignments and finds the latest one' do
      very_old = Date.new(2010, 05, 12)
      kinda_old = Date.new(2020, 01, 01)
      recent = Date.today

      assignments = [very_old, recent, kinda_old].map { |date|
        Assignment.new(person: "Casey", due_date: date)
      }

      chore = Chore.new(assignees: ["Casey"], assignments: assignments)

      expect(chore.latest_assignment.due_date).to eq recent
    end

    it 'makes upcoming Sunday the first due date when not given a previous Assignment' do
      creation_date = Date.new(2022, 06, 21)
      the_next_sunday = Date.new(2022, 06, 26)
      allow(Date).to receive(:today).and_return creation_date

      chore = Chore.new(assignees: ["Casey"])

      expect(chore.latest_assignment.due_date).to eq the_next_sunday
    end
  end

  describe '#next_assignment' do
    it 'rotates the assignee' do
      chore = Chore.new(assignees: ["Casey", "Elayne"])
      expect(chore.latest_assignment.person).to eq "Casey"
      expect(chore.next_assignment.person).to eq "Elayne"
    end

    it 'sets the due date one week after the latest assignment' do
      today = Date.today
      one_week_later = today + 7
      latest_assignment = Assignment.new(person: "Casey", due_date: today)
      chore = Chore.new(assignees: ["Casey"], assignments: [latest_assignment])

      expect(chore.latest_assignment.due_date).to eq today
      expect(chore.next_assignment.due_date).to eq one_week_later
    end
  end
end
