# build the file using the file

## how to run

Run with `chmod u+x main.c` and then `./main`

## cpp / c

```cpp
//usr/bin/g++ "$0" -o ${0%.cpp} && ./${0%.cpp} "$@"; exit $?
int main(){
    return 0;
}
```

if you need it to be bigger, example that compile run and remove:

```cpp
#if 0
    gcc "$0" && ./a.out
    rm -f ./a.out
    exit
#endif
int main() {
    return 0;
}
```
