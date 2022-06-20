require 'date'

class Chore
  attr_reader :id, :frequency, :assignments

  def initialize(id: "",
                 frequency: :weekly,
                 assignees: [],
                 assignments: [])
    @frequency = frequency
    @assignees = assignees
    @assignments = assignments
  end

  def latest_assignment
    if @assignments.empty?
      today = Date.today
      days_until_next_sunday = 7 - today.wday
      due = today + days_until_next_sunday
      first_assignment = Assignment.new(
        person: @assignees.first,
        due_date: due,
        done: false,
        chore_id: id
      )
      @assignments << first_assignment
    end

    @assignments.sort_by(&:due_date).last
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


Assignment = Struct.new(:person, :due_date, :chore_id, :done, keyword_init: true)