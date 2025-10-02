<%*
// Prompt for data
const milestoneId = await tp.system.prompt("Milestone ID (e.g., 46.02.01, 41.03.02)");
const milestoneName = await tp.system.prompt("Milestone Name");
const projectId = await tp.system.prompt("Parent Project ID (e.g., 46.02, 41.03)");
const duration = await tp.system.prompt("Duration (number)");
const durationUnit = await tp.system.suggester(["Days", "Hours", "Weeks"], ["Days", "Hours", "Weeks"], false, "Duration Unit");
const responsibleParty = await tp.system.prompt("Who is responsible for this milestone?");
const currentDate = tp.date.now("YYYY-MM-DD");

// Try to find the project note and get its name
let projectName = "Project Name"; // fallback
try {
  const projectFiles = app.vault.getMarkdownFiles().filter(file => 
    file.basename.startsWith(projectId + " ") && file.basename.includes("Project Overview")
  );
  if (projectFiles.length > 0) {
    const projectFile = projectFiles[0];
    const projectMatter = app.metadataCache.getFileCache(projectFile)?.frontmatter;
    if (projectMatter?.project_name) {
      projectName = projectMatter.project_name;
    } else {
      // Fallback: extract from filename
      projectName = projectFile.basename.replace(projectId + " ", "").replace(" - Project Overview", "");
    }
  }
} catch (error) {
  console.log("Could not find project file, using fallback name");
}

// Add input data to frontmatter
tR += "---\n";
tR += "milestone_id: " + milestoneId + "\n";
tR += "milestone_name: " + milestoneName + "\n";
tR += "project_id: " + projectId + "\n";
tR += "status: Not Started\n";
tR += "start_date: \n";
tR += "end_date: \n";
tR += "duration: " + duration + "\n";
tR += "duration_unit: " + durationUnit + "\n";
tR += "estimated_cost: \n";
tR += "actual_cost: \n";
tR += "responsible_party: " + responsibleParty + "\n";
tR += "dependencies: []\n";
tR += "blocks: []\n";
tR += "date_created: " + currentDate + "\n";
tR += "date_modified: " + currentDate + "\n";
tR += "tags: [milestones, projects]\n";
tR += "categories: [Milestones, Projects]\n";
tR += "---\n";

// Change the title of the new note
if (tp.file.title.startsWith("Untitled")) {
  const title = milestoneId + " " + milestoneName;
  await tp.file.rename(title);
}
%>
# <% milestoneId %> <% milestoneName %>

**Project:** [[<% projectId %> <% projectName %>]]
**Status:** Not Started
**Responsible Party:** <% responsibleParty %>

## Timeline
- **Start Date:** 
- **End Date:** 
- **Duration:** <% duration %> <% durationUnit %>

## Budget
- **Estimated Cost:** $
- **Actual Cost:** $

## Dependencies
### This milestone depends on:
- None

### This milestone blocks:
- Nothing identified

## Scope
<!-- What exactly needs to be accomplished in this milestone -->


## Deliverable
<!-- What gets produced/completed at the end of this milestone -->


## Resources Needed
| Resource | Type | Est. Cost | Source | Status |
|----------|------|-----------|---------|--------|
|          |      |           |         |        |

## Tasks/Checkpoints
- [ ] Task 1
- [ ] Task 2
- [ ] Task 3
- [ ] Final review/approval

## Risks & Considerations
<!-- What could go wrong? What should we watch out for? -->


## Success Criteria
<!-- How will we know this milestone is truly complete? -->


## Progress Updates
| Date | Status | Notes | Next Steps |
|------|---------|-------|------------|
| <% currentDate %> | Not Started | Milestone created |  |

## Files & References
<!-- Links to relevant documents, images, external resources -->


## Notes
<!-- Specific notes about this milestone -->