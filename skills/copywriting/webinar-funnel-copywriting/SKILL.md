---
name: webinar-funnel-copywriting
description: Write complete free or paid webinar funnel copy.
version: 0.2.0
author: Minh Duc (minhduc6560-gif), Hermes Agent
license: MIT
platforms:
- linux
- macos
- windows
metadata:
  hermes:
    tags:
    - agency
    - copywriting
    - webinar
    - registration
    - reminders
    - offer
    related_skills: []
---

# Webinar Funnel Copywriting Skill

Use this skill to write production-ready copy for a free or paid live, evergreen, or hybrid webinar funnel. Every registration-page creation run must include exactly three complete Hero Section options with genuinely different persuasion angles.

This skill writes copy. It does not schedule automations, calculate from an unconfirmed event time, configure webinar software, build pages, design slides, or invent event and offer details.

## When to Use

Use for:

- Free or paid webinar registration funnels.
- Live, evergreen/on-demand, or hybrid webinar experiences.
- Workshop or masterclass registration when the main experience is a teaching event.
- Registration, confirmation, calendar, reminder, join-now, replay, and approved offer copy.
- Review and improvement of an existing webinar funnel.

Do not use for:

- A non-event lead magnet - use `lead-funnel-copywriting`.
- A direct sales page unrelated to webinar registration - use `sales-page-copywriting`.
- Webinar platform setup, calendar integration, CRM automation, or tracking.
- Banner concepts, slide design, or visual prompts - hand these off to a designer or a visual-design skill.

## Prerequisites

Read the client/project source of truth and approved event brief. If a shared copywriting or brand-voice skill is available, load it. Otherwise apply this skill's anti-AI-slop and factual-safety rules directly; do not block the task because an optional related skill is unavailable.

Read:

- `assets/brief-template.md` when critical input is missing.
- `references/webinar-funnel-structures.md` before drafting the page.
- `references/sequence-timing-guide.md` before writing live reminders.
- `templates/output-template.md` before preparing the deliverable.

## Required Inputs

### Critical

1. Client/project.
2. Access behavior: live, evergreen, or hybrid.
3. Commercial type: free or paid.
4. Webinar title/topic.
5. Target audience and ICP.
6. Core problem and learning outcome.
7. Host/speaker identity with approved credentials.
8. Main registration CTA.
9. Date, start time, and timezone for live events, or exact access behavior for evergreen events.
10. Brand voice or approved writing samples.

### Paid Webinar Critical Inputs

11. Price and currency.
12. Inclusions and offer.
13. Payment terms/method.
14. Refund/guarantee policy when applicable.
15. Real deadline, capacity, bonuses, and eligibility only when approved.

### Strongly preferred

16. Agenda or teaching points.
17. Duration and platform.
18. Approved proof/testimonials.
19. Replay rule.
20. meeting platform/access link.
21. community channel group name/link and QR asset.
22. Calendar link.
23. Approved post-webinar next step.
24. Optional output path.

If more than 3 critical inputs are missing, ask once using `assets/brief-template.md`. If safe drafting is possible, mark every gap as `[CẦN BỔ SUNG: ...]`.

Never guess a date, time, timezone, link, credential, replay rule, capacity, price, bonus, guarantee, deadline, payment term, or offer condition.

## Fixed Output Contract

Every new registration-page run includes:

1. Exactly three complete Hero Section options with different persuasion angles.
2. A full registration page using the approved seven-section base structure.
3. Registration form microcopy.
4. Confirmation page with approved community channel and calendar actions.
5. For a live webinar, use the default reminder schedule unless the approved brief explicitly supplies another schedule.
6. For a paid webinar, the free-webinar base structure plus pricing, offer, payment, and approved conditions.

Three Heroes are mandatory in every output. The agent may recommend one but must retain all three for the reviewer to assess.

## Procedure

### Step 1 - Lock webinar facts

Create an event fact table containing:

- Live/evergreen/hybrid behavior.
- Free/paid type.
- Title, audience, ICP, and promise.
- Agenda.
- Host and approved credentials.
- Date, start time, timezone, duration, and platform.
- Access, meeting platform, calendar, community channel, and QR assets.
- Replay rule.
- Price, offer, payment terms, bonuses, guarantee, deadline, capacity, and eligibility when paid.
- Approved next step.
- Missing or conflicting facts.

Completion criterion: every time-sensitive and commercial statement traces to an approved value or explicit placeholder.

### Step 2 - Select the structure

Use `references/webinar-funnel-structures.md` to combine two independent dimensions:

- Access behavior: live, evergreen, or hybrid.
- Commercial type: free or paid.

Use the seven-section free-webinar base. For paid webinars, add the approved pricing/offer/conditions section without removing the base sections.

Completion criterion: the structure matches the real event behavior and commercial terms without false liveness or scarcity.

### Step 3 - Write exactly three Hero Sections

Each Hero must be complete and include:

- Optional eyebrow only when supported.
- Headline.
- Subheadline.
- Event/access facts.
- CTA.
- Essential reassurance or paid price cue when appropriate.

