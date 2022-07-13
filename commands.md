## Git

### Great log command

`git log --all --decorate --oneline --graph`

### make alias as adog

`git config --global alias.adog 'log --all --decorate --oneline --graph'`

## History commands and shortcuts

| command             | explenation                                                                                                                                                  |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `!string `          | Execute the most recent command that begins with _string_.                                                                                                   |
| `!num `             | Execute command that is number _num_ in the command history.                                                                                                 |
| `!-num `            | Execute the command was run _num_ commands previous in the history.                                                                                          |
| `!! `               | Execute the previous (most recently-executed) command.                                                                                                       |
| `!?string[?]`       | Execute the most recent command containing the string _string_.<br> The trailing ? may be omitted if _string_ represents the end of the command in question. |
| `^string1^string2^` | Repeat the previous command executed, replacing _string1_ with _string2_.<br> The previous command must contain _string1_.                                   |
