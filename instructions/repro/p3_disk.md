# Point 3 - ubuntu:22.04 disk size

<instruqt-task id="disk"></instruqt-task>

1. Click **Check**. **Expected (bug):** it fails, because `/` is smaller than 5 GB.
2. In the terminal, run:

   ```
   df -h /; lsblk
   ```

   **Expected (bug):** `/` is about 2 GB while the disk is about 10 GB.
