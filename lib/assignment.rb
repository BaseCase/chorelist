Assignment = Struct.new(:person, :due_date, :chore_id, :done, :title, keyword_init: true) do
  def as_notion_hash
    {
      "Chore" => { "relation" => [{ "id" => chore_id }]},
      "Due" => { "date" => { "start" => due_date.iso8601 }},
      "Assignee" => {
        "rich_text" => [
          { "type" => "text", "text" => { "content" => person }}
        ]
      },
      "Done" => { "checkbox" => done },
      "Title" => {
        "title" => [
          { "type" => "text", "text" => { "content" => title }}
        ]
      },
    }
  end
end
