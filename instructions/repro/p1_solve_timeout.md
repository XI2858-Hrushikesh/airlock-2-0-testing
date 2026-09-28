# Point 1 - Solve cut off at ~30s

All four tasks set `timeout = "180s"` at task, condition and script level. A failure at ~30s is therefore **not** the HCL timeout.

**Before you start:**

- Write down the **session ID** and the **UTC start time**.
- On your laptop, run `instruqt lab logs --session <SESSION_ID> --severity DEBUG`.

Do the tasks in order. Time each Solve click from click to result.

---

## 1a - Control: one ~20s solve

<instruqt-task id="solve_control"></instruqt-task>

Click **Solve**.

**Expected:** it passes after ~20s.

Screenshot: the task in its passed state.

---

## 1b - One ~45s solve

<instruqt-task id="solve_long"></instruqt-task>

Click **Solve** and time it.

**Expected (bug):** it fails at ~30s ("Failed to fetch").

Screenshot: the error on the task.

Wait 30s, then run this in the terminal:

```
cat /tmp/solve_long.log; ls -l /tmp/solve_long.done
```

If the `done` line and the marker file are there, the script finished on the VM although the platform failed the solve.

Screenshot: the terminal output.

Click **Solve** again. Note whether it retries or the task stays stuck.

Screenshot: the result of the retry.

---

## 1c - Two ~20s solves (~40s together)

This is the customer's exact case.

<instruqt-task id="solve_multi"></instruqt-task>

Click **Solve**.

**Expected (bug):** it fails at ~30s.

Screenshot: the error on the task.

Then run:

```
cat /tmp/solve_multi.log
```

If `part2` never started, the later solve didn't run.

Screenshot: the terminal output.

---

## 1d - Workaround: long job started in the background

<instruqt-task id="solve_background"></instruqt-task>

Click **Solve**. It should return at once.

Screenshot: the task after Solve.

Wait ~90s, then click **Check**.

- **Passes:** the workaround is safe to recommend.
- **Fails:** run `cat /tmp/solve_bg.log; ps aux | grep sleep`. If the job was killed, remove this workaround from the customer reply.

Screenshot: the check result, plus the terminal output if it failed.

---

## CLI evidence

Run this from the repo folder on your laptop:

```
instruqt lab test <team>/<lab-slug>
```

**Expected:** it passes `solve_control`, then shows `Solving task "solve_long" FAIL ~29s ... 504 Gateway Timeout`.

Screenshot: the CLI output.
