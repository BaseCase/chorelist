require 'assignment'

RSpec.describe Assignment do
  describe '#as_notion_hash' do
    it 'is a Hash in the shape the Notion API wants its JSON' do
      assignment = Assignment.new(
        person: "Casey",
        due_date: Date.parse('2022-06-02'),
        chore_id: "12345",
        done: false
      )
      expect(assignment.as_notion_hash).to eq(
        {
          "Chore" => { "relation" => [{ "id" => "12345" }]},
          "Due" => { "date" => { "start" => '2022-06-02' }},
          "Assignee" => {
            "rich_text" => [
              { "type" => "text", "text" => { "content" => "Casey" }}
            ]
          },
          "Done" => { "checkbox" => false },
        }
      )
    end
  end
end
