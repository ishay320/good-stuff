## Git

### Great log command

`git log --all --decorate --oneline --graph`

### make alias as adog

`git config --global alias.adog 'log --all --decorate --oneline --graph'`

### show the biggest files in git

```sh
git rev-list --objects --all |
  git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' |
  sed -n 's/^blob //p' |
  sort --numeric-sort --key=2 |
  cut -c 1-12,41- |
  $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest
```

## History commands and shortcuts

| command             | explenation                                                                                                                                                  |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `!string `          | Execute the most recent command that begins with _string_.                                                                                                   |
| `!num `             | Execute command that is number _num_ in the command history.                                                                                                 |
| `!-num `            | Execute the command was run _num_ commands previous in the history.                                                                                          |
| `!! `               | Execute the previous (most recently-executed) command.                                                                                                       |
| `!?string[?]`       | Execute the most recent command containing the string _string_.<br> The trailing ? may be omitted if _string_ represents the end of the command in question. |
| `^string1^string2^` | Repeat the previous command executed, replacing _string1_ with _string2_.<br> The previous command must contain _string1_.                                   |

## beep
can be use as reminder for finished command: `sleep 4; beep`


### in linux:
```sh
beep
echo -ne '\007'
echo -e "\a"
```

### in wsl:
```sh
_beep () {
  powershell.exe "[console]::beep($1,$2)"
}

alias bleep="_beep 1000 800"  # A strong bleep (for profanity)
alias  beep="_beep 2000 300"  # Quick yet noticeable beep
alias  blip="_beep 4000  80"  # A less distracting blip

# or just
powershell.exe '[console]::beep(1000,800)'
```
