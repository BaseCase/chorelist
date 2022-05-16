require 'httparty'


def handler(event:, context:)
  response = HTTParty.get('http://example.com')
  puts response
end


Chore = Struct.new(
  :id,
  :name,
  :room,
  :frequency,
  :assignees,
  :notes,
  keyword_init: true
)

Assignment = Struct.new(
  :id,
  :name,
  :chore,
  keyword_init: true
)


class Notion
  NOTION_API_SECRET = ENV['NOTION_API_SECRET']
  NOTION_API_BASE_URL = "https://api.notion.com/v1"
  PAGES_URL = "#{NOTION_API_BASE_URL}/pages"
  CHORES_DATABASE_ID = ENV['CHORES_DATABASE_ID']
  CHORES_DATABASE_URL = "#{NOTION_API_BASE_URL}/databases/#{CHORES_DATABASE_ID}"
  ASSIGNMENTS_DATABASE_ID = ENV['ASSIGNMENTS_DATABASE_ID']
  ASSIGNMENTS_DATABASE_URL = "#{NOTION_API_BASE_URL}/databases/#{ASSIGNMENTS_DATABASE_ID}"


  def self.get_chores_metadata
    response = HTTParty.get(
      CHORES_DATABASE_URL,
      headers: {
        'Authorization' => "Bearer #{NOTION_API_SECRET}",
        'Notion-Version' => '2022-02-22'
      })

    JSON.parse response.body, symbolize_names: true
  end

  def self.get_assignments_metadata
    response = HTTParty.get(
      ASSIGNMENTS_DATABASE_URL,
      headers: {
        'Authorization' => "Bearer #{NOTION_API_SECRET}",
        'Notion-Version' => '2022-02-22'
      })

    JSON.parse response.body, symbolize_names: true
  end

  def self.get_chores
    response = HTTParty.post(
      "#{CHORES_DATABASE_URL}/query",
      headers: {
        'Authorization' => "Bearer #{NOTION_API_SECRET}",
        'Notion-Version' => '2022-02-22',
        'Content-Type' => 'application/json'
      },
      body: {
        page_size: 100
      }.to_json
    )

    json_data = JSON.parse response.body, symbolize_names: true
    json_data[:results].map do |row|
      Chore.new(
        id: row[:id],
        name: row[:properties][:Name][:title][0][:plain_text],
        room: row[:properties][:Room][:select][:name],
        frequency: row[:properties][:Frequency][:select][:name],
        assignees: row[:properties][:Assignees][:multi_select].map { |ass| ass[:name] },
        notes: "",
      )
    end
  end

  def self.create_assignment(assignment)
    res = HTTParty.post(
      PAGES_URL,
      headers: {
        'Authorization' => "Bearer #{NOTION_API_SECRET}",
        'Notion-Version' => '2022-02-22',
        'Content-Type' => 'application/json'
      },
      body: {
        parent: { "database_id" => ASSIGNMENTS_DATABASE_ID },
        properties: {
          "Name" => { "title" => [{ "text" => { "content" => assignment.name }}]},
          "Chore" => { "relation" => [{ "id" => assignment.chore.id }]}
        }
      }.to_json
    )

    unless res.success?
      puts "Error trying to create database entry via Notion API"
      puts res
    end
  end
end
