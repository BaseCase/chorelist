require 'json'

Assignment = Struct.new(:person, :due_date, :chore_id, :done, keyword_init: true) do
  def to_json
    {
      "Chore" => { "relation" => [{ "id" => chore_id }]},
      "Due" => { "date" => { "start" => due_date.iso8601 }},
      "Assignee" => {
        "right_text" => [
          { "type" => "text", "text" => { "content" => person }}
        ]
      },
      "Done" => { "checkbox" => done },
    }.to_json
  end
end
