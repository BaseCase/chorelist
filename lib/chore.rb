require 'date'
require_relative './assignment'

class Chore
  attr_reader :id, :name, :frequency, :assignments

  def initialize(id: "",
                 name: "",
                 frequency: :weekly,
                 assignees: [],
                 assignments: [])
    @id = id
    @name = name
    @frequency = frequency
    @assignees = assignees
    @assignments = assignments
  end

  def latest_assignment
    if @assignments.empty?
      today = Date.today
      days_since_last_sunday = today.wday
      due = today - days_since_last_sunday
      first_assignment = Assignment.new(
        person: @assignees.first,
        due_date: due,
        done: true,   # feels a little hacky to set this to true? hmm....
        chore_id: id
      )
      @assignments << first_assignment
    end

    @assignments.max_by(&:due_date)
  end

  def next_assignment
    if not latest_assignment.done
      return nil
    end

    latest_person_idx = @assignees.index(latest_assignment.person)
    next_person_idx = (latest_person_idx + 1) % @assignees.length
    next_person = @assignees[next_person_idx]

    next_due = one_week_after(latest_assignment.due_date)

    Assignment.new(
      person: next_person,
      due_date: next_due,
      done: false,
      chore_id: id
    )
  end

  private

  def one_week_after(date)
    date + 7
  end
end
