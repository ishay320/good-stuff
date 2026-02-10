## functions

```c
struct foo_args {
    int x;
    int y;
};
#define foo(name, ...) foo_f(name, (struct foo_args){__VA_ARGS__})
void foo_f(const char* str, struct foo_args args) {
    printf("%s: %d,%d\n", str, args.x, args.y);
    return;
}

int main(void) {
    // can use now the "python variadic" like and even not use all the args
    foo("bar", .x = 1);
    return 0;
}

```
