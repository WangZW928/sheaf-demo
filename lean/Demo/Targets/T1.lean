/-!
# Right-zero addition on natural numbers

Source: `GOAL.md`, target table, T1: 对任意自然数 n，n + 0 = n.
-/

/--
Source: `GOAL.md`, target table, T1.

Proof: Fix an arbitrary natural number `n`. Natural-number addition recurses on
its second argument, with the zero branch returning its first argument. Thus
`n + 0` reduces to `n`, and the equality follows by reflexivity. This includes
`n = 0` and every successor without additional hypotheses.
-/
theorem Demo.T1 (n : Nat) : n + 0 = n := by
  rfl
