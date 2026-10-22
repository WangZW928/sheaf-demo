# T2 independent statement review

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
