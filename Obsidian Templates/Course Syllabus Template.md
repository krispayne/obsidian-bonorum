<%*// prompt for data
const courseCode = await tp.system.prompt("Course code. (ART 1234)")
const courseName = await tp.system.prompt("Course name")
const instructor = await tp.system.prompt("Instructor name")
const instructorEmail = await tp.system.prompt("Instructor email")
const instructorPhone = await tp.system.prompt("Instructor phone")
const classLocation = await tp.system.prompt("Class location")
var classTimes = await tp.system.prompt("Class times. One per line. (Shift+Enter)", "e.g. MW 8:30am-11:15am", false, true)
const courseDuration = await tp.system.prompt("Course length in weeks. e.g. 16")
const courseDescription = await tp.system.prompt("Course Description")
var courseObjectives = await tp.system.prompt("Course Objectives. One per line. (Shift+Enter)", null, false, true)
const courseBreakdown = await tp.system.prompt("Breakdown: Week, Unit, Module, etc.: ")
// take multi-line string and split into array
classTimes = classTimes.split("\n")
courseObjectives = courseObjectives.split("\n")
// add input data to frontmatter
tR += "---\n"
tR += "categories: [course-syllabus]\n"
tR += "cssclasses: [course-note, color]\n"
tR += "instructor_name: [[" + instructor + "]]\n"
tR += "instructor_email: " + instructorEmail + "\n"
tR += "instructor_phone: " + instructorPhone + "\n"
tR += "course_location: " + classLocation + "\n"
tR += "course_times: [" + classTimes + "]\n"
tR += "course_name: " + courseName + "\n"
tR += "course_code: " + courseCode + "\n"
tR += "course_duration: " + courseDuration + "\n"
tR += "course_description: " + courseDescription + "\n"
tR += "course_objectives: [" + courseObjectives + "]\n"
tR += "course_breakdown: " + courseBreakdown + "\n"
tR += "date_created: " + tp.date.now("YYYY-MM-DD") + "\n"
tR += "semester: " + await tp.system.prompt("Semester (e.g., Fall 2024)") + "\n"
tR += "credits: " + await tp.system.prompt("Credit hours") + "\n"
tR += "tags: [syllabus]\n"
tR += "---\n"
// change the title of the new note
if (tp.file.title.startsWith("Untitled")) {
  title = "Syllabus - " + courseCode
} await tp.file.rename(title) 
// encode a link to Things 3
const link = "things:///show?query=" + courseCode;
const encodedLink = encodeURI(link); -%>
# <% title +': ' + courseName%>

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

### Week \#1:
1. Assignment
2. Quiz
3. etc.