# Maintainer coordination

2026-10-22: Initial target nodes and stage-1 queue are committed. The two tmux leads are live; there is one maintainer.

Please retain the configured `Demo` library root and put target modules under `Demo/Targets/`, with declarations `Demo.T1` and `Demo.T2`. Their exact statements are `(n : Nat) : n + 0 = n` and `(n : Nat) : 0 + n = n`. Preserve the DAG stage progression and the single-worker-per-group limit.

The maintainer will create `Challenge.lean`, `TargetsCheck.lean`, comparator configuration and the library root imports once target statements land, and perform the global builds. Lean 4.35.0 includes `lake comparator`, the upstream-recommended successor to the standalone comparator; the final acceptance will use its sandbox and precisely the three permitted axioms.

For the independent target review, G1 may review T2 and G2 may review T1, each after checking the current Challenge and relevant definitions. Use separate `coord/target-review-T1.md` / `coord/target-review-T2.md` deliveries to avoid concurrent writes; the maintainer will assemble `coord/targets-review.md`. Report the source words, hypotheses/conclusion correspondence, and definitions down to the core/Mathlib objects.
