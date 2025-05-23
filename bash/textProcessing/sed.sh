#! /usr/bin/bash
function edit_standard_input() {
    printf '1,2,3\na,b,c,d\n'
    printf '\n'
    printf '1,2,3\na,b,c,d\n' | sed 's/,/-/'
    printf '\n'
    printf '1,2,3\na,b,c,d\n' | sed 's/,/-/g'
    printf '\n'
}
# understand the ( file - )
#                ( vidir - )
function recomendation() {
    # check the text format
    # and trying to work with unix style (! stream.contains('\r'))
    printf '42\n' | file -
    printf '\n'
    printf '42\r\n' | file -
}
function editing_file_input() {
    printf 'Hi there\nHave a nice day' >greeting.txt
    sed 's/day/weekend/' greeting.txt
    printf '\n'
    sed 's/e/E/g' greeting.txt >greetings_tweaked.txt
    printf '\n'
}
#1) Replace only the first occurrence of 5 with five for the given stdin source.
function exercise1() {
    echo 'They ate 5 apples and 5 mangoes' | sed 's/5/five/'
}
function exercise2() {
    echo 'They ate 5 apples and 5 mangoes' | sed 's/5/five/g'
}
function exercise3() {
    printf 'start address: 0xA0, func1 address: 0xA0\nend address: 0xFF, func2 address: 0xB0' >hex.txt
    sed -e 's/0xA0/0x50/g' -e 's/0xFF/0x7F/g' hex.txt
}
function exercise4() {
    echo 'goal new user sit eat dinner' | sed 'y/aeiou/AEIOU/'
}
function exercise5() {
    echo 'a sunny day' | sed 's/sunny day/cloudy day/'
}
function backup() {
    printf 'deep blue\nlight orange\nblue delight' >colors.txt
    printf '\n Colors files output\n'
    cat colors.txt
    sed -i.back 's/blue/green/g' colors.txt
    printf '\n Colors files output after modification\n'
    cat colors.txt
    printf '\nDiff result \n'
    diff -y colors.txt colors.txt.back
}
function nobackup() {
    printf 'have a nice day\nbad morning\nwhat a pleasant evening' >f1.txt
    # y option doesn't receive the g
    sed -i -e 's/have/Have/g' -e 'y/aeiou/AEIOU/' f1.txt
    # printf 'worse than ever\ntoo bad\n' >f2.txt
    # sed

}
function multipleFiles() {
    printf 'have a nice day\nbad morning\nwhat a pleasant evening' >f1.txt
    printf 'worse than ever\ntoo bad\n' >f2.txt
    sed -i 's/bad/good/g' f1.txt f2.txt
    printf '\n f1:\n'
    cat f1.txt
    printf '\n f2:\n'
    cat f2.txt

}
function prefixBackup() {
    sed -i'back.*' 's/green/blue/g' colors.txt
}
function placeBackupsDiffDirs() {
    sed -E -i'backups/*' 's/(.)/\1\1/g' colors.txt f1.txt
}
function exercise2_1() {
    printf 'can ran want plant\ntin fin fit mine line' >text.txt
    sed -i'*.orig' 's/in/an/g' text.txt
}
function exercise2_2() {
    sed -i 's/an/in/g' text.txt

}
# function exercise2_3() {
#
# }
# function exercise2_4() {
#
# }
# function exercise2_5() {
#
# }
function regex_filter() {
    printf '1,2,3,4\na,b,c,d\n' | sed -e '/2/! s/,/-/g'
}
function delete_command() {
    printf 'sea\neat\ndrop\n' | sed -e '/at/d'
}
function delete_command_reversed() {
    printf 'sea\neat\ndrop\n' | sed -e '/at/!d'
}

# edit_standard_input
# recomendation
# editing_file_input
# exercise1
# exercise2
# exercise3
# exercise4
# exercise5
# backup
# nobackup
# multipleFiles
# prefixBackup
# placeBackupsDiffDirs
# exercise2_1
# exercise2_2
# regex_filter
# delete_command
delete_command_reversed

# Exercises
#
# 1) For the given input, display except the third line.
#$ seq 34 37 | sed ##### add your solution here
#34
#35
#37
# seq 34 37 | sed -ne '3!p'
# 3) For the input file addr.txt, replace all occurrences of are with are not and is with is not only from line number 4 till the end of file. Also, only the lines that were changed should be displayed in the output.
#
#$ cat addr.txt
#Hello World
#How are you
#This game is good
#Today is sunny
#12345
#You are funny
#
#$ sed ##### add your solution here
#Today is not sunny
#You are not funny
# sed -ne '4,$ {s/are/are not/gp; s/is/is not/gp}' addr.txt
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#


