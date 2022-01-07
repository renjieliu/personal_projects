Assuming to copy Termux environment from device A to device B

### Backup termux on device A and run below command one by one.
- `cd /data/data/com.termux/files`
- `tar -zcvf ./termux-backup_20211031.tar.gz home usr`
- `mv ./termux-backup_20211031.tar.gz /data/data/com.termux/files/home/myfiles_microsd/`

or combined togther

- `cd /data/data/com.termux/files && tar -zcvf ./termux-backup_20220107.tar.gz home usr && mv ./termux-backup_20220107.tar.gz /data/data/com.termux/files/home/myfiles_microsd/`

### Restore the termux on device B
- Copy the backup file from step 1 to device B
- Install the termux app on the android device
- Use a bluetooth keyboard to connect to the android device
- Open the termux app
- Grant the storage permission to the MicroSD card with below command, and click "Allow"

  - `termux-setup-storage`

- `cd /data/data/com.termux/files`

- Copy the backup file from step 1 to device B at /SD card/Android/data/com.termux/files/ - 

- Copy the backup file to Termux root folder

- `cp /storage/[Storage-Device ID]/Android/data/com.termux/files/termux-backup_20211031.tar.gz .`

- use below command to open and override the current home and usr folder

  - `tar -zxvf ./termux-backup.tar.gz home`
  - `tar -zxvf termux-backup.tar.gz usr`

### Termux migration finishes here. ###

_**Below setup is for my reference only**_

replace the myfiles_microsd soft link to point to the folder on MicroSD card

- `cd home`
- `mkdir /storage/[Storage-Device ID]/Android/data/com.termux/MyFilesforTermuxOnMicroSD`
- `rm myfiles_microsd`
- `ln -s /storage/[Storage-Device ID]/Android/data/com.termux/MyFilesforTermuxOnMicroSD myfiles_microsd`

Restart the termux on device B and check if everything's working as device A





