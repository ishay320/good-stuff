## vscode specific error removal

if you have squiggle on error that you know that its not error:

```cpp
#ifdef __INTELLISENSE__
    #pragma diag_suppress <error code>
#endif
```

## cout tricks

```cpp
std::cout
<< std::setw(number) // Changes the width of the next input/output field (white spaces)

<< std::right // Modifies the positioning of the fill characters in an output stream
<< std::left
<< std::internal

<< std::setfill('*') //  sets the fill character of the stream out to c

<< std::oct// Modifies the default numeric base for integer
<< std::dec
<< std::hex

<< std::showbase
<< std::noshowbase;

std::cout.precision(number); // set the precision of numbers in cout (0.1 0.11 ...)

 std::cout.width(number); // Manages the minimum number of characters to generate on certain output operations and the maximum number of characters to generate on certain input operations.
```
