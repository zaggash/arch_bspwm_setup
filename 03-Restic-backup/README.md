### The files needed are already setup from the dotfile repo.

- Start the service to enable the backup.
```
systemctl --user enable restic-weekly.timer
systemctl --user start restic-weekly.timer
```

- Ensure that the timer will be scheduled using systemctl
`systemctl --user list-timers --all`

- To check the status of the backup in the future, use systemctl
`systemctl --user status restic-weekly.service`

