#Pourpose

Reading bash scripts from different sources and understand every-single line

- [djeada/Bash-Scripts](https://github.com/djeada/Bash-Scripts)
- [mertcangokgoz/UsefulBashScripts](https://github.com/mertcangokgoz/UsefulBashScripts)

## djeada/Bash-Scripts

- disk_usage

- set -euo pipefail: ** [bashDjeadaAbstraction](./bashDjeada.sh) **

    - I understand why the **-e**, so basically if there is a bashscript which
      have some pipes and one of those pipes return 1 it will exit the script
      inmediately if not set even if the pipes return 1 it will continues, if the 1 comes
      from an if then it will continue
    - For the -u flag I need to ask, not understood yet
    - For the -o flag, This will set the option corresponding to the option name in this case pipefail
    - The option pipeline needs to be used as ```
      #! /usr/bin/bash
      set -(.\*)o pipefail

    ```
    this will return 0 if all commands in an pipelined command ex: .*|.*|.......| return 0 or the rightmost command that returned 0
    - global variables defined as Mayus
    - the cat <<EOF is useful when working with multilines text in bash ex: assigning multiline text to variable,file or pipe
    - df, shows filesystem usage
    - awk is used one line to understand is the following
    ```

    local awk_script='NR>1'
    awk_script="$awk_script && \$1 !~ /^tmpfs/ && \$1 !~ /^udev/ && \$1 !~ /^devtmpfs/"

    ```
    - this script: is making use of awk pattern matching and logical operators
      so basically is doing for $awk_script="NR>1" then from the following input remove the first line
      then, once that done get the lines tha doesn't match the pattern /^tmpfs/ and /^udev/ and /^devtmpfs/




    ```
