<%* const prompt = (await tp.system.suggester((item) => item.basename, app.vault.getMarkdownFiles())).basename
let week = await tp.system.prompt("Enter the week number:")
const file = tp.file.find_tfile(prompt)
const fileCache = app.metadataCache.getFileCache(file)
var instructor = "" , instructorEmail = "", instructorPhone = "", courseName = "", courseCode = ""
if (fileCache?.frontmatter?.instructor){ instructor = fileCache.frontmatter.instructor}
if (fileCache?.frontmatter?.instructorEmail){ instructorEmail = fileCache.frontmatter.instructorEmail}
if (fileCache?.frontmatter?.instructorPhone){ instructorPhone = fileCache.frontmatter.instructorPhone}
if (fileCache?.frontmatter?.courseName){ courseName = fileCache.frontmatter.courseName}
if (fileCache?.frontmatter?.courseCode){ courseCode = fileCache.frontmatter.courseCode}
tR += "---\n"
tR += "instructor: " + instructor + "\n"
tR += "instructorEmail: " + instructorEmail + "\n"
tR += "instructorPhone: " + instructorPhone + "\n"
tR += "courseName: " + courseName + "\n"
tR += "courseCode: " + courseCode + "\n"
tR += "category: [weekly-note]\n"
tR += "cssclasses: [course-note, color]\n"
tR += "---\n"
await tp.file.move(file.parent.path + "/" + courseCode + " - Week " + week) %>
>[!tip|publissy-yellow] Course:  [[<% prompt %>]]

>[!abstract|publissy-gold]+ Objectives
>  
> - What were the objectives for this week?
# Assignments
## Assignment 1
<% tp.file.cursor_append("Enter details of the assignment") %>
# Assessments
## Assessment 1


---
# Notes

>[!tip|publissy-mint]
> - What did you learn?
> - What did you struggle with?
> - How can you improve?
> - Noteworthy discussions?

