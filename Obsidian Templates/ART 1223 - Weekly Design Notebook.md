<%* const folder = tp.file.folder()
const [JDID, department, code] = folder.split(" ")
const courseCode = department + " " + code
tR += "---\n"
tR += "courseCode: " + courseCode + "\n"
tR += "category: [course-note]\n"
tR += "cssclasses: [course-note, color, print]\n"
tR += "---\n" 
const title = courseCode + " - Weekly Design Notebook - " + tp.date.now("YYYY-MM-DD")
await tp.file.rename(title) -%>
# <% title %>

>[!tip|publissy-yellow] Course: <% courseCode %>

>[!Abstract]
> - Balance
>   - Symmetrical or Asymmetrical
>   - **List the type of balance you see in the composition**
>   - **Elaborate on the elements that create the visual weight of the design**
> - Proportion
>   - Contrast in size can create a sense of visual tension, depth, or movement
>   - **Describe the size relationship of the elements and any sense of tension, depth, or motion**
> - Sequence/Hierarchy
>   - A path for the eye to follow. Is there a sequence of events?
>   - **List the elements of the design in the sequence you believe the designer intended the viewer to follow.**
> - Unity
>   - Do the elements seem to belong together?
>   - **Describe the theme that you see.**
> - Emphasis
>   - What is the focal point? Where does the viewer look first?
>   - **Which part of the composition did you look at first? Why?**

<% tp.file.cursor() %>
insert image here

<div style="page-break-after: always;"></div>

# Balance


# Proportion


# Sequence/Hierarchy


# Unity


# Emphasis


