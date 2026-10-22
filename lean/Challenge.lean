/-!
# Fixed arithmetic challenge

Source: `GOAL.md`, target table, T1 and T2. Only the implicit Lean prelude is
needed to state these results. Proofs here intentionally remain placeholders;
the separately imported target library supplies the comparator's solution.
-/

/--
Source: `GOAL.md`, T1: 对任意自然数 n，n + 0 = n.

Proof: Fix any natural number n. Addition recurses on its second argument,
so n + 0 reduces to n and the equality follows by reflexivity.
-/
theorem Demo.T1 (n : Nat) : n + 0 = n := by
  sorry

/--
Source: `GOAL.md`, T2: 对任意自然数 n，0 + n = n.

Proof: Induct on n. At zero both sides reduce to zero. For a successor,
0 + succ k reduces to succ (0 + k); applying succ to the induction hypothesis
0 + k = k gives the result. There are no additional hypotheses.
-/
theorem Demo.T2 (n : Nat) : 0 + n = n := by
  sorry
