hello


info on installing ruby deps in a local vendor folder [are here](https://docs.aws.amazon.com/lambda/latest/dg/ruby-package.html)



# deployment
1. open up the AWS Lambda console in a web browser
2. in project root folder:
```bash
rm function.zip
zip -r function.rb vendor/
```
3. In the web console, click "Upload from" > "zip file"




# how do chore assignments work?
## weekly
- look at master chores list (pull out weeklies)
- look at chore assignments
- group assignments by their master chore
- for each master chore, find the latest assignment
    - if the latest assignment is checked, rotate assignment and create a new one due next week (it's always next week from current time, *not* the week after the assignment, in case it's a stale assignment)
    - if the latest assignment is *not* checked, just keep it.
    - if there is no latest assignment (it's a new master chore), just create a fresh one for next week

- What does "next week" mean?
  - figure out which week number we're in (e.g. "week 21")
  - go a week forward from that. that's next week.
  - then go 6 days forward from that for the due date of that week.

## bi-weekly, monthly, quarterly
to be figured out. it's a little more compliated than weekly
