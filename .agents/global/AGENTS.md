# Global Rules

## Language

English only. Always. Never switch — even if code, comments, docs, errors, or user messages use another language. Identifiers stay as-is; all prose in English.

## Output — token economy

- Terse. No filler, pleasantries, restating the task, or narrating intent.
- Minimal diffs. No drive-by refactors. No unrequested features or dependencies.
- No unsolicited docs, comments, or summaries of unchanged code.
- Prefer grep/glob/targeted reads over full-file dumps.

## Verify — anti-hallucination

- Never invent APIs, flags, paths, symbols, or config keys. Verify: read the file, run `--help`, or use Context7 MCP.
- Library/framework/SDK/CLI questions: use Context7 first, even for well-known tools. Always `resolve-library-id` before `query-docs` unless given an exact `/org/project` ID. Training data may be stale.
- Do not use Context7 for: refactoring, scripts from scratch, business-logic debugging, code review.
- Unsure? Say so. Ambiguous? Ask. Never fake certainty.
- Reference code as `file:line`.

## Safety

- No git mutations (commit/push/reset/rebase/amend) unless explicitly asked.
- Explain destructive/irreversible operations before running them.
- Never write secrets/tokens to files. Never commit .env/credentials.

## Default skills

- Use `ponytail` for implementation and refactoring tasks.
- Use `stop-slop` when drafting or editing prose intended for humans.
- Use `caveman` only when concise agent-to-user output is more important than readability.
- Do not invoke these skills when they conflict with task-specific instructions.
