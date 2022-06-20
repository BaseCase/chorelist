# Chores list
This is a Ruby script that connects two Notion databases together for the purposes of having a rolling list of household chores shared by two or more people. As implemented, it hard-codes the exact shape of those two databases, but I imagine it wouldn't be too hard to adapt the marshalling code to some other format.

This project also serves as a small demo of some of the basic operations of the [Notion API](https://developers.notion.com/).

## The data model
### Chores
The master list of chores. Chore definitions are created here by the user, and are read by this script to populate the rolling assignments table.

- **Name**: *Title*. Name of the chore
- **Room**: *Select*. Where the chore happens
- **Frequency**: *Select*. How often (default (and only currently supported) is Weekly).
- **Assignees**: *Multi-select*. The full list of people who can do this chore.
- **Notes**: *Text*. Any additional info.

### Assignments
The place where current chore assignments appear. This table is primarily written to by this script, with the exception of the checkboxes, which users click as they complete the chores.

- **Done**: *Checkbox*. Checked when the current instance of the chore is complete.
- **Chore**: *Relation*. The connection between this table of Chores.
- **Assignee**: *Text*. Whose turn is it to do this chore.
- **Due**: *Date*. When is this instance due.
- **Name**: *Title*. Required by Notion, but not used in this program.


# Coming soon
Right now only weekly chores are supported, but we'll get other frequencies up and running soon.


# Setup
1. Get your ENV variables set up. You need 3:
   - `NOTION_API_SECRET` - your [Bearer token for Notion API access](https://developers.notion.com/docs/authorization)
   - `CHORES_DATABASE_ID`
   - `ASSIGNMENTS_DATABASE_ID`
2. [Install dependenciess in a local vendor/ folder](https://docs.aws.amazon.com/lambda/latest/dg/ruby-package.html). This is needed for bundling them all together for simple AWS Lambda deploy. If you're deploying some other way, you can install normally.


# Deployment on AWS
To manually deploy this to AWS as a zip file:

1. Run `make`
2. Open up the AWS Lambda console in a web browser
3. In the web console, click "Upload from" > "zip file"
4. Select dist/function.zip
