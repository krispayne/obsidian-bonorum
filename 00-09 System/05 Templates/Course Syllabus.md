<%*// prompt for data
let courseCode = await tp.system.prompt("Course code. (ART 1234)")
let courseName = await tp.system.prompt("Course name")
let instructor = await tp.system.prompt("Instructor name")
let instructorEmail = await tp.system.prompt("Instructor email")
let instructorPhone = await tp.system.prompt("Instructor phone")
let classLocation = await tp.system.prompt("Class location")
let classTimes = await tp.system.prompt("Class times. One per line. (Shift+Enter)", "e.g. MW 8:30am-11:15am", false, true)
let courseDescription = await tp.system.prompt("Course Description")
let courseObjectives = await tp.system.prompt("Course Objectives. One per line. (Shift+Enter)", null, false, true)
// take multi-line string and split into array
classTimes = classTimes.split("\n")
courseObjectives = courseObjectives.split("\n")
// add input data to frontmatter
tR += "---\n"
tR += "instructor: " + instructor + "\n"
tR += "instructorEmail: " + instructorEmail + "\n"
tR += "instructorPhone: " + instructorPhone + "\n"
tR += "classLocation: " + classLocation + "\n"
tR += "classTimes: [" + classTimes + "]\n"
tR += "courseName: " + courseName + "\n"
tR += "courseCode: " + courseCode + "\n"
tR += "courseDescription: " + courseDescription + "\n"
tR += "courseObjectives: [" + courseObjectives + "]\n"
tR += "category: [course-syllabus]\n"
tR += "cssclasses: [course-note, color]\n"
tR += "---\n"
// change the title of the new note
if (tp.file.title.startsWith("Untitled")) {
  title = courseCode + courseName + " - Syllabus"
} await tp.file.rename(title) %>

>[!metadata|publissy-yellow]
> **Professor**: <% instructor %>
> **Email**: <% instructorEmail %>
> **Phone**: <% instructorPhone %>
> **Course code**: <% courseCode %>
> **Meeting location**: <% classLocation %>
> **Meeting times**: 
<%* for(var i in classTimes){tR += "> - " + classTimes[i] + "\n"} %>

>[!abstract|publissy-gold]+ Course Description and Objectives
> #### Description
> <% courseDescription %>
> #### Objectives
<%* for(var i in courseObjectives){tR += "> - " + courseObjectives[i] + "\n"} %> 

>[!requirements|publissy-mint]
> - books
> - supplies
> - pace

## Course Outline
See tasks in [Things](things:///show?id=) (get share link and delete this message)

### Week \#:
1. Assignment
2. Quiz
3. etc.