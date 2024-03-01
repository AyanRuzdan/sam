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