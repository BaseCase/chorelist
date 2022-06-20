require 'httparty'
require_relative './chore'


class Notion
  NOTION_API_SECRET = ENV.fetch('NOTION_API_SECRET', 'test')
  CHORES_DB_ID = ENV.fetch('CHORES_DATABASE_ID', 'test')
  ASSIGNMENTS_DB_ID = ENV.fetch('ASSIGNMENTS_DATABASE_ID', 'test')
  API_BASE_URL = "https://api.notion.com/v1"

  def self.headers
    {
      'Authorization' => "Bearer #{NOTION_API_SECRET}",
      'Notion-Version' => '2022-02-22',
      'Content-Type' => 'application/json',
    }
  end

  def self.fetch_chores_data
    response = HTTParty.post(
      "#{API_BASE_URL}/databases/#{CHORES_DB_ID}/query",
      headers: self.headers,
      body: { page_size: 100 }.to_json
    )

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.fetch_assignments_data
    response = HTTParty.post(
      "#{API_BASE_URL}/databases/#{ASSIGNMENTS_DB_ID}/query",
      headers: self.headers,
      body: {
        page_size: 100,
        sorts: [
          {
            property: "Due",
            direction: "descending"
          }
        ]
      }.to_json
    )

    JSON.parse(response.body, symbolize_names: true)
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
        name: row.dig(:properties, :Name, :title).first.dig(:text, :content),
        frequency: row.dig(:properties, :Frequency, :select, :name).to_sym,
        assignees: row.dig(:properties, :Assignees, :multi_select).map { |a| a[:name] },
        assignments: related_assignments,
      )
    end
  end

  def self.log_intent_for_assignment_generation(chores)
    chores.each do |chore|
      puts "Chore: #{chore.name}"
      puts "#{chore.latest_assignment.person} to do by #{chore.latest_assignment.due_date}."
      if chore.latest_assignment.done
        next_assignment = chore.next_assignment
        puts "Done! Next due on #{next_assignment.due_date} by #{next_assignment.person}."
      else
        puts "Not done yet, so retaining existing assignment."
      end
      puts
    end
  end

  def self.generate_new_assignments_for_chores(chores)
    chores.map(&:next_assignment).compact.each do |assignment|
      self.create_assignment(assignment.to_json)
    end
  end
end
