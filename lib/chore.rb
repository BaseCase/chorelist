require 'date'

class Chore
  attr_reader :frequency

  def initialize(frequency: :weekly, assignees: [])
    @frequency = frequency
    @assignees = assignees
  end

  def latest_assignment
    due = Date.new
    @_latest_assignment ||= Assignment.new(person: @assignees.first, due_date: due)
  end
end


Assignment = Struct.new(:person, :due_date, keyword_init: true)
