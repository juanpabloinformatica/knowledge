# Git
## Notes
# Chapter_2 \[Pointer Manipulation\]

- Dangling pointers -> pointers that points to invalid addresses.
- When declaring a pointer variable only the pointer variable
gets allocation not for the data it points.

- the data it points could be allocated in 2 ways

- Automatic alloc and dealloc by function or block
- Dynamically (Manual) with malloc or realloc

- ```c
//Dangling pointer
int f(int **iptr) {
    int a = 10;
    *iptr = &a;
    return 0;
}
```

is a dangling pointer because what is passing here is the following
iptr will be a variable that will have a pointer variable of type int
so when we will write the int pointer variable to iptr it will work but as soon as the functions finished the automatic allocation of a will be also automatically deallocated, letting \*iptr pointing to an invalid address

- Figure 2-2 is a good photo and here is why
The image show 3 boxes and is useful to understand the following
iptr box has as value the address of jptr that will have as value
    an address in this case the heap of an int value.
what the image let you understand if when calling g(&jptr)
    g function is locally creating a variable that will get the reference of jptr, that' the reason why iptr points to jptr. Then at assigning _iptr to (int_) malloc(sizeof(int)) what is happening is we are taking the local pointer variable that points to the "real" pointer variable that is pointing to the actual memory space. and as we do \*iptr we are writting that gotten memory address returned by malloc and assigning it to jptr. So when the function finish iptr as was automatically generated by the function dissapear and the jptr get the address of the memory block he ca use.

    - Not clear how they assure them selves concerning to memory management issues. I will try to understand that when looking the implementaiton of the dsa done by themselves.

    - Paragraph (in page 16-17) is clear basically what is explaining is the following in C the array is sometimes seen as a pointer and 'a[i] == \*(a+i)'
    here is something important in the right part of the equal ( *(a+i)) what is happening is that for accessing the correct value, pointer arithmetic takes place
    so i wil increment the a(address) but not only itimes but it will increment it i*sizeof(a[0]) times a[0] will be of anytype, the important here is that
    (a+i) increments considering the type of the pointer if is an int it will be 4bytes so it will increment i\*4.

    - Paragraph (in page 18) is important I understand, C only accepts
    passing by value, the reference in reality is a variable created locally in the scope of the called function that has as value the address of the variable passed as argument.

    - So the part of why we need to all but the first dimension is because the compiler,
    at the moment of getting an element from the array, he needs first to know the address
    of the memory itself and then in order to retrieve the correct element it needs to know
    the size of each element to do retrieve the corrects amount of bytes. Here an example

    if we have an array int T[3][2] this is transalted in row-major order so in reality is
    T[6] == T[3][2] but as the notion is we have instead of one element of type int we have two element of type int as one
    then the compiler for taking in consideration this needs to know how many bytes it needs to consider so when passing a
    an array as a function it needs the sizes of the inners arrays

    - Pointers to pointers as parameters
    I remember this was crucial when I did my implementations for different things

    - when I tried to move the head of the linked_list or trees that was needed because
    if not there was not possible to modify the actual head because as the reference passed
    is coppied by value the first element at dereferencing will be pointing to the next one
    and u need what is pointing to the first address itself.

    -

    - This is good in the page 24
    Basically is an idea that makes sense is the following
    I remember before sometimes I used to ask myself why did I need to do
    reallocs for char\* and one of the reasons is because when I create a pointer
    the memory allocated is for the pointer itself not for the memory block it points.
    the memory block it points needs to be also allocated.
    So basically it works if the stack has done a previous allocation or if the user does it manually through malloc or realloc

    - This of tail recursion is really clear
    what i get of this is the following, basically when u do a normal
    recursive function, if its depends to the following call, the compiler
    will understand that it can not remove the caller stack activation, so what
    woudl happend eventually is having a lot of stack frames until the unwiding face
    arrives, but instead if we make the compiler aware that the caller doesn't depend
    to the following code, (a modern compiler) will reuse the stack activation with
    the other call instead of creating a new stack frame. why this work because
    one the caller call the caller itself finished what it has to do, it doesn't need anything from the function it called.

    - From the recursion chapter I need to understand something,
    I need to understand the mathematical notation such as
    ```
    def T(n):
        if n==1:
        return 1
        elif n>1:
        return 2*T(n/2)+n
        ```

# Analysis of algorithms
        - Different way to measure performance, but also keep in mind which kind of performance
        we are measuring, normally the most important in this kind (cs) is time, nevertheless the
        space is less often demanded.
        Whatever the case determining how and algorithms performs requires a deterministic and formal method

        - So far this chapter focus in 3 topics

        - Worst-case analysis
        - O-notation
        - Computacional complexity

        - Worst case analysis is the most used because
        - The best case is normally the best case of the others
        and is rarely that this happens.

        - The average case is hard to get and honestly it depends the data,
        so no really convenient.

        - The worst case is more representative because it tells you exactly what
        what would be the worst performance the algorithms could take and
        you can not go further than that.

        - O-notation

        - There are some things to keep in mind at the moment
        of getting the O(x). Basically takes the greater
        f(x) = (x^0)? + (x^1)? + x(x^.....)?
        in this expression takes the x with greater grade
        also don't keep in mind the constants that are factor
        of this x's because when x is to big this constants factor
        doesn't represent a lot.
        f(x) = (x^0)? * (x^1)? * x(x^.....)?
    in this case that is multiplication
is different is not changed the so getting the O(x)
    will look similar but the expression normally get rewrite

    - Computacional complexity
    - basically is the growth rate of (time|space) depending of data.
- T(n) <= cn, where c is a constant factor that is not generated for the input(data)
    usually comes from (codes generated from the compiler, type of computer where the algo is running, and constants in the algot itself.

# Data structure part

- This is the part I wanted to see, but all the previous information
  was good to have it, so my idea is read his implementation and trying to understand why
  in which things it differs with mine and do the implementations by myself.











