---
categories: 
  - literaturenote
cssclasses: [literature-note, color]
tags: {% for i in tags %}
  - {{ i.tag | replace(" ", "-") }}{% endfor %}
  - to-read
citation: {{ citekey }}
{% if itemType %}type: {{ itemType }}{% endif %}
{%- if itemType == "journalArticle" %}
journal: {{ publicationTitle }}{%- endif %}
{%- if itemType == "encyclopediaArticle" %}
encyclopedia: {{ encyclopediaTitle }}{%- endif %}
{%- if volume %}
volume: {{ volume }}{%- endif %}
{%- if issue %}
issue: {{ issue }}{%- endif %}
{%- if itemType == "bookSection" %}
book: {{ publicationTitle }}{%- endif %}
{%- if publisher %}  
publishers: {{ publisher }}{%- endif %}
{%- if place %}
location: {{ place }}{%- endif %}
{%- if pages %}
excerpt_pages: {{ pages }}{%- endif %}
{%- if DOI %}
doi: {{ DOI }}{%- endif %}
{%- if ISBN %}
isbn: {{ ISBN }}{%- endif %}
date_added: {{ dateAdded | format("YYYY-MM-DD") }}
date_created: <% tp.date.now("YYYY-MM-DD") %>
title: {% if shorttile %} "{{ shorttitle }}" {% else %} "{{ title }}" {% endif %}
archive: {% if archive %}{{ archive }}{% endif %}
archive_location: {% if archiveLocation %}{{ archiveLocation }}{% endif %}
---
{% persist "index" %}{% if isFirstImport %}
# {% if shorttitle %} {{ shorttitle }}{% else %} {{ title }}{% endif %}


>[!citation|seafoam]
> {{bibliography}}


> [!info]+ Metadata – {% for attachment in attachments | filterby("path", "endswith", ".pdf") %}[PDF{% if not loop.first %} {{loop.index}}{% endif %}]({{attachment.desktopURI|replace("/select/", "/open-pdf/")}}){% if not loop.last %}, {% endif %}{% endfor %}
> 
> - **Cite Key**: {{citekey}}
> - **Keywords**: 
> - **Notes**: {{markdownNotes}}
> - **Zotero**: [Open]({{select}})
> - **Related**: {% for relation in relations %}{% if relation.citekey %}[[@{{relation.citekey}}]]{% if not loop.last %}, {% endif %}{% endif %}{% endfor %}
> - **Creators**: 
{% for type, creators in creators | groupby("creatorType") -%}
{%- for creator in creators -%}
>   - {{"First" if loop.first}} {{type | capitalize}}: {%- if creator.name %} {{creator.name}} {%- else %} {{creator.lastName}}, {{creator.firstName}} {%- endif %}
{% endfor %}
{%- endfor %}


> [!abstract]- Abstract
> {% if abstractNote %} *{{abstractNote | nl2br}}* {% endif %}


> [!note]- Summary
> 

{% endif %}{% endpersist %}

## Annotations
{% persist "annotations" %}
{% set annotations = annotations | filterby("date", "dateafter", lastImportDate) %}
{% if annotations.length > 0 %}*Imported: {{ importDate | format("YYYY-MM-DD h:mm a") }}*

{% for a in annotations %}
> [!quote| {{ a.color }}] {{ a.type | capitalize }} 
{%- if a.annotatedText %}
> {{ a.annotatedText | nl2br }}
{%- endif %}
{%- if a.imageRelativePath %}
> ![[{{ a.imageRelativePath }}|250]]
{%- endif %}
{%- if a.ocrText %}
> {{ a.ocrText }}
{%- endif %}
{%- if a.comment %}
>
> **Comments:** *{{ a.comment | nl2br }}*
>
{%- endif %}
> ([p. {{a.page}}](zotero://open-pdf/library/items/{{a.attachment.itemKey}}?page={{a.pageLabel}}&annotation={{a.id}})) 
{% endfor %}
{% endif %}

{% endpersist %}
