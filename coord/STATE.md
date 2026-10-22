# STATE

The current state of the run. Only the launcher and the maintainer write here, each in its own section; everyone else reads it. Each section is rewritten to the present state, never appended to. Questions for the human go to `coord/HUMAN.md`, history to `coord/ledger.md`.

## Stages open

Written by the launcher at the start (`1-dag`), then kept current by the maintainer: every stage that has open or waiting items, since the stages overlap (`roles/maintainer.md` §6).

2-statements

## Plan

Written by the launcher: the names of the sessions of the project.

Agent CLI: Codex（`codex --dangerously-bypass-approvals-and-sandbox`，推理档位 high，
经 `environments/windows/run.sh` 进入环境）。规模：2 个 lead，每组至多 1 个 worker
（最大并发 subagent 数 2，见 SETUP.md）。

| Session | Role |
|---|---|
| `sheaf-project-maint` | maintainer（唯一） |
| `sheaf-project-lead-1` | lead，G1，至多 1 个 worker |
| `sheaf-project-lead-2` | lead，G2，至多 1 个 worker |

机器：单台 WSL2 主机，无远端；coord/sheaf.env 为项目设置，无 machines/ 覆盖。
