require 'httparty'


def handler(event:, context:)
  response = HTTParty.get('http://example.com')
  puts response
end



class Notion
  NOTION_API_SECRET = ENV['NOTION_API_SECRET']
  NOTION_API_BASE = "https://api.notion.com/v1"
  MASTER_LIST_DATABASE_ID = ENV['MASTER_LIST_DATABASE_ID']
  MASTER_DB_URL = "#{NOTION_API_BASE}/databases/#{MASTER_LIST_DATABASE_ID}"

  def get_master_database_metadata
    response = HTTParty.get(
      MASTER_DB_URL,
      headers: {
        'Authorization' => "Bearer #{NOTION_API_SECRET}",
        'Notion-Version' => '2022-02-22'
      })

    JSON.parse response.body, symbolize_names: true
  end

  def get_master_database_rows
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

    JSON.parse response.body, symbolize_names: true
  end
end
