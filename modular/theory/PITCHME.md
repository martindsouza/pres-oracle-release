---?color=black

# Theory

---

@snap[north span-100 text-center]
## Version Control
#### @css[text-italic](Most problems start here)
@snapend

@snap[midpoint span-100]
@quote[the management of changes to documents]([Wikipedia](https://en.wikipedia.org/wiki/Version_control))
@snapend



Note:
- How we store code determines how we move it
- Good VC practices are important to have
- Is NOT folders of v1/v2/v3 (could get a pic of this)
- Just because you're using Git or SVN doesn't mean you're using version control

---

@snap[north span-100 text-center]
## @css[text-red text-italic](Not) Version Control
@snapend


@ul[](true)
- Code in DB @note[Storing code within the DB]
- Folders for version (`/v1/`) @note[Copy and pasting folders for each iteration]
- Rename files (`..._v1.sql`)
@ulend

--- 
@snap[north span-100 text-center]
## Version Control
@snapend

@snap[midpoint]
@ul[no-list-style](false)
- @fa[terminal] `trunk` / `master`
- @fa[code-branch] `branches`
- @fa[tag] `tags`
@ulend

@snapend

Note:
- Trunk/Master: Where active code is done
- Branches: Features or patches
- Tags: Semantic versioning (major.minor.patch)
  - Anytime code leaves dev it should be tagged

---



--- 

@snap[west span-80]
@code[uml rawcode zoom-15](/src/uml/theory-sprint.puml)
@snapend

@snap[east span-20]
@uml[span-100 bg-white](/src/uml/theory-sprint.puml)
@snapend

@snap[south-west span-100]
@[3, zoom-20](~ 2 week sprint)
@[4, zoom-20](Prep, automation, etc. Usually done via script)
@[5, zoom-20](Dev to Test. _Manual process_)
@[6, zoom-20](Semantic versioning: `major.minor.patch`)
@[7, zoom-20](Cleanup: "empty" `/release`)
@snapend



---
@snap[north]
### @fa[folder-open] Structure
@snapend

@snap[midpoint text-06 span-100]

| Folder | Re-Runnable | Description | 
| --- | --- | --- |
| `/build` | @fa[ban] | Scripts to build release |
| `/data` |@fa[sync] | Re-runnable data scripts |
| `/packages` | @fa[sync] |Ex: `pkg_emp.pks` and `pkg_emp.pkb` |
| @css[text-red text-bold](`/release`) | @fa[times-circle] | _More Later_ |
| @css[text-grey](`/scripts`) | @fa[ban text-grey] | @css[text-grey](Common scripts  | / helpers for developers)  | 
| `/synonyms` | @fa[sync] | Synonyms |
| `/views` | @fa[sync] | Views | 
| `/www` | @fa[ban] | Web files (for APEX) |

@snapend

---


Structure: `/release`

- Managed by Devs
- Truncated after each release
- `_release.sql` stores release instructions


---?code=src/_release-highlight.sql&lang=sql zoom-07

@snap[north span-100]
`/release/_release.sql` Summary
@snapend

@snap[south span-100]
@[2-3, zoom-40](Issue specific data / table changes as most changes should have an associated ticket)
@[6-10, zoom-40](Re-runnable scripts. Can auto generate by scraping directories. Order usually doesn't matter)
@[13, zoom-40](Re-runnable data scripts are very useful to manage config tables)
@[16, zoom-20](Helps avoid managing order of re-runnable code)
@snapend

---

---?code=src/data_emp.sql&lang=sql zoom-04 code-power

@snap[north span-100]
Data Script Example
@snapend

@snap[south span-100]
@[2-5, zoom-30](Array to store all data in text)
@[8-9, zoom-30]("Define" data)
@[11-14, zoom-30](Loop over array and set `l_row`)
@[17-27, zoom-30](`merge` data)
@snapend

Note: 
- Goal isn't to memorize this but think about how you could implement such a technique (or similar) within your processes
---


### Release Process


