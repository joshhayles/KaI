# Projects

> **TL;DR:** A project is work that spans multiple sessions. Each project has a README that gets you coding in under 60 seconds. The filesystem is the state machine — directory = status.

---

## What Is a Project?

A project is work that spans multiple sessions and needs context preservation between them. Each project lives in its own directory with a README that serves as the single source of truth. If it's a single-session task, it doesn't need a project — just do it.

---

## Lifecycle

```
idea → planned → active → completed
                   ↓
                 paused → active (resumed) or archived
                   ↓
                archived (killed — with explanation)
```

| State | Meaning | Directory |
|---|---|---|
| **Idea** | "This might be worth doing." No commitment. | `kai/projects/ideas/` |
| **Planned** | Committed but not started. Has Purpose + Success Criteria. | `kai/projects/planned/` |
| **Active** | Someone is working on this. Updated every session. | `kai/projects/active/` |
| **Completed** | All success criteria met. Learnings captured. | `kai/projects/completed/` |
| **Paused** | Intentionally stopped. Reason documented. | Stays in `active/` with Status: Paused |
| **Archived** | Killed or abandoned. Reason documented. | `kai/projects/archive/` |

**Moving a project is physical:** `mv kai/projects/active/my-project kai/projects/completed/my-project`. The directory IS the status.

**Keep the INDEX updated.** `kai/projects/INDEX.md` is the quick-reference for all projects across all lifecycle states. When you create, move, or complete a project, update the INDEX. The INDEX is a table — not a narrative. One row per project with status, type, date, and a one-line summary.

**"Blocked" is not a state.** A blocked task is a property of a Next Step, not the project. If ALL tasks are blocked, pause the project with a blocker note.

---

## Phase 00 Is Always Planning

**Phase 00 = planning. Always. Implementation starts at Phase 01.**

Every project begins with a planning phase, even if it's brief. Phase 00's deliverables are the project docs themselves — the README, phase specs, and any key decisions. Once those exist, Phase 00 is complete.

**The rule: always plan, don't over-plan.** A minimal Phase 00 might be nothing more than the README itself. A complex Phase 00 might include phase specs, architecture decisions, and dependency analysis. Scale the planning to the project — but never skip it.

---

## Minimum Viable Project

The smallest useful project README (~20 lines):

```markdown
# Project Name

**Status:** Active
**Type:** Production
**Created:** YYYY-MM-DD

---

## Purpose

[What problem does this solve? Why now? 2-3 sentences max.]

---

## Success Criteria

- [ ] Observable outcome 1
- [ ] Observable outcome 2

---

## Next Steps

1. [What to do RIGHT NOW]
2. [Next item after that]
```

**When NOT to create a project:** Single-session tasks (bug fix, small feature, config change). Just do it.

See [templates/project-readme.md](templates/project-readme.md) for the full template.

---

## How to Resume a Project

1. Read `kai/projects/active/{project}/README.md`
2. Check Current Status / Phase Status
3. Read Next Steps
4. Start working
5. Update Next Steps when done

**The README contains everything you need.** If it doesn't, the README needs updating — not a longer onboarding conversation.

---

## How to Complete a Project

1. Check all success criteria (or explicitly mark descoped items with reason)
2. Write Learnings section (even if it's "nothing surprising")
3. Recycle knowledge (see below)
4. Update status to Completed, add completion date
5. Move to `kai/projects/completed/`
6. Update `kai/projects/INDEX.md`

---

## Knowledge Recycling

Learnings that stay in a completed project README are useful — but only if someone reads that README again. **Knowledge recycling** moves insights from where they were discovered to where they'll be used next.

When completing a project, ask: "Did we learn anything that should live somewhere more visible?"

| What You Learned | Where to Recycle It |
|---|---|
| A decision pattern you'll reuse | `kai/domains/{topic}/` or a route doc |
| Something about the developer's skill level | `kai/profile.md` |
| A tool or approach that worked well | Project README (stays) + relevant domain doc |
| An architectural insight | The codebase's own docs or a domain doc |
| A mistake worth remembering | Learnings section (stays in the completed project) |

Not every learning needs recycling. If it only matters for that project, let it stay in the completed README. Recycle when the insight applies beyond the project it came from.

**The goal:** Completed projects make future projects smarter — not just by existing, but by feeding their insights back into the system.

---

## What Goes in the README vs. Elsewhere

**In the README (navigation map, ~80-150 lines):**
- Current status and phase progress
- Next steps (actionable, specific)
- Success criteria (checkboxes)
- Quick links to detailed docs
- Key decisions (1-2 sentences each)

**Elsewhere:**
- Full strategy/business context → `project-overview.md`
- Implementation details → `phases/*.md`
- Decision rationale and analysis → `decisions/*.md`
- Session transcripts → Don't store these (use git log)

**The golden rule:** A README is a navigation map, not an encyclopedia.

---

## Project Structure

### Minimal (simple tasks)
```
kai/projects/active/{project-name}/
└── README.md
```

### Complex (multiple phases)
```
kai/projects/active/{project-name}/
├── README.md
├── decisions/
│   └── *.md
└── phases/
    ├── phase-00-planning.md
    ├── phase-01-*.md
    └── phase-02-*.md
```

Not all projects need all files. Simple bug fix? Just README.md. Multi-phase feature? README.md + phases/ + decisions/.

---

## Project Types

| Type | Goal | Description |
|------|------|-------------|
| **Production** | Ship features/fixes | Real work that affects users or systems |
| **Learning** | Build understanding | Hands-on practice with new concepts or tools |
| **Discovery** | Evaluate a tool/tech | Narrow scope, clear outcome: Adopt / Reject / Watch |

Match detail level to project type. Audits need item tracking. Feature builds don't. Learning projects benefit from a "Current Understanding" section.

---

## Patterns

**Do:**
- Update Next Steps every session — it's the most perishable section
- Capture decisions when they happen (you'll forget the reasoning later)
- Write Learnings at completion (you don't have perspective mid-project)
- Keep READMEs under 150 lines — link to sub-docs for detail
- Document why you stopped when pausing or archiving

**Don't:**
- Use the README as a changelog ("Session 3: did X, Y, Z") — that's git history
- Over-spec Phase 00 — if planning takes longer than implementation, you're overthinking it
- Leave dead projects in active/ — if 3+ sessions pass without progress, pause or archive it
- Embed implementation details in the README — use phases/ docs
- Archive without explaining why — this causes future sessions to re-propose the same idea
