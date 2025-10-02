---
categories: 
  - booknote
cssclasses: 
  - book-note
  - color
tags: {% for i in tags %}
  - {{ i.tag | replace(" ", "-") }}{% endfor %}
citation: "{{ citekey }}"
status: unread
{%- if title %}
title: "{{ title }}"{%- endif %}
{%- if shorttitle %}
shorttitle: "{{ shortitle }}"{%- endif %}
publishers: "{{ publisher }}"
authors: {% for creator in creators %}
  - {%- if creator.name %} {{ creator.name }} {%- else %} {{ creator.lastName }}, {{ creator.firstName }} {%- endif %}{% endfor %}
{%- if series %}
series: {{ series }}{%- endif %}
length: {{ numPages }}
date_published: {{ date | format("YYYY-MM-DD") }}
isbn: {{ ISBN }}
date_added: {{ dateAdded | format("YYYY-MM-DD") }}
date_created: <% tp.date.now("YYYY-MM-DD") %>
---
{% persist "index" %}{% if isFirstImport %}
# {{ title }}

>[!citation|seafoam]
> {{ bibliography }}

>[!info]+ Metadata
> - **Zotero**: [Open]({{select}})
> {% if series %}- **Series**: {{ series }}{% endif %}
> - **Related**:  {% for relation in relations %}{% if relation.citekey %}[[{{relation.citekey}}]]{% if not loop.last %}, {% endif %}{% endif %}{% endfor %}
> - **Author(s)**: 
{% for type, creators in creators | groupby("creatorType") -%}
{%- for creator in creators -%}
>   - {{"First " if loop.first}}{{type | capitalize}}: {%- if creator.name %} {{creator.name}} {%- else %} {{creator.lastName}}, {{creator.firstName}} {%- endif %}
{% endfor %}{%- endfor %}

>[!abstract] Description
> {% if abstractNote %} *{{abstractNote | nl2br}}*{% endif %}

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