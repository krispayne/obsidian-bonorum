<%* 
const prompt = (await tp.system.suggester((item) => item.basename, app.vault.getMarkdownFiles())).basename
const file = tp.file.find_tfile(prompt)
const fileCache = app.metadataCache.getFileCache(file)
if (fileCache?.frontmatter?.instructor_name){ var instructor = fileCache.frontmatter.instructor_name}
if (fileCache?.frontmatter?.instructor_email){ var instructorEmail = fileCache.frontmatter.instructor_email}
if (fileCache?.frontmatter?.instructor_phone){ var instructorPhone = fileCache.frontmatter.instructor_phone}
if (fileCache?.frontmatter?.course_name){ var courseName = fileCache.frontmatter.course_name}
if (fileCache?.frontmatter?.course_code){ var courseCode = fileCache.frontmatter.course_code}
if (fileCache?.frontmatter?.course_breakdown){ var courseBreakdown = fileCache.frontmatter.course_breakdown}
const module = await tp.system.prompt("Enter the " + courseBreakdown + " number:")
tR += "---\n"
tR += "instructor: \"" + instructor + "\"\n"
tR += "instructor_email: " + instructorEmail + "\n"
tR += "instructor_phone: " + instructorPhone + "\n"
tR += "course_name: " + courseName + "\n"
tR += "course_code: " + courseCode + "\n"
tR += "course_breakdown: " + courseBreakdown + "\n"
tR += "categories: [weekly-note]\n"
tR += "cssclasses: [course-note, color]\n"
tR += "date_created: " + tp.date.now("YYYY-MM-DD") + "\n"
tR += "module_number: " + module + "\n"
tR += "module_topic: \"" + await tp.system.prompt("Module topic/title:") + "\"\n"
tR += "due_date: " + await tp.system.prompt("Due date (YYYY-MM-DD):") + "\n"
tR += "tags: [module, " + courseBreakdown.toLowerCase() + "-" + module + "]\n"
tR += "---\n"
await tp.file.move(file.parent.path + "/" + courseCode + " - " + courseBreakdown + " " + module) 
// encode a link to Things 3
const link = "things:///show?query=" + courseCode;
const encodedLink = encodeURI(link); -%>
>[!tip|publissy-yellow] Course:  [[<% prompt %>]]

>[!abstract|publissy-gold]+ <% courseBreakdown %> <% module %> Objectives
> **Learning Goals:**
> - [ ] 
> - [ ] 
> - [ ] 
> 
> **Success Criteria:**
> - How will you know you've mastered this material?

[Open course in Things](<% encodedLink %>)
# Assignments
1. Link to assignment
2. ...
<% tp.file.cursor() %><%* app.workspace.activeLeaf.view.editor?.focus(); %>

>[!tip|publissy-mint]+ Reflection & Review
> **Key Takeaways:**
> - What were the 3 most important concepts?
> 
> **Challenges:**
> - What did you struggle with and how did you overcome it?
> 
> **Applications:**
> - How does this connect to previous modules or real-world situations?
> 
> **Questions for Further Study:**
> - What questions emerged that you want to explore further?

