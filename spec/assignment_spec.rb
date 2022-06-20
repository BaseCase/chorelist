require 'json'
require 'assignment'

RSpec.describe Assignment do
  describe '#to_json' do
    it 'is JSON in the shape the Notion API wants it' do
      assignment = Assignment.new(
        person: "Casey",
        due_date: Date.parse('2022-06-02'),
        chore_id: "12345",
        done: false
      )
      expect(assignment.to_json).to eq(
        {
          "Chore" => { "relation" => [{ "id" => "12345" }]},
          "Due" => { "date" => { "start" => '2022-06-02' }},
          "Assignee" => {
            "right_text" => [
              { "type" => "text", "text" => { "content" => "Casey" }}
            ]
          },
          "Done" => { "checkbox" => false },
        }.to_json
      )
    end
  end
end
