# Introduction to the Bash Shell
A *command line* is a text based interface that is used to input instructions to a computer system. The Linux command line is called *shell*.
The default user shell in RHEL is `GNU Bourne-Again Shell (bash)`. The `bash` shell is an improved version of the original `Bourne Shell (sh)` on UNIX systems.
When the shell is waiting for user input, we call it *shell prompt.* The prompt ends with a dollar `($)` character.
```bash
[user@host ~]$
```
A `hash(#)` character is in the place of dollar when the shell is running in **superuser**
```bash
[root@host ~]#
```
The `bash` shell provides a scripting language that can support task automation.
## Shell Basics
Commands that are entered in the prompt have three basic parts.
- *Command* to run.
- *Options* to adjust the behavior of the command
- *Arguments*, which are typically targets of the command.
Options normally start with one or two dashes `-a` or `--a`.
For example in the command
```bash
usermod -L user01
```
`usermod` is the command, `-L` is the option, and `user01` is the argument.

# Quiz: Access the Command Line
1.   Which term describes the interpreter that executes commands that are typed as strings?
	1. Shell
2. Which term describes the visual cue that indicates that an interactive shell is waiting for the user to type a command?
	1. Prompt
3. Which term describes the name of a program to run?
	1. Command
4. Which term describes the part of the command line that adjusts the behavior of a command?
	1. Option
5. Which term describes the part of the command line that specifies the target that the command should operate on?
	1. Argument
6. Which term describes the hardware display and keyboard to interact with a system?
	1. Physical Console
7. Which term describes one of multiple logical consoles that can each support an independent login session?
	1. Virtual Console
8. Which term describes an interface that provides a display for output and a keyboard for input to a shell session?
	1. Terminal
# Introduction to the GNOME Desktop Environment
The desktop environment is the GUI on a Linux system. To start a terminal in the desktop environment we can go to **Activities** overview, select `Terminal` from the dash. Or search `terminal` in the search field at the top of the **windows overview**. Or press the **Alt+F2** key combination to open the **Enter a Command** and enter `gnome-terminal`

# Execute Commands with the Bash Shell
When you want to execute a command, simply write it in the terminal and press Enter.
```
[user@host ~]$ whoami
user
```
We can also write multiple commands at once using semicolons as separators
```bash
[user@host ~]$ command1 ; command2
command1 output
command1 output
```
The `date`  command displays the current date and time. There are several modifiers that can be used to see different variations of date, such as month, day, date, time-zones etc.
```
[user@host ~]$ date
Sun Feb 27 08:32:42 PM EST 2022
[user@host ~]$ date +%R
20:33
[user@host ~]$ date +%x
02/27/2022
```
The `passwd` command with no options changes the current user's password. To change the password, we first need to specify the original password for the account. By default it requires a strong amount. A super or privileged user can use the `passwd` command to change another user's password.
```
[user@host ~]$ passwd
Changing password for user user.
Current password: old_password
New password: new_password
Retype new password: new_password
passwd: all authentication tokens updated successfully.
```
To view the contents of files we can use `cat` command.
```
[user@host ~]$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
...output omitted..
```
To display the contents of multiple files, we can use `cat` command with multiple file names without any separators
```
[user@host ~]$ cat file1 file2
Hello World!
Introduction to Linux commands.
```
The user can use the `less` command to display one page of content.
The `head` and `tail` commands display the beginning and end of files, respectively. By default 10 lines are displayed but we can se the `-n 3` or any number to display that respective number of lines.
```
[user@host ~]$ head /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
[user@host ~]$ tail -n 3 /etc/passwd
gdm:x:42:42::/var/lib/gdm:/sbin/nologin
gnome-initial-setup:x:980:978::/run/gnome-initial-setup/:/sbin/nologin
dnsmasq:x:979:977:Dnsmasq DHCP and DNS server:/var/lib/dnsmasq:/sbin/nologin
```
The `wc` command gives the counts of lines, words, and characters in a file. We can use `-l`, `-w`, or `-c` options to display only the given number of lines, words, or characters, respectively.
```
[]
```