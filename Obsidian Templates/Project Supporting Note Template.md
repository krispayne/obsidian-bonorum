<%*
// Prompt for data
const projectId = await tp.system.prompt("Parent Project ID (e.g., 46.02, 41.03)");
let supportingNoteId = projectId + ".00";
const supportingNoteName = await tp.system.prompt("Supporting Note Name (e.g., Home Theater Prep, Research Notes)");
const noteType = await tp.system.suggester(["Research", "Planning", "Ideas", "Resources", "Reference", "Documentation", "Other"], ["Research", "Planning", "Ideas", "Resources", "Reference", "Documentation", "Other"], false, "Note Type");
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
tR += "supporting_note_id: " + supportingNoteId + "\n";
tR += "supporting_note_name: " + supportingNoteName + "\n";
tR += "project_id: " + projectId + "\n";
tR += "note_type: " + noteType + "\n";
tR += "status: Active\n";
tR += "date_created: " + currentDate + "\n";
tR += "date_modified: " + currentDate + "\n";
tR += "tags: [project-support, projects]\n";
tR += "categories: []\n";
tR += "---\n";

// Change the title of the new note
if (tp.file.title.startsWith("Untitled")) {
  const title = supportingNoteId + " " + supportingNoteName;
  await tp.file.rename(title);
}
%>
# <% supportingNoteId %> <% supportingNoteName %>

**Project:** [[<% projectId %> <% projectName %>]]
**Type:** <% noteType %>
**Status:** Active

## Purpose
<!-- What is this note for? What questions is it trying to answer? -->


## Key Information
<!-- Main findings, decisions, or important details -->


## Research & Links
<!-- External resources, websites, articles, etc. -->
- 
- 
- 

## Ideas & Considerations
<!-- Brainstorming, options to explore, things to think about -->
- 
- 
- 

## Decisions Made
<!-- Any conclusions or decisions that came from this research -->
- 
- 

## Next Actions
<!-- What needs to happen next based on this information? -->
- [ ] 
- [ ] 
- [ ] 

## Related Notes
<!-- Links to other project notes, milestones, or external notes -->
- 
- 

## Notes & Updates
<!-- Ongoing thoughts, updates, changes over time -->

### <% currentDate %>
- Created note