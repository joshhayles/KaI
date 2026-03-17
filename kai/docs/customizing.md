# Customizing KaI

> After onboarding, KaI works out of the box. This guide is for later — when you want to add routes, adjust your Claude's behavior, or expand your project structure.
> None of this is required. Start working first. Come back here when you feel the need.

---

## Adding Context Routes

During onboarding, you and your Claude built your initial routing table. As your project grows, add more:

```markdown
| Developer Says | Action |
|----------------|--------|
| "Let's work on the API" | Read `kai/domains/api/decisions.md` |
| "What's our test strategy?" | Read `kai/domains/testing/strategy.md` |
```

**When to add a route:** When you catch yourself re-explaining the same context more than once. That's the signal — capture it in a file and add a route.

**When NOT to add a route:** Don't create files "just in case." Add structure when you feel friction, not before.

---

## Domain Folders

If your project has distinct knowledge areas, create a `domains/` folder inside `kai/`:

```
kai/domains/
├── auth/           ← Architecture decisions, conventions
├── database/       ← Schema patterns, migration history
└── deployment/     ← Infrastructure, CI/CD
```

Each folder holds markdown files your Claude reads **only when the conversation enters that topic.** Start with one domain when you need it. Let it grow from there.

---

## Projects

### New Projects

```
kai/projects/active/my-feature/
└── README.md       ← Goal, current state, decisions, learnings
```

The README is the only required file. Your Claude reads it at session start when you reference this project — that's the bookmark. See [projects.md](projects.md) for the full guide on project lifecycle, templates, and best practices.

### Completing Projects

```bash
mv kai/projects/active/my-feature kai/projects/completed/my-feature
```

History stays. Your Claude can reference completed projects when relevant.

### Phases (Optional)

For larger projects, add phase folders with their own READMEs. Small projects don't need phases — use them when the scope outgrows a single README.

---

## Profile Updates

Your `kai/profile.md` evolves. Update it when:
- You're learning a new stack (helps your Claude teach at the right level)
- Your role or goals change
- You discover new preferences about how you work with AI

### Team Usage (Experimental)

KaI is designed for solo developers, but basic team support is possible. Multiple people in one repo can each have a profile:

```
kai/domains/alice/profile.md
kai/domains/bob/profile.md
```

For shared team conventions (coding standards, naming patterns, review process), create `kai/domains/team/conventions.md` and add a route in CLAUDE.md. Full team support is planned for a future release.

---

## Constitution Extensions

Principles 1–12 are the base. Don't modify them — extend after #12:

```markdown
### 13. Always Test First *(Repo Extension)*

Write tests before implementation in this repo.
```

Extensions are for principles specific to your project or team. The base has been tested across multiple production contexts — add to it rather than changing it.

---

## One Rule

**If the body of your CLAUDE.md is growing past ~100 lines, you need routes and domains, not a bigger file.** The template structure (routing tables, PRO section, behavior principles) is a fixed cost — it's the content you add on top that should stay lean. The whole point is selective loading. Keep the router lean. Put the content where it belongs.
