a bash shell script is an executable file that contains a list of commands and possibly programming logic to control decision making in the overall task.
The first line of a script begins with a #! notation, commonly referred to as she-bang or hash-bang. This notation is an interpreter directive to indicate the command interpreter and command options to process the remaining lines in the file. For bash syntax scripts we use #!usr/bin/bash
A shell script must have execute permission to run it as an ordinary command. Use the chmod command to modify the file permissions. Use the chown command if needed to grant execute permission only for specific users or groups.
Special characters need to be escaped, like backslash, single quotes, double quotes with a backslash.
```bash
[user@host ~]$ echo # not a comment

[user@host ~]$ echo \# not a comment
# not a comment
```
```
[user@host ~]$ echo # not a comment #

[user@host ~]$ echo \# not a comment #
# not a comment
[user@host ~]$ echo \# not a comment \#
# not a comment #
[user@host ~]$ echo '# not a comment #'
# not a comment #
```
Use double quotation marks to suppress globbing(file name pattern matching) and shell expansion, but still allow command and variable substitution.
Use single quotation marks to interpret all enclosed text literally. Besides suppressing globbing and shell expansion, single quotes also direct the shell to suppress command and variable substitution.
```bash
[user@host ~]$ var=$(hostname -s); echo $var
host
[user@host ~]$ echo "***** hostname is ${var} *****"
***** hostname is host *****
[user@host ~]$ echo Your username variable is \$USER.
Your username variable is $USER.
[user@host ~]$ echo "Will variable $var evaluate to $(hostname -s)?"
Will variable host evaluate to host?
[user@host ~]$ echo 'Will variable $var evaluate to $(hostname -s)?'
Will variable $var evaluate to $(hostname -s)?
[user@host ~]$ echo "\"Hello, world\""
"Hello, world"
[user@host ~]$ echo '"Hello, world"'
"Hello, world"
```
The echo command displays arbitrary text by passing the text as an argument to the command.
```bash
[user@host ~]$ cat ~/bin/hello
#!/usr/bin/bash

echo "Hello, world"

[user@host ~]$ hello
Hello, world
```
The echo command is widely used in shell scripts to display informational or error messages.
```bash
[user@host ~]$ cat ~/bin/hello
#!/usr/bin/bash

echo "Hello, world"
echo "ERROR: Houston, we have a problem." >&2

[user@host ~]$ hello 2> hello.log
Hello, world
[user@host ~]$ cat hello.log
ERROR: Houston, we have a problem.
```
# GUIDED EXERCISE
```bash
[student@workstation ~]$ lab start console-write
```
Login into servera as student
```bash
[student@workstation ~]$ ssh student@servera
..output omitted..
[student@servera ~]$
```
Create and execute a simple bash script
Use the vim commands to create firstscript.sh
```bash
[student@servera ~]$ vim firstscript.sh
```
Insert the following text and save the file.
```bash
#!/usr/bin/bash
echo "This is my first bash script" > ~/output.txt
echo "" >> ~/output.txt
echo "#####################################################" >> ~/output.txt
```
Use the bash command to execute the script
```bash
[student@servera ~]$ bash firstscript.sh
```
Review the output file
```bash
[student@servera ~]$ cat output.txt
This is my first bash script

#####################################################
```
Add more commands to the firstscript.sh, execute it and review the output.
Use vim to edit the firstscript.sh script
```bash
[student@servera ~]$ vim firstscript.sh
```
The following output shows the expected content of firstscript.sh
```bash
#!/usr/bin/bash
#
echo "This is my first bash script" > ~/output.txt
echo "" >> ~/output.txt
echo "#####################################################" >> ~/output.txt
echo "LIST BLOCK DEVICES" >> ~/output.txt
echo "" >> ~/output.txt
lsblk >> ~/output.txt
echo "" >> ~/output.txt
echo "#####################################################" >> ~/output.txt
echo "FILESYSTEM FREE SPACE STATUS" >> ~/output.txt
echo "" >> ~/output.txt
df -h >> ~/output.txt
echo "#####################################################" >> ~/output.txt
```
Make the firscript.sh file executable by using the chmod command
```bash
[student@servera ~]$ chmod a+x firstscript.sh
```
Execute the firstscript.sh
```bash
[student@servera ~]$ ./firstscript.sh
```
Review the output file that the script generated
```bash
[student@servera ~]$ cat output.txt
This is my first bash script

#####################################################
LIST BLOCK DEVICES

NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sr0     11:0    1  558K  0 rom
vda    252:0    0   10G  0 disk
├─vda1 252:1    0    1M  0 part
├─vda2 252:2    0  200M  0 part /boot/efi
├─vda3 252:3    0  500M  0 part /boot
└─vda4 252:4    0  9.3G  0 part /
vdb    252:16   0    5G  0 disk
vdc    252:32   0    5G  0 disk
vdd    252:48   0    5G  0 disk

#####################################################
FILESYSTEM FREE SPACE STATUS

Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        844M     0  844M   0% /dev
tmpfs           888M     0  888M   0% /dev/shm
tmpfs           355M  9.4M  346M   3% /run
/dev/vda4       9.4G  1.7G  7.7G  18% /
/dev/vda3       495M  161M  335M  33% /boot
/dev/vda2       200M  7.6M  193M   4% /boot/efi
tmpfs           178M     0  178M   0% /run/user/1000
#####################################################
```
Remove the exercise files and return to the workstation machine.
Delete the firstscript.sh and output.txt files
```bash
[student@servera ~]$ **`rm firstscript.sh output.txt
```
Return to the workstation machine as the student user
```bash
[student@servera ~]$ exit
logout
Connection to servera closed.
[student@workstation ~]$
```
Finally run this command to change the student use home directory
```bash
[student@workstation ~]$ lab finish console-write
```
Run repetitive tasks with for loops, and create conditional structures with if statements.
The for loop is a bash looping construct to use for task iterations
```bash
for VARIABLE in LIST; do
COMMAND VARIABLE
done
```
Example
```bash
[user@host ~]$ for HOST in host1 host2 host3; do echo $HOST; done
host1
host2
host3
[user@host ~]$ for HOST in host{1,2,3}; do echo $HOST; done
host1
host2
host3
[user@host ~]$ for HOST in host{1..3}; do echo $HOST; done
host1
host2
host3
[user@host ~]$ for FILE in file{a..c}; do ls $FILE; done
filea
fileb
filec
[user@host ~]$ for PACKAGE in $(rpm -qa | grep kernel); \
do echo "$PACKAGE was installed on \
$(date -d @$(rpm -q --qf "%{INSTALLTIME}\n" $PACKAGE))"; done
kernel-tools-libs-5.14.0-70.2.1.el9_0.x86_64 was installed on Thu Mar 24 10:52:40 PM EDT 2022
kernel-tools-5.14.0-70.2.1.el9_0.x86_64 was installed on Thu Mar 24 10:52:40 PM EDT 2022
kernel-core-5.14.0-70.2.1.el9_0.x86_64 was installed on Thu Mar 24 10:52:46 PM EDT 2022
kernel-modules-5.14.0-70.2.1.el9_0.x86_64 was installed on Thu Mar 24 10:52:47 PM EDT 2022
kernel-5.14.0-70.2.1.el9_0.x86_64 was installed on Thu Mar 24 10:53:04 PM EDT 2022
[user@host ~]$ for EVEN in $(seq 2 2 10); do echo "$EVEN"; done
2
4
6
8
10
```
Use the exit command to immediately leave the script and skip processing the remainder of the script.
An exit code of 0 represents a successful completion with no errors. All other nonzero values indicate an error exit code. You can retrieve the last exit code with the built in variable $?
```bash
[user@host bin]$ cat hello
#!/usr/bin/bash
echo "Hello, world"
exit 0
[user@host bin]$ ./hello
Hello, world
[user@host bin]$ echo $?
0
```
You can verify the integrity of your scripts by using the Bash test command. All commands produce an exit code on completion. To see the exit status, view the $? variable immediately after executing the test command.
```bash
[user@host ~]$ test 1 -gt 0 ; echo $?
0
[user@host ~]$ test 0 -gt 1 ; echo $?
1
```
Test using the Bash test command syntax `[ <TESTEXPRESSION> ]`  or `[[ <TESTEXPRESSION> ]]`, which provides features such as file name globbing and regex pattern matching.
```bash
[user@host ~]$ [[ 1 -eq 1 ]]; echo $?
0
[user@host ~]$ [[ 1 -ne 1 ]]; echo $?
1
[user@host ~]$ [[ 8 -gt 2 ]]; echo $?
0
[user@host ~]$ [[ 2 -ge 2 ]]; echo $?
0
[user@host ~]$ [[ 2 -lt 2 ]]; echo $?
1
[user@host ~]$ [[ 1 -lt 2 ]]; echo $?
0
```

```bash
[user@host ~]$ [[ abc = abc ]]; echo $?
0
[user@host ~]$ [[ abc == def ]]; echo $?
1
[user@host ~]$ [[ abc != def ]]; echo $?
0
```

```bash
[user@host ~]$ STRING=''; [[ -z "$STRING" ]]; echo $?
0
[user@host ~]$ STRING='abc'; [[ -n "$STRING" ]]; echo $?
0
```
Space inside the brackets are mandatory because they separate the words and elements within the test expression.
The simplest conditional structure is the if/then construct, with the following syntax
```bash
if<condition>; then
<statement>
...
<statement>
fi
```

```bash
[user@host ~]$ systemctl is-active psacct > /dev/null 2>&1
[user@host ~]$ if  [[ $? -ne 0 ]]; then sudo systemctl start psacct; fi
```
You can further expand the if/then construct to take different set of actions. Use the if/then/else construct to accomplish this behaviour