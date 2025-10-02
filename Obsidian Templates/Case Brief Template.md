---
categories: case-brief
cssclasses: [literature-note, color]
tags: {% for i in tags %}
  - {{ i.tag | replace(" ", "-") }}{% endfor %}
  - irac-brief
citation: {{ citekey }}
court: {{ court }}
date_decided: {{ dateDecided }}
date_added: {{ dateAdded | format("YYYY-MM-DD") }}
date_created: {{ exportDate | format("YYYY-MM-DD") }}
case_name: {{ caseName }}
{%- if creators %}
authors:
{% for i in creators %}
  - {{ i.name }}{% endfor %}
{%- endif %}
citation-style: 00-09 System/04 Scripts/bluebook-law-review.csl
---
# {% if shortTitle %} {{ shortTitle }}{% else %}{{ caseName }}{% endif %}

> [!info]+ Case Caption & Citation
> - **Case Name:** {{ caseName }}
> - **Court:** {{ court }}
> - **Year Decided:** {{ date | format("YYYY") }}
> - **Citation Key:** {{ citekey }}
> - **Reporter:** {{ reporter }}
> - **Volume:** {{ reporterVolume }}
> - **Pages:** {{ firstPage }}
> - **Zotero**: [Open]({{select}})

{% persist "notes" %}{% if isFirstImport %}
## 1. Procedural History

*(Your first task after carefully reading the entire case: Brief synopsis of procedural history. Identify the court that authored the opinion - Supreme Court? State Supreme Court? U.S. District Court? Circuit Court of Appeals? Cite complete case name and legal citation including date. If trial court - was it based on trial or summary judgment? If appellate court - how did lower court decide?)*

## 2. Facts

*(Write brief summary of facts material to the issue before the court as noted by the court itself. Eliminate facts not relevant to court's analysis. Legal principles are defined by the situations in which they arise. Only include facts that are legally relevant - facts that had an impact on the case's outcome.)*

## 3. Issue

*(What is the question presented to the court? Usually only one issue, but sometimes more. What are the parties fighting about and asking the court to decide? State the factual and legal questions the court had to decide.)*

## 4. Rule(s)

*(Determine the relevant rules of law that the court uses to make its decision. These rules will be identified and discussed by the court. Don't just list the cause of action - what rule must the court apply to the facts to determine the outcome? There may be more than one relevant rule.)*

## 5. Application/Analysis

*(Most important portion: How does the court apply the rule to the facts and analyze the case? What does the court consider relevant given the rule of law? How does the court interpret the rule? Summarize the court's rationale in your own words - don't just repeat what the court said.)*

## 6. Conclusion

*(What was the final outcome of the case? In one or two sentences, state the court's ultimate finding.)*

---
{% endif %}
{% endpersist %}

## Related Cases & Notes

{% for relation in relations %}{% if relation.citekey %}[[{{relation.citekey}}]]{% if not loop.last %}, {% endif %}{% endif %}{% endfor %}

## Annotations
{% persist "annotations" %}
{% set annotations = annotations | filterby("date", "dateafter", lastImportDate) %}
{%- if annotations.length > 0 %}*Imported: {{ importDate | format("YYYY-MM-DD h:mm a") }}*
{% for a in annotations %}
> [!quote| {{ a.color }}] {%- if a.colorCategory == "Green" %} Fact {%- elif a.colorCategory == "Orange" %} Definition {%- elif a.colorCategory == "Blue" %} Rule {%- elif a.colorCategory == "Purple" %} Application {%- else %} {{ a.type | capitalize }} {%- endif %}
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
{%- endif %}

{% endpersist %}