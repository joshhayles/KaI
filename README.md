# KaI — Knowledge as Infrastructure

*(KaI rhymes with "eye")*

> Every morning, your AI is brilliant and brand new. It can build anything — but it doesn't remember what you've built together. It doesn't remember the decisions you've made. It loses valuable context. So I built something to fix it. It's called KaI.

CLAUDE.md is a great starting point — your AI reads it every session. But a single file can only take you so far. As your projects grow, your context grows, and a flat file can't deliver the right knowledge at the right moment. You end up loading everything or missing what matters.

KaI gives your AI structured knowledge about you, your projects, and your decisions — and loads only what's relevant for each session. Not everything at once. Not a pile of docs. Infrastructure that carries forward.

Setup is a 10-minute conversation. You say "Onboard me," talk about what you're building and how you work, and KaI produces a personalized setup. After that, every session starts where the last one left off.

Context that compounds into:
- An AI that remembers your architecture decisions from three months ago
- Sessions that pick up exactly where you left off — no re-explaining
- Teaching that knows what you've already mastered
- Knowledge that follows you across projects, repos, and tools

> **Note:** KaI is currently designed for solo developers working with Claude Code. Team support is planned.

---

## What Changes

| Without KaI | With KaI |
|---|---|
| Your AI remembers preferences but not history | Your AI reads your project goals, recent decisions, and established conventions — and picks up exactly where you left off |
| You re-explain decisions you already made | Decisions, context, and rationale are captured as you work — with the *why*, not just the *what* |
| Your AI gives the same explanations regardless of your level | Your AI knows your level and your preferences — it works the way you configured it, not a one-size-fits-all default |
| Sessions are independent | Every session builds on the last — new insights feed back into your context automatically |

---

## How It Works

KaI adds a `kai/` folder to your repo plus one file at root (`CLAUDE.md`). Everything is organized and self-contained.

```
your-repo/
  CLAUDE.md                     ← your AI reads this every session (routing + identity)
  kai/
    KAI-CONSTITUTION.md         ← 12 collaboration principles
    ONBOARD-ME.md               ← onboarding script (your AI reads this, not you)
    profile.md                  ← who you are (populated during onboarding)
    projects/                   ← your active work, decisions, learnings
    docs/                       ← guides, templates, examples
      projects.md               ← project lifecycle and best practices
      customizing.md            ← routes, domains, growing your setup
      templates/                ← copy-pasteable project and profile templates
      examples/                 ← fully populated CLAUDE.md example
```

Already have a `CLAUDE.md`? No problem — KaI detects it and creates `kai-CLAUDE.md` instead. During onboarding, your Claude helps you connect the two.

**Don't like KaI?** Just tell Claude "delete KaI" and it's gone. One folder removed, your repo is back to how it was.

