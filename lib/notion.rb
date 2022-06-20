require 'chore'

class Notion
  def self.fetch_chores_data
    # API call goes here
  end

  def self.fetch_assignments_data
    # API call goes here
  end

  def self.get_chores
    chores_json = self.fetch_chores_data
    assignments_json = self.fetch_assignments_data

    chores = chores_json[:results].map do |row|
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

    chores
  end
end
