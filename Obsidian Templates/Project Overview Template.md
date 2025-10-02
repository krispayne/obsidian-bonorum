<%*
// Prompt for data - using only basic prompts first
const projectId = await tp.system.prompt("Project ID (e.g., 46.02, 41.03)");
const projectName = await tp.system.prompt("Project Name");
const projectType = await tp.system.suggester(["Home Renovation", "Work", "Personal", "Learning", "Community", "Creative", "Other"], ["Home Renovation", "Work", "Personal", "Learning", "Community", "Creative", "Other"], false, "Project Type");
const priority = await tp.system.suggester(["Low", "Medium", "High", "Critical"], ["Low", "Medium", "High", "Critical"], false, "Project Priority");
const budgetRelevant = await tp.system.suggester(["true", "false"], [true, false], false, "Budget relevant for this project?");
const primaryContact = await tp.system.prompt("Primary Contact/Lead Person");
const projectManager = "Kris Payne"
const currentDate = tp.date.now("YYYY-MM-DD");

// Add input data to frontmatter
tR += "---\n";
tR += "project_id: " + projectId + "\n";
tR += "project_name: " + projectName + "\n";
tR += "project_type: " + projectType + "\n";
tR += "status: Planning\n";
tR += "priority: " + priority + "\n";
tR += "start_date: \n";
tR += "target_end_date: \n";
tR += "actual_end_date: \n";
tR += "estimated_cost: \n";
tR += "actual_cost: \n";
tR += "budget_relevant: " + budgetRelevant + "\n";
tR += "primary_contact: " + primaryContact + "\n";
tR += "dependencies: []\n";
tR += "completion_percentage: 0\n";
tR += "project_manager: " + projectManager + "\n";
tR += "date_created: " + currentDate + "\n";
tR += "date_modified: " + currentDate + "\n";
tR += "tags: [projects]\n";
tR += "categories: [Projects]\n";
tR += "---\n";

// Change the title of the new note
if (tp.file.title.startsWith("Untitled")) {
  const title = projectId + " " + projectName;
  await tp.file.rename(title);
}
%>
# <% projectId %> <% projectName %>

## Project Overview
**Type:** <% projectType %>
**Status:** Planning
**Priority:** <% priority %>
**Project Manager:** <% projectManager %>

## Timeline
- **Start Date:** 
- **Target End Date:** 
- **Actual End Date:** 

## Budget
- **Estimated Cost:** $
- **Actual Cost:** $
- **Budget Relevant:** <% budgetRelevant %>

## Key People
- **Primary Contact/Lead:** <% primaryContact %>
- **Project Manager:** <% projectManager %>

## Dependencies
- None identified yet

## Scope of Work
<!-- Describe what this project entails -->


## Success Criteria
<!-- What does "done" look like? How will you know this project is successful? -->


## Milestones
![[Projects.base#Milestones]]


## Progress Log
| Date | Update | Next Steps |
|------|---------|------------|
| <% currentDate %> | Project created | Define milestones and next actions |

## Notes
<!-- General project notes, lessons learned, etc. -->