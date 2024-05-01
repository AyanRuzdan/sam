The first line of a script begins with a #! notation, commonly referred to as a she-bang or hash-bang. It is an interpreter directive to indicate the command interpreter and command options to process the remaining lines in the file.
```shell
#!/usr/bin/bash
```

A file must have execute permissions to run it as an ordinary command. Use the `chmod` command to modify file permissions.
To use special characters like backslash, single quotes, or double quotes we use escape sequences, where we add a backslash before using those characters.
`echo \# not a comment` will display `# not a comment` whereas `echo # not a comment` will display nothing.
Putting text between single quotes also replaces the use of backslash before every special character, like
`echo '# not a comment #'` will display `# not a comment #`
Use double quotes to suppress *globbing* (file name pattern matching) and shell expansion, but still allow command and variable substitution.
The echo command is used for stdout.
```shell
[user@host ~]$ cat ~/bin/hello
#!/usr/bin/bash

echo "Hello, world"
echo "ERROR: Houston, we have a problem." >&2

[user@host ~]$ hello 2> hello.log
Hello, world
[user@host ~]$ cat hello.log
ERROR: Houston, we have a problem.
```
