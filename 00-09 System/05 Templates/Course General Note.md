<%* const folder = tp.file.folder()
const [JDID, department, code] = folder.split(" ")
const courseCode = department + " " + code
tR += "---\n"
tR += "courseCode: " + courseCode + "\n"
tR += "category: [course-note]\n"
tR += "cssclasses: [course-note, color]\n"
tR += "---\n" 
const title = courseCode + " - " + tp.date.now("YYYY-MM-DD")
await tp.file.rename(title) -%>
# <% title %>

>[!tip|publissy-yellow] Course: <% courseCode %>

<% tp.file.cursor() %>
