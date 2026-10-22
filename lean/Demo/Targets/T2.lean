/-!
# Left-zero addition on natural numbers

Source: `GOAL.md`, target table, T2: 对任意自然数 n，0 + n = n.

Proof: Induct on the arbitrary natural number `n`. At zero, `0 + 0` reduces
to `0`. If `0 + k = k`, the successor defining equation gives
`0 + Nat.succ k = Nat.succ (0 + k) = Nat.succ k`, where the second equality
applies `Nat.succ` to the induction hypothesis. These cases prove the result
for every natural number, without additional hypotheses.
-/

/--
Source: `GOAL.md`, target table, T2.

Proof: Use induction on the arbitrary natural number `n`. Addition recurses
on its second argument, with defining equations `a + 0 = a` and
`a + Nat.succ b = Nat.succ (a + b)`. In the base case, `0 + 0` reduces to
`0`, so the equality is reflexivity. In the successor case, assume
`0 + k = k`. The successor equation gives
`0 + Nat.succ k = Nat.succ (0 + k)`. Applying `Nat.succ` to the induction
hypothesis gives `Nat.succ (0 + k) = Nat.succ k`. Combining the equalities
proves the successor case. Induction establishes the statement for every
natural number, including zero, with no positivity or upper-bound assumption.
-/
theorem Demo.T2 (n : Nat) : 0 + n = n := by
  sorry
