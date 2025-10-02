<%* 
const folder = tp.file.folder()
const [frontMatter, code] = folder.split(" - ")
const [JDID, courseName] = frontMatter.split(" ")
tR += "---\n"
tR += "course_code: " + code + "\n"
tR += "categories: [course-note]\n"
tR += "cssclasses: [course-note, color]\n"
tR += "date_created: " + tp.date.now("YYYY-MM-DD") + "\n"
tR += "---\n" 
const title = code + " - " + tp.date.now("YYYY-MM-DD")
const syllabusLink = "[[Syllabus - " + code + "]]"
await tp.file.rename(title) -%>
# <% title %>
**Course**: <% syllabusLink %>

## Today's Topic
**Main Focus**: 

## Key Points
- 
- 
- 

## Discussion/Questions
- 
- 

## Action Items
- [ ] 
- [ ] 

## Connect to Readings
*Reference your Apple Books/Zotero annotations here*
- 

<% tp.file.cursor() %><%* app.workspace.activeLeaf.view.editor?.focus(); %>

## Post-Class Reflection
*Add this after class*
- Most important takeaway:
- Unclear concepts to review:
- Links to other course material: