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
