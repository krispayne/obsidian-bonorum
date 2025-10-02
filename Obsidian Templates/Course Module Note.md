<%* const prompt = (await tp.system.suggester((item) => item.basename, app.vault.getMarkdownFiles())).basename
const file = tp.file.find_tfile(prompt)
const fileCache = app.metadataCache.getFileCache(file)
if (fileCache?.frontmatter?.instructor){ var instructor = fileCache.frontmatter.instructor}
if (fileCache?.frontmatter?.instructorEmail){ var instructorEmail = fileCache.frontmatter.instructorEmail}
if (fileCache?.frontmatter?.instructorPhone){ var instructorPhone = fileCache.frontmatter.instructorPhone}
if (fileCache?.frontmatter?.courseName){ var courseName = fileCache.frontmatter.courseName}
if (fileCache?.frontmatter?.courseCode){ var courseCode = fileCache.frontmatter.courseCode}
if (fileCache?.frontmatter?.courseBreakdown){ var courseBreakdown = fileCache.frontmatter.courseBreakdown}
const module = await tp.system.prompt("Enter the " + courseBreakdown + " number:")
tR += "---\n"
tR += "instructor: " + instructor + "\n"
tR += "instructorEmail: " + instructorEmail + "\n"
tR += "instructorPhone: " + instructorPhone + "\n"
tR += "courseName: " + courseName + "\n"
tR += "courseCode: " + courseCode + "\n"
tR += "courseBreakdown: " + courseBreakdown + "\n"
tR += "category: [weekly-note]\n"
tR += "cssclasses: [course-note, color]\n"
tR += "---\n"
await tp.file.move(file.parent.path + "/" + courseCode + " - " + courseBreakdown + " " + module) 
// encode a link to Things 3
const link = "things:///show?query=" + courseCode;
const encodedLink = encodeURI(link); -%>
>[!tip|publissy-yellow] Course:  [[<% prompt %>]]

>[!abstract|publissy-gold]+ Objectives
>  
> - What were the objectives for this <% courseBreakdown %>?

[Open course in Things](<% encodedLink %>)
# Assignments
1. Link to assignment
2. ...
<% tp.file.cursor() %>

# <% courseBreakdown %> Notes

>[!tip|publissy-mint]
> - What did you learn?
> - What did you struggle with?
> - How can you improve?
> - Noteworthy discussions?

