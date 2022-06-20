require 'chore'

class Notion
  def self.fetch_chores_data
    # API call goes here
  end

  def self.fetch_assignments_data
    # API call goes here
  end

  def self.create_assignment(assignment_json)
    # API call goes here
  end

  def self.get_chores
    chores_json = self.fetch_chores_data
    assignments_json = self.fetch_assignments_data

    chores_json[:results].map do |row|
      chore_id = row[:id]
      related_assignments = assignments_json[:results].select { |a|
        a.dig(:properties, :Chore, :relation).first[:id] == chore_id
      }.map { |asn_json|
        Assignment.new(
          person: asn_json.dig(:properties, :Assignee, :rich_text)
                          .first
                          .dig(:text, :content),
          due_date: Date.parse(asn_json.dig(:properties, :Due, :date, :start)),
          chore_id: chore_id,
          done: asn_json.dig(:properties, :Done, :checkbox)
        )
      }
      Chore.new(
        id: chore_id,
        frequency: row.dig(:properties, :Frequency, :select, :name).to_sym,
        assignees: row.dig(:properties, :Assignees, :multi_select).map { |a| a[:name] },
        assignments: related_assignments,
      )
    end
  end

  def self.log_intent_for_assignment_generation(chores)
    chores.each do |chore|
      print "Chore: #{chore.name}"
      print "Due on #{chore.latest_assignment.due_date}"
      print "Assigned to #{chore.latest_assignment.person}"
      if chore.latest_assignment.done
        next_assignment = chore.next_assignment
        print "Next due on #{next_assignment.due_date}"
        print "Assigned to #{next_assignment.person}"
      else
        print "Not done yet, so retaining existing assignment."
      end
    end
  end

  def self.generate_new_assignments_for_chores(chores)
    chores.map(&:next_assignment).compact.each do |assignment|
      self.create_assignment(assignment.to_json)
    end
  end
end