| File | What It Does |
|------|-------------|
| **CLAUDE.md** | Your AI's identity, behavior, and routing table. Maps topics to context files — "when you say X, I load Y." |
| **kai/KAI-CONSTITUTION.md** | 12 principles that shape how your AI collaborates — teaching, context-loading, guardrails. |
| **kai/profile.md** | *(created during onboarding)* Who you are — experience, goals, how you work best. |
| **kai/projects/** | Your active work — goals, status, decisions, learnings. Your AI reads a project README and has full context in seconds. |
| **kai/docs/** | Project guides, templates, examples — reference material for you and your Claude. |

### The Routing Table

The routing table is the core of CLAUDE.md. Instead of loading everything, your AI matches what you're working on to the right context:

```
| Topic          | Context Loaded                         |
|----------------|----------------------------------------|
| "auth work"    | → kai/domains/auth/decisions.md        |
| "deploy"       | → kai/domains/deployment/runbook.md    |
| "API design"   | → kai/domains/api/decisions.md         |
```

*(These are examples — you build your own routes during onboarding and add more as your project grows. See [kai/docs/examples/CLAUDE-example.md](kai/docs/examples/CLAUDE-example.md) for a fully populated setup.)*

MCP and skills route your AI to the right *tool*. KaI routes your AI to the right *context about you*. And because KaI knows who you are, the same topic can load differently based on your preferences and skill level. That's developer-aware context routing.

### The Teaching System

Persistence is table one. KaI also teaches.

Three modes, configured during onboarding based on how you prefer to work:

- **Normal** (default) — your AI just works. Adapts to your configured preferences. If you said "just build," it builds.
- **Training** — say "let's learn" anytime. Your AI quizzes you, tracks understanding, runs structured learning sessions.
- **Build & Learn** — say "let's build and learn." Real work with learning woven in — explanations at decision points, not lectures.

If you're an execution-first developer who never wants to be quizzed, KaI respects that. If you want to be tested on every new concept, KaI does that too. You configure it once during onboarding.

---

## The Story

I'm a Solutions Engineer at Datadog who graduated from a coding bootcamp and transitioned into tech at 40. On the side, I built [Tax Corrector](https://taxcorrector.com) — a property tax protest SaaS — with AI as my only engineering team. Three Claude instances across three repos, shipping real features every week.

Early on, I tried solving the "AI amnesia" problem with more documentation. It helped — but I ended up with docs bloat. My AI was loading context it didn't need, and I was still repeating myself every session — the same preferences, the same protocols, the same project context. Sessions were getting slower, not smarter.

The answer wasn't more docs. It was routing — structured files that connect, load selectively, and grow as you work. Infrastructure, not documentation. KaI emerged from that realization, refined across months of daily production use with all three of my Claude instances.

I'm still learning, and this is one approach that's been working for me — I may be wrong about some of it. If you've found something better or have ideas to share, I genuinely want to hear about it.

---

## Getting Started

Run this from your project's root directory:

```bash
# 1. Install KaI
curl -fsSL https://raw.githubusercontent.com/joshhayles/KaI/main/kai-init.sh | bash

# 2. Open Claude Code and say:
# "Onboard me."
```

Or manually: clone the repo, copy the `kai/` folder and `CLAUDE.md` to your project root.

Your Claude walks you through a real conversation — not a form. Who you are, what you're building, how you want to work. It asks how you prefer to learn, whether you want explanations as you go or just want to build, and how much feedback you want. Then it produces a personalized setup: your profile, your routing table, your project structure. Everything lives in your repo, fully controlled by you.

After onboarding, just start working. Next session, your AI reads your profile and project state automatically — no setup, no re-explaining.

**The core principle:** You should be able to delete any AI session and start fresh with zero context loss. If something matters, it's in a file.

---

## What's Next

After onboarding:
- **[kai/docs/customizing.md](kai/docs/customizing.md)** — add routes, domains, and projects as your work evolves
- **[kai/docs/projects.md](kai/docs/projects.md)** — project lifecycle, templates, and best practices
- **"Let's learn"** — activate Training mode anytime
- **"Let's build and learn"** — real work with learning bookends
- **[kai/docs/examples/](kai/docs/examples/)** — see a fully populated CLAUDE.md

---

## Roadmap

| Phase | What | Status |
|-------|------|--------|
| **Core** | Constitution + routing + onboarding + developer-aware context | v0.1 (March 2026) |
| **Methodology** | Project lifecycle, templates, structured reflection | v0.2 (March 2026) |
| **KaI Integrations** | Developer-aware routing extended to MCP servers, workflows, and external tools | Planned |
| **Ecosystem** | Multi-AI coordination, cross-instance context sharing | Future |

---

## Contributing

KaI is early. If any of this resonates — or if you think I'm approaching it wrong — I'd love to hear from you. Open an issue, start a discussion, or reach out directly.

---

Built by [Josh Hayles](https://linkedin.com/in/joshhayles)

*KaI: Knowledge as Infrastructure — context that compounds.*
