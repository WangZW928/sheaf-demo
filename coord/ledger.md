# ledger

| Time | Result | Landings reverted | Fixes | Commit pushed |
|---|---|---|---|---|
| 2026-10-22T07:37:31.300544+00:00 | Initialized unsplit T1/T2 from GOAL.md; stage 1 open | — | Initial queue for the two leads | No remote |
| 2026-10-22T07:41:44.623026+00:00 | GREEN baseline; T1 DAG integrity checked and stage 2 opened | — | — | No remote; built `7284bac6e53dc9632289064542e283ed34ca7242` |
| 2026-10-22T07:42:49.289764+00:00 | Tool repair tested on a copy (7 fixture cases) | — | Allow M-owned Challenge/TargetsCheck landings and intentional Challenge restatements; retain library collisions and cycle checks | No remote |
| 2026-10-22T07:43:30.062188+00:00 | GREEN `d70c2fdbed` covered skeleton only; T1 coverage incomplete | — | Lake default root omitted new module; configure Demo and all submodules so the next build actually compiles T1 | No remote |
| 2026-10-22T07:44:23.239035+00:00 | G1 reported new-theorem landing wrongly classified proof; repaired and tested on copy | — | Interface scanner now includes added declarations/imports; landing recorder checks new files too. Classification checks and 7 fixture cases pass, including in-place compile/request verification | No remote |
| 2026-10-22T07:44:30.217363+00:00 | GREEN; T1 actually built and published (artifact checked); supersedes incomplete prior coverage | — | Tool defects repaired | No remote; built `d1c35733710b99d3e9f1dbb0e2b5075e3d675c56` |
| 2026-10-22T07:44:46.413004+00:00 | Stage 1 finished: both targets split with complete elementary proofs and exact core/Mathlib matches; DAG acyclic without missing/merged dependencies | — | Removed 1-dag from open stages | No remote |
| 2026-10-22T07:46:25.772324+00:00 | GREEN; M root set verified, unused generated Demo.Basic removed | — | Root now imports arithmetic target T1; no proof dependencies added | No remote; built `e4152dcf0a424e6243af31fe8c943c7047349de0` |
| 2026-10-22T07:48:45.505501+00:00 | Full two-target Challenge and initial TargetsCheck landed by M | — | Added both check roots to default Lake build; expose T1 proof while T2 statement delivery continues; all-target acceptance remains pending | No remote |
| 2026-10-22T07:48:57.860421+00:00 | GREEN; full Challenge and initial TargetsCheck compiled/published; stage 3 open for T1 | — | No new proof dependencies to import; two-node DAG unchanged | No remote; built `a731f370f24b392d2fde20f82a8f2098ba13883c` |
| 2026-10-22T07:51:17.628437+00:00 | GREEN; G1 T1 proof landing verified | — | No new imports or DAG dependencies; final all-target checks pending | No remote; built `11207013530e99e159fb51bd5a297c852566f52d` |
