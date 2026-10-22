# Final acceptance

_Maintainer verification, 2026-10-22T07:59:07.521289+00:00._

---

Both parts of `GOAL.md` hold for library commit
`4013a80166ab13db4093a6333f307265d6a4ad0e`. T1 and T2 are proved, with no axioms.
The final queue has no items, claims, pending landings or repairs.

| Requirement | Evidence | Result |
| --- | --- | --- |
| All target modules globally built | [Build record](final-build.json), [build log](final-build.log) | Green; artifacts published |
| Both targets accepted against Challenge | [Comparator transcript](comparator-acceptance.log), [configuration](../lean/comparator.json) | Exit 0; Lean kernel accepts |
| Exact target meanings | [Independent reviews](targets-review.md) | Both locked; no defect |
| Exact elaborated target types | `tools/target_types.sh check` | Both agree |
| Permitted axioms only | Final `#print axioms` output | Both have no axioms |
| No hollow definitions | `tools/hollow_defs.sh` | `SCANNED 0 definitions` |
| DAG and queue complete | [Completion audit](completion-audit.json), [queue](queue.md) | Both DAG targets complete; queue empty |

The final target check printed:

```text
'Demo.T1' does not depend on any axioms
'Demo.T2' does not depend on any axioms
All 2 target statements agree with lean/Challenge.lean.
```

`Demo.T1` is proved by reflexivity; `Demo.T2` applies `Nat.zero_add`.
There are no project definitions or added mathematical hypotheses.
The target library has zero `sorry` or `admit` expressions. The two
intentional placeholders in `Challenge.lean` are the fixed reference
statements, as required by stage 2; the solution imports neither of them.

## Comparator execution

The pinned Lean 4.35.0 toolchain provides `lake comparator`, the successor
recommended by the comparator repository.[^1] The run used its standard
`bubblewrap` sandbox and Lean kernel, with no sandbox bypass or supplied
exports. Its permitted axiom list is exactly `propext`, `Classical.choice`
and `Quot.sound`.

The acceptance project at `local/acceptance/` was extracted from
`git archive 4013a80166ab13db4093a6333f307265d6a4ad0e lean`. Its dependencies are separate
copies of the pinned package sources, excluding their shared build outputs.
The source bytes of the acceptance tree, current library and built commit
were compared; their hashes are in [completion-audit.json](completion-audit.json).
The final global build and comparator used separate copies; neither rebuilt
the shared Mathlib packages.

To repeat the comparator on the retained acceptance tree, from the project
root:

```bash
cd local/acceptance
../../../environments/windows/run.sh env \
  COMPARATOR_BWRAP="$(realpath ../bubblewrap/unpack/usr/bin/bwrap)" \
  lake comparator --config comparator.json
```

The comparator reported:

```text
Running Lean default kernel on solution
Lean default kernel accepts the solution
Your solution is okay!
```

The independently reviewed Challenge SHA-256 remains
`67216150f0aa4071ec4dd1d927a05efeff7e96db500d0fca4e81b3a9e1f5267f`.
Only proofs were changed after the statement reviews. Lean remains pinned
to v4.35.0 and Mathlib to `56a005855ea17e0b0958f73ec801ae140b0a1679`.
The contract files are unchanged. There is no remote, so no push is required.

[^1]: Lean comparator repository, deprecation notice recommending `lake comparator` for Lean 4.35.0 and later. https://github.com/leanprover/comparator#deprecation
