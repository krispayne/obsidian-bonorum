<%*// prompt for data
const courseCode = await tp.system.prompt("Course code. (ART 1234)")
const courseName = await tp.system.prompt("Course name")
const instructor = await tp.system.prompt("Instructor name")
const instructorEmail = await tp.system.prompt("Instructor email")
const instructorPhone = await tp.system.prompt("Instructor phone")
const classLocation = await tp.system.prompt("Class location")
const classTimes = await tp.system.prompt("Class times. One per line. (Shift+Enter)", "e.g. MW 8:30am-11:15am", false, true)
const courseDuration = await tp.system.prompt("Course length in weeks. e.g. 16")
const courseDescription = await tp.system.prompt("Course Description")
const courseObjectives = await tp.system.prompt("Course Objectives. One per line. (Shift+Enter)", null, false, true)
const courseBreakdown = await tp.system.prompt("Breakdown: Week, Unit, Module, etc.: ")
// take multi-line string and split into array
classTimes = classTimes.split("\n")
courseObjectives = courseObjectives.split("\n")
// add input data to frontmatter
tR += "---\n"
tR += "category: [course-syllabus]\n"
tR += "cssclasses: [course-note, color]\n"
tR += "instructor: " + instructor + "\n"
tR += "instructorEmail: " + instructorEmail + "\n"
tR += "instructorPhone: " + instructorPhone + "\n"
tR += "classLocation: " + classLocation + "\n"
tR += "classTimes: [" + classTimes + "]\n"
tR += "courseName: " + courseName + "\n"
tR += "courseCode: " + courseCode + "\n"
tR += "courseDuration: " + courseDuration + "\n"
tR += "courseDescription: " + courseDescription + "\n"
tR += "courseObjectives: [" + courseObjectives + "]\n"
tR += "courseBreakdown: " + courseBreakdown + "\n"
tR += "---\n"
// change the title of the new note
if (tp.file.title.startsWith("Untitled")) {
  title = courseCode + ' - ' + courseName + " - Syllabus"
} await tp.file.rename(title) 
// encode a link to Things 3
const link = "things:///show?query=" + courseCode;
const encodedLink = encodeURI(link); -%>
# <% title %>

>[!metadata|publissy-yellow]
> **Professor**: <% instructor %>
> **Email**: <% instructorEmail %>
> **Phone**: <% instructorPhone %>
> **Course code**: <% courseCode %>
> **Course duration**: <% courseDuration %> weeks
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
See tasks in [Things](<% encodedLink %>)

### <% courseBreakdown %> \#:
1. Assignment
2. Quiz
3. etc.
