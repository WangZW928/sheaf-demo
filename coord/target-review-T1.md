# Independent review of T1

_G2 lead, 2026-10-22; statement authored by G1, Challenge authored by the maintainer._

---

The T1 statement is faithful and may be locked. I inspected the current
[Challenge](../lean/Challenge.lean), [target module](../lean/Demo/Targets/T1.lean),
[goal](../GOAL.md), and the definitions in the pinned local Lean 4.35.0
sources. G2 did not write this target statement.

The source is `GOAL.md`, target table, T1, word for word:

> 对任意自然数 n，n + 0 = n

Both Challenge and the library state:

```lean
theorem Demo.T1 (n : Nat) : n + 0 = n := by
  sorry
```

The displayed `sorry` identifies the statement reviewed at stage 2;
replacing its proof does not change this review's subject. Its complete
proposition is `∀ (n : Nat), n + 0 = n`.

| Source component | Lean counterpart | Finding |
| --- | --- | --- |
| 对任意 | Universally quantified theorem parameter `(n : Nat)` | Every natural number is included |
| 自然数 n | `n : Nat` | Standard natural numbers including zero |
| n + 0 | Left side `n + 0` | The first summand is `n`, the second is zero |
| = n | Equality with right side `n` | Exact equality, with no weaker relation |
| No further assumptions | No hypotheses, typeclass parameters, positivity conditions, or bounds | Nothing added or dropped |

The following definition audit uses the installed source directory
`/home/wangzw/agent-workspace/Projects/SHEAF/.local/windows/elan/toolchains/leanprover--lean4---v4.35.0/src/lean/`.
All line numbers below refer to its `Init/Prelude.lean` unless another
file is named.

| Definition or notation | Checked source and meaning | Agreement with the goal |
| --- | --- | --- |
| `Nat` | Line 1357: inductive type with constructors `Nat.zero` and `Nat.succ` | The usual unbounded natural numbers, starting at zero |
| Numeric literal `0` | Lines 1388–1397: `OfNat`, with `instOfNatNat n` returning `n` | The natural-number zero; no alternative zero is introduced |
| `+` | `HAdd` at line 1478; `Add` at line 1636; `instHAdd` at line 1785; `instAddNat` at lines 1892–1893 selects `Nat.add` | Ordinary natural-number addition |
| `Nat.add` | Lines 1888–1890: `add a zero = a`, `add a (succ b) = succ (add a b)` | Standard addition; its zero equation proves this target |
| `=` | Line 73: inductive `Eq` with reflexivity constructor | Propositional equality of natural numbers |
| Universal quantification | The theorem parameter is a dependent function binder, ranging over all `Nat` | Exactly “对任意自然数” |

Neither file introduces a definition, notation override, instance override,
or additional assumption affecting this proposition. Neither needs an
explicit import: Lean's implicit `Init` supplies these standard objects,
which are also the natural numbers and addition used by the pinned
Mathlib revision `56a005855ea17e0b0958f73ec801ae140b0a1679`.
As a source cross-check, `Init/Core.lean:747` states
`Nat.add_zero (n : Nat) : n + 0 = n := rfl`, and
`Mathlib/Algebra/Group/Nat/Defs.lean:35` uses that theorem as the natural-number
right identity law.

At `n = 0`, the proposition reduces to `0 = 0`; at any successor, the same
defining zero equation applies. There is no excluded edge case and no
custom or hollow definition in the statement's dependency chain.

The reviewed Challenge SHA-256 is
`67216150f0aa4071ec4dd1d927a05efeff7e96db500d0fca4e81b3a9e1f5267f`.
This review remains valid when proofs alone are replaced; a later change
to the target type or any definition it uses requires a new review.
