# KaI — Knowledge as Infrastructure

*(KaI rhymes with "eye")*

> Every morning, your AI is brilliant and brand new. It can build anything — but it doesn't remember what you've built together. It doesn't remember the decisions you've made. It loses valuable context. So I built something to fix it. It's called KaI.

CLAUDE.md is a great starting point — your AI reads it every session. But a single file can only take you so far. As your projects grow, your context grows, your AI grows, and you need more than a file. *You need infrastructure.*

**Meet KaI 👁️‍🗨️**

KaI turns your AI into an assistant with persistence. It gives your AI a foundation that carries forward — who you are, what you're building, what's been decided, and what you both have learned. It loads what's relevant for each session, not everything at once. As you work, new insights get captured and fed back in. Every session starts smarter than the last.

Not knowledge as notes. Not knowledge as memory. Knowledge as **infrastructure** — the structural layer that makes everything above it work.

---

## What Changes

So you repeat yourself. Session after session, you re-explain the same context, re-state the same preferences, re-teach the same protocols. KaI fills that gap.

| Without KaI | With KaI |
|---|---|
| Your AI remembers preferences but not history | Your AI reads your project goals, recent decisions, and established conventions — and picks up exactly where you left off |
| You re-explain decisions you already made | Decisions, context, and rationale are captured as you work — with the *why*, not just the *what* |
| Your AI gives the same explanations regardless of your level | Your AI knows your experience level and teaches while it builds — brief context during the work, calibrated to what you already know |
| Sessions are independent | Every session builds on the last — new insights feed back into your context automatically |

---

## How It Works

KaI lives in your repo as structured files your AI knows how to use and navigate efficiently. Not a pile of docs — a system where each piece has a job.

| File | What It Does |
|------|-------------|
| **KAI-CONSTITUTION.md** | 12 principles that shape how your AI collaborates with you — teaching, context-loading, guardrails. The rules of engagement. |
| **CLAUDE.md** | Your AI's identity and routing logic. Points to what matters for **each** session — doesn't load everything at once. |
| **profile.md** | Who you are — your experience, goals, and how you learn best. Valuable context for your AI. |
| **projects/** | Your active work — goals, status, decisions, learnings. Your AI reads a project README and has full context in seconds, not minutes of re-explaining. |

The Constitution and CLAUDE.md come with KaI. Your profile and projects are created together during onboarding — that's what "Onboard me" kicks off.

---

## The Story

I'm a Solutions Engineer at Datadog who transitioned into tech at 40. On the side, I built [Tax Corrector](https://taxcorrector.com) — a property tax protest SaaS — with AI as my only engineering team. Three Claude instances across three repos, shipping real features every week.

Early on, I tried solving the "AI amnesia" problem with more documentation. It helped — but I ended up with docs bloat. My AI was loading context it didn't need, and I was still repeating myself every session — the same preferences, the same protocols, the same project context. Sessions were getting slower, not smarter.

The answer wasn't more docs. It was smarter structure — files that connect to each other, load selectively, and grow as you work. Infrastructure, not documentation. KaI emerged from that realization, refined across months of daily production use with all three of my Claude instances.

I'm still learning, and this is one approach that's been working for me — I may be wrong about some of it. If you've found something better or have ideas to share, I genuinely want to hear about it.

---

## Getting Started

```bash
# 1. Clone KaI into your project
git clone https://github.com/joshhayles/kai.git your-project/kai

# 2. Open Claude Code and say:
# "Onboard me."
```

Your Claude will walk you through a real conversation — who you are, what you're building, how you learn best. It produces a personalized setup: your profile, your project structure, your AI's identity. Everything lives in your repo, and is fully controlled by you.

After onboarding, just start working. Next time you open Claude Code, your AI reads your profile and project state automatically — no setup, no re-explaining. That's the compounding.

---

## Roadmap

| Phase | What | Status |
|-------|------|--------|
| **Core** | Constitution + CLAUDE.md + onboarding | In progress |
| **Methodology** | Project lifecycle, skill progression, structured reflection | Coming soon |
| **Ecosystem** | Multi-AI coordination, cross-instance messaging | Future |

---

## Contributing

KaI is early. If any of this resonates — or if you think I'm approaching it wrong — I'd love to hear from you. Open an issue, start a discussion, or reach out directly.

---

Built by [Josh Hayles](https://linkedin.com/in/joshhayles)

*KaI: Knowledge as Infrastructure*
