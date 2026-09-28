# Point 2 - VM volume mount

`sandboxes.hcl` mounts `./files` at `/opt/files`. There's no startup script, so nothing in the lab mounts it by hand.

<instruqt-task id="volume"></instruqt-task>

1. Click **Check**. **Expected (bug):** it fails.
2. Run this in the terminal:

   ```
   ls -la /opt/files; mount | grep -E '9p|/opt/files'; cat /sys/bus/virtio/drivers/9pnet_virtio/*/mount_tag; echo
   ```

   **Expected (bug):** `/opt/files` is missing or empty, nothing is mounted, and the tag is `volume_0`.

3. Workaround check:

   ```
   mkdir -p /opt/files && mount -t 9p -o trans=virtio,version=9p2000.L volume_0 /opt/files && cat /opt/files/hello.txt
   ```

4. Click **Check** again. It should pass now.
