require 'notion'
require 'fixtures'

RSpec.describe Notion do
  before do
    expect(Notion).to receive(:fetch_chores_data)
                        .and_return(FIXTURES[:chores_list_json_response])

    expect(Notion).to receive(:fetch_assignments_data)
                        .and_return(FIXTURES[:assignments_list_json_response])
  end

  it 'fetches Chores from the Notion API' do
    chores_from_notion = Notion.get_chores
    expect(chores_from_notion.count).to eq 2
    expect(chores_from_notion.all? { |c| c.instance_of? Chore }).to be_truthy
  end

  it 'associates Assignments with their parent Chores' do
    chores = Notion.get_chores
    expect(chores[0].assignments.first).to be_instance_of Assignment
    expect(chores[1].assignments.first).to be_instance_of Assignment
  end
end
