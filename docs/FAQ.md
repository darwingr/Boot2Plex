## FAQ


### //LaunchDaemons vs //LaunchAgents

For my own purposes what mattered was that LaunchAgents did not allow launching the processes as another user, which is central to our GOAL.
However, Launch Agents are the way to go when launching gui apps.


### "I can't sudo!"

On a multiuser setup its best to lock things down: 
create a dedicated administrator account while having ones personal account as a "standard user".

To make sudo sudo commands, switch to your created admin in terminal:

`su admin`

Exit when done:

`exit`
