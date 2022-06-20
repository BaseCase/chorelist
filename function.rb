require_relative './lib/notion'

def handler(event:, context:)
  puts "\nStarting job at #{Time.now}.\n"

  chores = Notion.get_chores
  Notion.log_intent_for_assignment_generation chores
  Notion.generate_new_assignments_for_chores chores

  puts "\nJob complete at #{Time.now}. Thanks! <3\n"
end
