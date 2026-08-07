# Global Rules

## Language

English only. Always. Never switch, even if code, comments, docs, errors, or user messages use another language. Identifiers stay as-is; all prose in English.

## Output — token economy

- Terse. No filler, pleasantries, restating the task, or narrating intent.
- Minimal diffs. No drive-by refactors. No unrequested features or dependencies.
- No unsolicited docs, comments, or summaries of unchanged code.
- Prefer grep/glob/targeted reads over full-file dumps.

## Less Is More

- Deletion beats addition. A PR with more deletions than additions is a win.
- Before adding code, look for something to delete first.
- Challenge every addition. Ask twice before writing new code.
- Fewer files, fewer abstractions, fewer indirections.
- Tolerate duplication until the third occurrence. Then extract, and still question the abstraction.

## Coding

- Search first. Match existing patterns before introducing new ones.
- Domain-driven naming. Prefer types over primitives. Loop iterators are the only place for single-letter vars.
- Error handling: raise specific errors per module, propagate them, let callers decide.
- Trust internal code and framework guarantees. Validate only at system boundaries (user input, external APIs).
- Single responsibility per class, module, or function.

## Git

- Stage files explicitly with `git add <file>`.
- Small commits. One logical change per commit.
- Present tense imperative. Lowercase after prefix. No emojis.
- Commit messages describe the change itself, not the authorship.

## Verify — anti-hallucination

- Never invent APIs, flags, paths, symbols, or config keys. Verify: read the file, run `--help`, or use Context7 MCP.
- Library/framework/SDK/CLI questions: use Context7 first, even for well-known tools. Always `resolve-library-id` before `query-docs` unless given an exact `/org/project` ID. Training data may be stale.
- Do not use Context7 for: refactoring, scripts from scratch, business-logic debugging, code review.
- Unsure? Say so. Ambiguous? Ask. Never fake certainty.
- Reference code as `file:line`.

## Problem-Solving

1. Search the codebase for existing patterns.
2. Understand existing code before changing it.
3. Incremental changes, frequent testing.
4. Stuck after a few retries? Stop and ask.

## Scientific TDD

Apply to non-trivial implementations: bugs, debugging, thread safety, race conditions, new features.

Skip for: typo fixes, doc-only edits, IDE renames, single-line comment changes, config tweaks with no logic.

1. **Understand first.** Explain the problem to yourself. Surface knowledge gaps. Confirm assumptions before code.
2. **Failing test first.** Prove the problem exists on real production code. Let real behavior produce the failure; patched-out behavior proves nothing.
3. **Can't reproduce? Stop.** Wait for human input. Ask rather than guess.
4. **Verify RED.** Run the test. Confirm it fails for the right reason on the right code.
5. **Apply the minimal fix** in production code. Tests describe behavior; production code delivers it.
6. **Verify GREEN.** Run the test. Confirm it passes.
7. **Revert the fix, verify RED again.** Confirm the test catches regressions.
8. **One problem at a time.** Finish the cycle before starting the next.
9. **Change production code OR tests per step, not both together.** Keep one side honest.
10. **Baby steps.** Explore raw data first. Let the failing test dictate the next line. Let tests demand abstractions rather than anticipating them.

## Safety

- No git mutations (commit/push/reset/rebase/amend) unless explicitly asked.
- Explain destructive/irreversible operations before running them.
- Never write secrets/tokens to files. Never commit .env/credentials.

## Communication

- Direct feedback. Working solutions over theory.
- Use periods to separate ideas. Restructure sentences rather than reach for em dashes.
- Write like a human. Skip filler, corporate-speak, and hedging.

## Running tests and long commands

**Scope to what you touched.** Run the spec files for the changed code, nothing wider. A whole
engine or suite is a pre-review activity, batched with the linters — never a step in the loop.

**Budget the wait.** Give test commands a short timeout (~2 min). If it has not finished, kill it
and narrow the scope rather than wait it out. A 7-minute run that you sit through is 7 minutes of
my time too, and it almost never tells you more than the scoped run did.

**Background anything genuinely long** and keep working; do not block on it. Report when it lands.

**A slow full-suite run is a smell, not a duty.** If you find yourself needing one mid-flow, say why
in one line — usually it means the change is wider than it should be, and that is worth knowing.

## Default skills

- Use `ponytail` for implementation and refactoring tasks.
- Use `stop-slop` when drafting or editing prose intended for humans.
- Use `caveman` only when concise agent-to-user output is more important than readability.
- Use `debug-agent` when debugging behavior, outputs and bugs.
- Do not invoke these skills when they conflict with task-specific instructions.
