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
- Focus on what positive VCS is
- File based development
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

@snap[north]
## Guideline
@snapend


@snap[midpoint span-100]

@ul[no-list-style](true)
- @fa[calendar] ~2 week Dev sprints @note[This is a major culture change. Need to get business units on board. Can be tough but doable]
- @fa[code] Dev -> Test = @css[text-red text-italic](Manual release)@note[Each time code leaves development it's a release. Fix the srcutps]
- @fa[robot] Test -> ... = Auto release @note[Release from tags]
@ulend

@snapend


Note:
- This is a very simple outline for the process
- It's simplicity is what makes it doable.
- Need to get ALL people involved with the process on board

---

@snap[north span-60]
## Sprint Cycle
@snapend

@snap[west span-80]
@code[uml rawcode zoom-15](assets/src/uml/theory-sprint.puml?tags=process)
@snapend

@snap[east span-20]
@uml[span-100 bg-white](assets/src/uml/theory-sprint.puml)
@snapend

@snap[south-west span-100]
@[1, zoom-20](~ 2 week sprint)
@[2, zoom-20](Prep, automation, etc. Usually done via script)
@[3, zoom-20](Dev to Test. _Manual process_)
@[4, zoom-20](Semantic versioning: `major.minor.patch`)
@[5, zoom-20](Cleanup: "empty" `/release`)
@snapend

Note:
- When doing the manual release process if encounter errors fix them. Don't need to restart.


---
@snap[north]
### @fa[folder-open] Structure
@snapend

@snap[midpoint text-06 span-100]

| Folder | Re-Runnable | Description | 
| --- | --- | --- |
| `/build` | @fa[ban] | Scripts to build release |
| `/data` |@fa[sync] | Re-runnable data scripts * |
| `/packages` | @fa[sync] |Ex: `pkg_emp.pks` and `pkg_emp.pkb` |
| @css[text-red text-bold](`/release`) | @fa[times-circle] | _Release specific*_ |
| @css[text-grey](`/scripts`) | @fa[ban text-grey] | @css[text-grey](Common scripts  | / helpers for developers)  | 
| `/synonyms` | @fa[sync] | Synonyms |
| `/views` | @fa[sync] | Views | 
| `/www` | @fa[ban] | Web files (for APEX) |

@snapend


@snap[south span-100 text-06 text-left text-italic]
* = More later
Root path is either `master` (git) or `trunk` (svn)
@snapend

Note:

---

@snap[north span-100]
## Structure: `/release`
@snapend


@snap[midpoint span-100]

@ul[no-list-style](false)
- @fa[glasses] Managed by Devs
- @fa[trash-alt] Emptied after each release
- @fa[clipboard-list] `_release.sql` File to execute
@snapend

---?code=assets/src/_release-highlight.sql&lang=sql zoom-07

@snap[north span-100]
## `_release.sql`
@snapend

@snap[south span-100]
@[2-3, zoom-40](Issue specific data / table changes as most changes should have an associated ticket)
@[6-10, zoom-40](Re-runnable scripts. Can auto generate by scraping directories. Order usually doesn't matter)
@[13, zoom-40](Re-runnable data scripts are very useful to manage config tables)
@[16, zoom-20](Helps avoid managing order of re-runnable code)
@snapend

Note:
- Iissue specific items talk about "Alter table " etc
- Auto generated code put placeholders in the code to "START" and "END" place holders.

---?code=assets/src/data_emp.sql&lang=sql zoom-04 code-power

@snap[north span-100]
## `/data/` Script Example
@snapend

@snap[south span-100]
@[2-5, zoom-30](Array to store all data in text)
@[8-9, zoom-30]("Define" data)
@[11-14, zoom-30](Loop over array and set `l_row`)
@[17-27, zoom-30](`merge` data)
@snapend

Note: 
- Goal isn't to memorize this but think about how you could implement such a technique (or similar) within your processes

