# Ruby Notes

## Outline

* General functionality
* Supported operators
* Objects
  * Syntax differences
  * Method types
* Syntax
  * Loop structures
  * Regex
    * General formatting
    * Character classes
    * Modifiers
  * Hash (Dictionaries)
* Strings
  * Formatting
  * Functionality
* Useful Functions
  * String Methods
  * Mathematical Methods

## General Functionality

* Variables vs. Constants
  * Variables are traditionally lowercase and snake cased (i.e. `this_is_a_variable`)
  * Constants are traditionally upercase and snake cased (i.e. `THIS_IS_A_CONSTANT`) and are intended to be immutable

## Supported operators

* Standard
  * `+`   - Addition
  * `-`   - Subtraction
  * `*`   - Multiplication
  * `/`   - Division
  * `%`   - Modulus
  * `**`  - Exponentiation
* Comparison
  * `==`    - Equality
  * `!=`    - Not Equal
  * `<=`    - Less that nor equal to
  * `>=`    - Greater than or equal to
  * `<`     - Less than
  * `>`     - Greater than
  * `<=>`   - Combined comparison
    * Returns 1 if the first operand is greater than the second
    * Returns 0 if the first operand equals the second
    * Returns -1 if the first operand is less than the second
  * `===`   - Used to test equality with a when clause of a case statement
    * Returns true if the right hand operand belongs to the collection of the left hand operand
  * `.eql?` - Checks if both the value and type of both arguments are the same
  * `.equal?` - Checks to see if both operands have the same object ID (i.e. if they are clones)
* Assignment
  * `=`     - Standard assignment
  * `+=`    - Add to itself
  * `-=`    - Subtract from itself
  * `*=`    - Multiply to itself
  * `/=`    - Divide and assign
  * `%=`    - Assign the modulus
  * `**=`   - Exponentiate and assign
* Logical
  * `||` or `or`
  * `&&` or `and`
  * `!` or `not`
* Bitwise
  * `&`     - Binary and
  * `|`     - Binary or
  * `^`     - Binary XOR
  * `~`     - Binary 1's compliment
  * `<<`    - Bit shift left
  * `>>`    - Bit shift right
* Special Uses
  * `?:`    - Ternary operator
    * Use: `If` Condition is true `?` value X `:` Otherwise value Y
    * Example: `If a < b ? puts "a is less than b" : puts "b is less than a"`
  * Range operators
    * `..`  - Creates an inclusive range (i.e. `1..5` creates range 1, 2, 3, 4, 5)
    * `...` - Creates an end-point-exclusive range (i.e `1..5` creates range 1, 2, 3, 4)
  * `defined?`  - Checks to see if a given value is defined

## Objects

### Syntax Differences

* Constructors follow the structure `def initialize`
* Instance variables begin with @
* New object is defined at the end (i.e. Class.new)

### Method Types

* Class Methods
  * Denoted by the `self.` prefix.
  * Can be run without having the object instance initialized
* Instance Methods
  * Private methods that require the object to be instantiated before calling
* Boolean methods
  * Methods with a question mark at the end that are designed to return a boolean value.

## Syntax

* Null is `nil`
* Blocks like fucntions, `if`, `for`, and `while` terminate with `end` statements

### Loop structures

* `for`     - Nothing unusual. Iterates over a given range
* `while`   - Runs the loop until a given condition is false
* `until`   - Opposite of a while. Runs the loop until a given condition is true
* `break`   - Terminates the innermost loop if called within a loop
* `next`    - Jumps to the next iteration of the innermost loop
* `redo`    - Restarts the current iteration of the innermost loop
* `retry`   - Attempts the current iteration of a loop under certain conditions
  * If called in a rescue block: retries the body of the begin expression
  * If called in a loop: retries iteration if a conditional is met (defined as `retry if [condition]`)

### Regex

#### General formatting

* Regular expressions are formatted between forward slashes (i.e. `/[aeiou]/` is a group of lowercase vowels)
* `.` matches to any character other than a newline
* Escape characters with a single backslash
* The `=~` operator finds the first occurence of a pattern and returns the starting index
  * `.match` functions similarly
* Regular expressions can be assigned to variables or constants

#### Character Classes

* Character classes are groupings of characters and can define character sets or ranges
  * Formatted by square braces (i.e. `/[]/`)
  * Ranges are defined with hyphens (i.e. `/[0-9]/` is a grouping of digits)
  * Can be negated with carrot symbol (i.e. `/[^0-9]/` is all non-numeric characters)
  * Character ranges have shorthands
    * `\w` is the equivalent of `/[0-9a-zA-Z]/` or all alphanumerics
    * `\d` is the equivalent of `/[0-9]/` or all digits
    * `\s` represents all white space (spaces, tabs, newlines)
  * Shorthands also have negated versions
    * `\W` is the equivalent of `/[^0-9a-zA-Z]/` or everything that isn't a letter or number
    * `\D` is the equivalent of `/[^0-9]/` or all non-digit characters
    * `\S` is all non-spacial characters

#### Modifiers

* `*` - 0 or more
* `+` - 1 or more
* `?` - 0 or 1
* `{n}` - exactly n
* `{m, n}` - between m and n

### Hash (Dictionaries)

* Hash keys must be objects that implement the methods hash and eql?
* Hashes maintain the order that you added elements in
* Supports traditional and "JSON like" syntax
  * Traditional: `{key_1 => val_1, key_2 => val_2 ...}`
  * JSON Like: `{key_1: val_1, key_2: val_2 ...}`
    * This syntax format only supports symbols as keys

## Strings

### Formatting

* Single Quotes ('') - Non-Interpolable (cannot insert other strings into)
* Double Quotes ("") - Interpolable
* Interpolation formats:
  * `#{}` - inserts whatever is in the braces as a string
  * `%{}` -
  * `%q{}` -

### Fucntionality

* Slicing syntax is similar to Python, but uses commas instead of colons
  * Negative indexing is allowed, but **only** for individiual characters or the first part of a slice
  * Negative indexing can be used for slices, but only in the form of a range
    * ex `string[5..-2]` would give the slice from the 6th character of the string up until the second to last character.
* Methods on a string return a new string with the desired qualities
  * Some methods have a version ending in "!" that edit the existing string (i.e.)
    * `string.capitalize` => results in a new object w/ first letter in caps
    * `string.capitalize!` => edits string to have a capital letter in index 0

## Useful functions

### String Methods

* `.capitalize` - capitalizes the first letter of a string
* `.dowcase`    - makes all characters lowercase
* `.strip`      - strips all spaces from a string
* `.split(s)`   - splits a string across the pattern `s`
* `.gsub(o, n)` - substitutes character `o` with character `n` **supports regex**
* `.center(n)`  - centers the original contents of a string in a new string of length `n`
* `.ljust(n)`   - left justifies original string to a length of `n` characters
* `.rjust(n)`   - right justifies original string to a length of `n` characters

### Mathematical Methods

* `.round(d, half: )`   - Rounds a float to the nearest `d` significant digits using mode `half:`
  * `d` can be positive or negative
  * `half:` effects values halfway between 2 possible values and has 3 modes:
    * `:up`     - rounds up
    * `:down`   - rounds down
    * `:even`   - rounds to the nearest even number
