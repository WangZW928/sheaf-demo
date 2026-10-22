# Target statement reviews

_Independent reviews assembled by the maintainer, 2026-10-22._

---

Both target statements are locked. The green build `faa7f7044b` contains
both target declarations and both imports in `TargetsCheck.lean`.
`tools/target_types.sh check` passed for both elaborated types. Proof
acceptance is separate and remains subject to the final comparator run.

| Target | Statement author | Independent reviewer | Status |
| --- | --- | --- | --- |
| T1 | G1 worker | G2 lead | Locked; no defect |
| T2 | G2 worker | G1 lead | Locked; no defect |

The full reviews below retain each reviewer's source correspondence and
definition audit. Their original deliveries are
[target-review-T1.md](target-review-T1.md) and
[target-review-T2.md](target-review-T2.md). The statements use only the
pinned Lean core definitions of natural numbers, zero, addition and equality;
there are no project definitions to change their meanings.

## T1: review by G2

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

## T2: review by G1

_Reviewer: G1 lead, 2026-10-22. The reviewer wrote neither T2 nor Challenge._

---

The T2 statement in [Challenge.lean](../lean/Challenge.lean) faithfully
expresses the T2 row of [GOAL.md](../GOAL.md). No semantic defect was found;
the statement is locked for the definitions inspected below. This review
establishes statement fidelity; proof acceptance remains the comparator's
separate check.

| Source component | Lean counterpart | Assessment |
| --- | --- | --- |
| Exact T2 words: 对任意自然数 n，0 + n = n | `theorem Demo.T2 (n : Nat) : 0 + n = n` | Same proposition |
| 对任意自然数 n | `(n : Nat)`, universally quantified in the theorem type | Every natural number, including zero |
| No hypotheses beyond the domain | No other binder, hypothesis, section variable or typeclass parameter | None added or dropped |
| `0 + n` | Natural-number zero added on the left to `n` | Order preserved |
| `= n` | Equality in `Nat` with the same arbitrary `n` on the right | Whole conclusion preserved |

The statement uses Lean's existing mathematical objects, with no project
definitions or aliases. The pinned Lean v4.35.0 sources were inspected in
the local toolchain under `src/lean/Init/`:

| Expression | Definition inspected | Meaning |
| --- | --- | --- |
| `Nat` | `Prelude.lean:1357`, constructors `Nat.zero`, `Nat.succ` | Natural numbers starting at zero |
| `0 : Nat` | `Prelude.lean:1396`, `instOfNatNat` | The natural-number literal zero |
| `+` on `Nat` | `Prelude.lean:1785`, `instHAdd`; `Prelude.lean:1888-1893`, `Nat.add` and `instAddNat` | Addition with equations `a + 0 = a` and `a + succ b = succ (a + b)` |
| `=` | Kernel equality `Eq Nat` | Ordinary equality, with no quotient, approximation or alternate relation |

Thus the conventions for zero, successor and addition are the ordinary
natural-number conventions of the source. There are no differences to
justify and no hollow definitions. At `n = 0`, T2 states `0 + 0 = 0`;
successors remain unrestricted. The source contains no positivity,
finiteness or upper-bound assumption.

The compiled challenge was checked using
`lean/.sandbox/G1/Review/T2Types.lean` through `tools/lean_file.sh`.
With `pp.all`, `Demo.T2` has only `(n : Nat)` and concludes `Eq Nat`
applied to `HAdd.hAdd` with `instHAdd Nat instAddNat` and the natural zero
literal. A reflexivity check also confirms that its displayed proposition
`∀ n : Nat, 0 + n = n` is definitionally the same as
`∀ n : Nat, Nat.add Nat.zero n = n`. The file compiled successfully.

Reviewed Challenge SHA-256:
`67216150f0aa4071ec4dd1d927a05efeff7e96db500d0fca4e81b3a9e1f5267f`.
Changing only the target implementations' proofs does not change this
review. Changes to the statement or its referenced definitions require a
new review.

The subsequently landed [T2 implementation](../lean/Demo/Targets/T2.lean)
was inspected at green commit
`48804c925daf31335653f396b84584ce99b5f705`: it has exactly the same theorem
header, no explicit imports and no preceding definitions, variables,
notations or instances. Its stage 2 proof is still a named placeholder;
replacing that proof preserves this semantic review. The maintainer's
elaborated-type comparison must also pass before final acceptance.
