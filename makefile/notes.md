# Description

- using regex so (? means 0|1 ocurrence)
- Notes about makefile

## Link

- https://www.youtube.com/watch?v=Y-m8hGZUX4E&list=PLSeOJEFuO7Y5Ven6i1-4XbrQw50TiT3QK

## ch_1

- makefiles are composed of rules each rule follows the format

```
target(normally a? files?):prerequisites?
    recipe(shell commands?)
```

- Makefiles check the timestamp of modification and also is the files? exist or not
  for example in this makefile I will write the followings scenarios they will occurs

```
greeting.txt: hello.txt world.txt
    cat hello.txt world.txt > greeting.txt

hello.txt:
    cat hello.txt

world.txt:
    cat world.txt
```

- in this Makefile the first time I executed, the prerequisites will be checked as they don't exist
  it will go to the defined targets, as they don't have prerequisites and they don't exist they execute their recipe, and the recipe is a shell command that creates a file. once that is done then as greeting doesn't exist
  it will create the greeting.txt

- If i try to rerun make it won't do anything because nothings has to be modified and all the targets(files?) are already there

- If i delete a file it will go to the specific target and re-run the recipe
- If i modified a file it will modify the target that is requesting those prerequisites

- I have a question of the makefile I tweaked from
  Job Vranish (https://spin.atomicobject.com/2016/08/26/makefile-c-projects/) // inspired from
  How does it know how to change if the .h file is not listed

- Ok interesting but that question I need to answer it

- Ok, cool if I want to create a target in which I want to run the recipe in the same line, I have to add a semicolon

```
<target>:  ; <shell command>
```

- If I want to create a target which then I will redeclare, so there will be a chance of overwritting
  then Makefile by default overrides it but if instead we use double semicolon, it will run all instances

```
double_colon:: ; @echo "I was first declared"

double_colon:: ; @echo "I was second declared"
```

- For only caring if file exist and not timestamp if modified then we can use a pipe before prerequisite

```
new_file: | file.txt
        @echo "Not created yet"

file.txt:
        @echo "Creting file"
        touch file.txt

```

- Prefixes

  - '@' --> doesn't show the command
  - '-' --> ignores erros
  - '+' --> run always even with --dry-run command

- Pattern rules

  - exact matching has bigger importance than pattern matching
  - it can be used with '%' so basically the '%' acts like a joker

  ```
    # curious things notice that the recipe even if i a shell command
    # it doesn't consider $@ as a defined bash variable but instead it takes makefile
    # default varible.
    patter%matching:; @echo "it tooks $@"
    %matching: ; @echo "it tookts $@"
    # direct match takes precedence from pattern matching rules
    hello-%:; echo "it tooks  $@"
    hello-world:; echo "it tooks hello-world"
  ```

  - In this example any string like /(patter).\*(matching)/ will match the first rule
  - In this example any string like /.\*(matching)/ will match the second rule
  - if there is pattern matching matches but also a direct match the direct match takes relevance over the patter

- prerequisites handling

  - Really useful in work
  - Before I have the case in which for demostrating the 'double colon functionalitie' I create to rules with the same target name, but before putting the double colon I put only one and then I found out that gthe first rules got overriden by the following definition, now I know that is the case for the recipe it means the "code| shell part" but that's not the case for the prerequisites so the prerequisites gets appended to the list of prerequisites of the target that is overridign

```

multiple_prerequisites: dep2

multiple_prerequisites: dep1
	@echo "Building multiples -> prerequisistes"

# multiple_prerequisites: dep1 dep2
# 	echo "Building multiples -> prerequisistes"
# so Dependences: dep1  -> Dependences: dep2 ->  "Building multiples -> prerequisistes"
dep%:; @echo "Dependencie: $@"
```

- static patter rules

  - Useful when you want to automatically generate prerequiisites based on the names targets
  <!--Gives a better explanation-->
  - so what happens here is that the joker ('%') will replace get the value that we want to match and then it will executes the rules matching that pattern

- PHONY: prerequisites

  - This allows to have rules that whose targets
    doesn't have prerequisite

    - all, clean, test are common targets used
