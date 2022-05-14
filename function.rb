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
  keyword_init: true
)


class Notion
  NOTION_API_SECRET = ENV['NOTION_API_SECRET']
  NOTION_API_BASE = "https://api.notion.com/v1"
  MASTER_LIST_DATABASE_ID = ENV['MASTER_LIST_DATABASE_ID']
  MASTER_DB_URL = "#{NOTION_API_BASE}/databases/#{MASTER_LIST_DATABASE_ID}"
  RUNNING_LIST_DATABASE_ID = ENV['RUNNING_LIST_DATABASE_ID']
  RUNNING_DB_URL = "#{NOTION_API_BASE}/databases/#{RUNNING_LIST_DATABASE_ID}"
  PAGES_URL = "#{NOTION_API_BASE}/pages"

  def self.get_master_database_metadata
    response = HTTParty.get(
      MASTER_DB_URL,
      headers: {
        'Authorization' => "Bearer #{NOTION_API_SECRET}",
        'Notion-Version' => '2022-02-22'
      })

    JSON.parse response.body, symbolize_names: true
  end

  def self.get_running_list_metadata
    response = HTTParty.get(
      RUNNING_DB_URL,
      headers: {
        'Authorization' => "Bearer #{NOTION_API_SECRET}",
        'Notion-Version' => '2022-02-22'
      })

    JSON.parse response.body, symbolize_names: true
  end

  def self.get_master_database_rows
    response = HTTParty.post(
      "#{MASTER_DB_URL}/query",
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
        parent: { "database_id" => RUNNING_LIST_DATABASE_ID },
        properties: {
          "Name" => { "title" => [{ "text" => { "content" => assignment.name }}]}
        }
      }.to_json
    )

    unless res.success?
      puts "Error trying to create database entry via Notion API"
      puts res
    end
  end
end
