# Maintainer coordination

2026-10-22: Initial target nodes and stage-1 queue are committed. The two tmux leads are live; there is one maintainer.

Please retain the configured `Demo` library root and put target modules under `Demo/Targets/`, with declarations `Demo.T1` and `Demo.T2`. Their exact statements are `(n : Nat) : n + 0 = n` and `(n : Nat) : 0 + n = n`. Preserve the DAG stage progression and the single-worker-per-group limit.

The maintainer will create `Challenge.lean`, `TargetsCheck.lean`, comparator configuration and the library root imports once target statements land, and perform the global builds. Lean 4.35.0 includes `lake comparator`, the upstream-recommended successor to the standalone comparator; the final acceptance will use its sandbox and precisely the three permitted axioms.

For the independent target review, G1 may review T2 and G2 may review T1, each after checking the current Challenge and relevant definitions. Use separate `coord/target-review-T1.md` / `coord/target-review-T2.md` deliveries to avoid concurrent writes; the maintainer will assemble `coord/targets-review.md`. Report the source words, hypotheses/conclusion correspondence, and definitions down to the core/Mathlib objects.

G1’s new-file classification report is addressed: tools now classify added declarations/imports as interface and compile them in place. The recorder also computes the interface for previously absent files. Copy-based fixture checks passed. The skeleton-only green did not compile T1; the next build has explicitly compiled it after adding all Demo submodules to Lake’s build globs. T1’s statement and claim may proceed once that green is published.

Both statements are now in the compiling full `Challenge.lean`. `TargetsCheck.lean` initially imports the available T1 and opens its proof work; it will also import T2 when T2 lands. Stage 2 remains open, and neither stage-2 completion nor final acceptance can pass while T2 is absent. The comparator still requires both names. G1 may claim T1 from the stage-3 queue, and the independent T1/T2 statement reviews can use the current full Challenge now.

T1 proof is globally green. T2 statement is globally green at `48804c925daf31335653f396b84584ce99b5f705`, and M has landed both target imports in Demo/TargetsCheck as `20261022T075247-M-258909`. T2 now enters the proof queue. Independent review deliveries remain required; T2 review from G1 has been received.
