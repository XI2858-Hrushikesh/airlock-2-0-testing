# Point 5 - Script output in logs

<instruqt-task id="logs"></instruqt-task>

1. Click **Check**. It fails on purpose and prints `REPRO-CHECK-STDOUT` / `REPRO-CHECK-STDERR`.
2. Click **Solve**. It prints `REPRO-SOLVE-STDOUT` / `REPRO-SOLVE-STDERR`.
3. On your laptop, run `instruqt lab logs --session <ID> --severity DEBUG --since -15m` and look for `REPRO`.
4. Workaround check: in the terminal, run `cat /tmp/check_debug.log`.
