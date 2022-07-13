## Git

### Great log command

`git log --all --decorate --oneline --graph`

### make alias as adog

`git config --global alias.adog 'log --all --decorate --oneline --graph'`

## History commands and shortcuts

| command             | explenation                                                                                                                                              |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `!string `          | Execute the most recent command that begins with string.                                                                                                 |
| `!num `             | Execute command that is number num in the command history.                                                                                               |
| `!-num `            | Execute the command was run num commands previous in the history.                                                                                        |
| `!! `               | Execute the previous (most recently-executed) command.                                                                                                   |
| `!?string[?]`       | Execute the most recent command containing the string string.<br> The trailing ? may be omitted if string represents the end of the command in question. |
| `^string1^string2^` | Repeat the previous command executed, replacing string1 with string2. The previous command must contain string1.                                         |
