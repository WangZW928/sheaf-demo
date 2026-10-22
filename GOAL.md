# GOAL

Formalize the following results of 无（这是最小多 agent 通路演示，不是论文形式化；目标取自自然数算术的自明恒等式） with no `sorry`.

| Label in the paper | Statement in one line | Lean declaration | Module |
|---|---|---|---|
| T1 | 对任意自然数 n，n + 0 = n | `Demo.T1` | `Demo.Targets.T1` |
| T2 | 对任意自然数 n，0 + n = n | `Demo.T2` | `Demo.Targets.T2` |

Out of scope: 除 T1、T2 之外的全部数学内容；方法的文献审查；任何超出两条目标所需的定义或引理（按 SHEAF 的剪枝原则，不需要的从不证明）。

Completion criterion, both parts:

1. [Lean comparator](https://github.com/leanprover/comparator) accepts the library against `lean/Challenge.lean`: every target is proved with exactly the statement written there, with no axiom beyond `propext`, `Classical.choice`, `Quot.sound`.
2. Every statement in `lean/Challenge.lean`, read with the definitions it uses, means exactly what the statement in the paper means, as the review in `coord/targets-review.md` shows.
