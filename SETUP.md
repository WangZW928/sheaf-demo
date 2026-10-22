# SETUP

Fill in the table before starting the project. Any other requirement for how the project is run may be added below it; every agent follows this file.

| | |
|---|---|
| Paper to formalize | 无（最小多 agent 通路演示）；目标为两个自明的自然数算术恒等式，见 GOAL.md |
| Lean project location | default `lean/` |
| Mathlib version | v4.35.0（rev `56a005855ea17e0b0958f73ec801ae140b0a1679`，与 SHEAF 基线一致） |
| Maximum concurrent subagents | 2（2 个 lead，每组 1 个 worker） |
| Early review of the target statements by the human | default no |
| Reasoning effort of the agents | `high`，全部会话（人类于 2026-10-22 指定；与 `~/.codex/config.toml` 的 `model_reasoning_effort` 一致） |

## 运行环境与本机约定

- 本机为 Windows 11 + WSL2（Ubuntu 24.04 x86_64）。所有会话与命令经
  SHEAF 仓库的 `environments/windows/run.sh` 进入环境（仓库本地 elan/venv/GNU 工具）。
- Agent CLI：Codex（tmux 会话内启动，见 coord/STATE.md 的 Plan）。
- 网络访问经本机代理 `http://127.0.0.1:7890`（环境变量 `http(s)_proxy` 传入会话；
  未写入 Git 配置、脚本默认值或 shell 启动文件）。下载 Lean/Mathlib 缓存需其可达。
- 项目无远端仓库；maintainer 只构建与提交，不推送。
- 本会话约定修改 contract（AGENTS.md、roles/、stages/）需人类逐次授权；
  本演示未授予整轮授权。
