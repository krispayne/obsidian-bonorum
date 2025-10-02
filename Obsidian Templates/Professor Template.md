---
categories:
  - Professors
date_created: <% tp.date.now("YYYY-MM-DD") %>
---
<%*
// prompt for instructor name
const instructor = await tp.system.prompt("Instructor name")
// change the title of the new note
if (tp.file.title.startsWith("Untitled")) {
} await tp.file.rename(instructor) 
-%>
# <% instructor %>

```base
filters:
  and:
    - instructor_name.contains("<% instructor %>")
    - categories.contains("course-syllabus")
properties:
  note.course_name:
    displayName: Course
  file.name:
    displayName: Syllabus
views:
  - type: table
    name: Courses
    order:
      - course_name
      - file.name

```
