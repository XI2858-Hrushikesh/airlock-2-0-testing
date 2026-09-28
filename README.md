# Airlock 2.0 repro – point 1 (solve cut off at ~30s)

This lab only tests point 1. The other points will be added one at a time.

| File | Purpose |
|---|---|
| `main.hcl` | lab, chapter, page |
| `sandboxes.hcl` | `vm "testvm"` (ubuntu:22.04) |
| `tabs.hcl`, `layouts.hcl` | terminal on the VM, 2-column layout |
| `pages.hcl` | page with the 4 tasks |
| `tasks.hcl` | 1a control 20s · 1b 45s · 1c 2×20s · 1d background workaround (all `timeout = "180s"`) |
| `scripts/task/solve_*` | solve and check scripts |
| `instructions/repro/p1_solve_timeout.md` | step-by-step page with screenshot points |

## Results

| Test | Session ID | Result |
|---|---|---|
| 1a 20s control | | pass/fail, __s |
| 1b 45s solve | | failed at __s, marker on VM y/n, retry possible y/n |
| 1c 2×20s solves | | failed at __s, part2 ran y/n |
| 1d background | | job survived y/n, check passed y/n |
| `lab test` | | output: |