Use three genuinely different persuasion angles, for example:

1. Outcome or transformation.
2. Problem or urgency grounded in approved facts.
3. Mechanism, expert authority, or distinctive event experience.

Do not create cosmetic rewrites. All Heroes must remain factually identical about the event and offer.

Completion criterion: exactly three complete Heroes exist, each with a distinct angle and no unsupported claim.

### Step 4 - Write the full registration page

Follow the seven-section base:

1. Hero - use the selected Hero after showing all three options.
2. Why attend - answer why the ICP needs this webinar.
3. Benefits.
4. Timeline/agenda.
5. Who the webinar is for.
6. Event details and registration form - concise fact bullets plus form copy.
7. Expert profile using approved credentials.

For paid webinars, append the pricing/offer/conditions section from approved facts. Place it where the page flow supports a payment decision and repeat the paid CTA only when useful.

Completion criterion: the page explains the event, ICP relevance, benefits, agenda, fit, logistics, authority, and - when paid - the exact commercial offer.

### Step 5 - Write confirmation page and immediate email

Include:

- Registration/payment status stated accurately.
- Event date/time/timezone or evergreen access behavior.
- Invitation to the approved community channel group with button/link and QR placeholder.
- calendar action/link.
- Join/access behavior or placeholder.
- Preparation notes when supplied.
- Optional approved next product CTA only when explicitly in scope.

Completion criterion: registrants know their status and can complete the immediate community channel/calendar/access actions.

### Step 6 - Build the live reminder schedule from the event time

Use `references/sequence-timing-guide.md`. For live events, derive exact send date, local time, and timezone from the approved event start:

- 1-2 warm-up emails within the 5-7 days before the webinar.
- T-3 days.
- T-1 day.
- T-5 hours.
- T-1 hour.
- T-15 minutes.

Use these countdown intervals as defaults unless the approved brief explicitly changes them. If the funnel launches after a slot has passed, mark that message `SKIP - timing passed`; never send it retroactively. The T-5-hour email includes the meeting platform link placeholder and preparation guidance. The T-15-minute email states that the room is open and invites check-in.

Completion criterion: each live reminder has an exact timestamp, correct timezone, objective, final body, and link placeholder; no scheduled send falls after its intended countdown point.

### Step 7 - Write post-webinar and conditional follow-up

Separate attendee and no-show copy. Add replay messages only when a replay exists. Add an offer follow-up only from approved price, bonus, guarantee, deadline, eligibility, and payment terms.

Completion criterion: no segment receives copy that contradicts its behavior or unapproved terms.

### Step 8 - Add outline or pitch only when requested

If in scope, separate teaching from offer transition. Do not fabricate teaching material, stories, case studies, or speaker experience.

Completion criterion: optional presentation copy uses supplied subject-matter sources and is separate from funnel copy.

### Step 9 - Review and handoff

Follow `templates/output-template.md`. Save only when the user supplied an output path; otherwise return the deliverable in chat and include asset inventory, exact reminder schedule, segmentation notes, and implementation owners. Do not claim the automation was configured.

Completion criterion: every asset has a segment, channel, timing, CTA/link, and owner.

## Anti-AI-Slop Gate

- Compare against approved brand/expert samples.
- Remove generic hype, robotic transitions, repeated patterns, inflated claims, and content that could fit any ICP.
- Make each section answer a real ICP question.
- Do not claim a voice match without a source sample.

## Pitfalls

1. **Cosmetic Hero variants:** three Heroes must use different persuasion angles, not synonym swaps.
2. **Reminder drift:** T-3d, T-1d, T-5h, T-1h, and T-15m are fixed approved countdown points.
3. **Loose warm-up timing:** schedule 1-2 warm-ups inside the T-7d to T-5d window.
4. **Paid webinar under-specification:** never write price or conditions from assumptions.
5. **False liveness or scarcity:** match actual behavior and approved capacity/deadlines.
6. **Expired reminder sends:** skip passed slots instead of sending them late.
7. **Credential inflation:** use only approved profile information.
8. **Replay assumptions:** replay copy requires a confirmed replay rule.

## Verification

- Exactly three complete Hero Sections exist and use distinct angles.
- Free/paid and live/evergreen/hybrid are both explicit.
- The seven-section base registration page is complete.
- Paid pages include approved price, offer, payment, and conditions.
- Date, time, timezone, platform, and access instructions are consistent.
- Live reminders include 1-2 warm-ups in T-7d to T-5d, then exact T-3d, T-1d, T-5h, T-1h, and T-15m sends.
- Every live reminder has an exact timestamp or a justified `SKIP - timing passed` status.
- Confirmation includes approved community channel, QR, calendar, and access actions.
- Replay and offer copy exists only when authorized.
- No credentials, proof, price, capacity, urgency, scarcity, guarantee, legal text, or event facts were invented.
- Missing facts use explicit placeholders.
- Follow the punctuation conventions of the requested language and brand guide.
- Visual work is handed to the designer or visual-design workflow; implementation is handed to the page builder or CRM owner.
