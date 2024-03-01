# Classroom Environment
![[Pasted image 20240301191414.png]]
Main computer for activities : `workstation`
Other machines for activities: `servera` and `serverb`
DNS domain for machines: `lab.example.com`
User account for student: `student`
Password for `student` account: `student`
`root` password: `redhat`
`bastion` acts as the router b/w network that connects student and classroom
## Logging into student machine
```bash
[student@workstation ~]$ **`ssh student@serverb`**
Warning: Permanently added 'serverb,172.25.250.11' (ECDSA) to the list of known hosts.
Activate the web console with: systemctl enable --now cockpit.socket
[student@serverb ~]$
```
