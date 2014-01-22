---
layout: default
title: Bash Session
type: misc
objectives:
    - Understand the utility of bash, what it accomplishes that other file manipulation tools don't
    - Learn and be able to use at least basic bash commands
    - Understand standard in and standard out
    - Understand how to link bash commands together by redirecting their output/input
---
###General Instructions
**Note:** Have fun with the exercises. Bash is hard to catch onto and can be boring at first, also it's easy to be left behind and lose motivation. Try to make it interactive and interesting with screen sharing, choosing random people to solve bash challenges, maybe a small competition.

1. Discuss why to use bash - why is it such a useful tool?
  * What things can you do in bash easily that would take ages using a GUI like finder of Windows Explorer?
    * ex: Move all xml files in a folder to a folder called /xml
    * ex: Find count of all files that contain a particular keyword
    * ex: Replace the a certain xml node value in 100 xml files in a single command
2. Bash is run by commands either directly entered by the user into the terminal, or can be read from a file called the shell script
3. Different types of SHELL's
  * sh - This is the basic shell, a small program with few features
  * bash - Bourne Again shell: the standard GNU shell, intuitive and flexible
    * On Linux, bash is the standard shell for common users
  * zsh - Added features, out of the box templates with oh-my-zsh
    * I've set up zsh on their machines most of the time. Things like typing partial commands and using up key to reverse search, better tab completion, etc.
4. One good example I like to use to get them interested is to count all xml files in my home directory that contain a marketCode xml node value of 'CA', just as an example. Anything similar to this is usually pretty impressive
  1. ls \*xml | xargs cat | grep -o "marketCode=\"CA\"" | wc -l
5. After this, it's good to go through all or some of the following bash commands, showing everyone what they do with examples. This is just an example list of useful commands.
6. After going through the commands, we've had luck using screen sharing to have everyone typing on the same screen, and using a randomizer to choose random attendees to answer various bash challenges concerning the commands they've just learned
  * ie: Using the pipe command, list all txt files and cat them to the screen
  * ie: Similar to above, but show only the first 5 lines of ever txt (or xml) files to the screen
7. Very optional idea: Use a bash command to give points to people who do the questions right to make it more fun?
  1. echo $[\`cat name-score\`+1] > name-score && cat name-score
  2. Then at the and, cat all name-\* files and sort to see winner
    * ie: ls name-\* | xargs cat | sort

###Commands to review
- ctrl+a - go to beginning of line
- ctrl+e - go to end of line

- ctrl+c - cancel current command (or "sigterm" executing program)bash

- cd
    - . = current directory
    - .. = previous directory
- e.g.: cd ..
    - Go to previous directory
- cd -
    - goto last visited directory
- cd ~
    - goto home directory
- pwd
    - Print out present working directory
- mkdir
    - Make a new directory
- rm
    - Remove a file/folder (must use flag -r to recursively remove a folder)
- mv a b
    - Rename file a to b
- mv a blah/
    - Move file a to directory 'blah'
- mv a b c d e blah/
    - Move a bunch of files to blah directory
- cp
    - Copy file (same as move, just keeps original)
- ls
    - List directory contents
- ls a\*
    - "Globing": List every file that starts with an 'a' in this directory
- most important
    - man
      - searching - type / then the search term, hit enter to start searching. n goes to next result, shift + n goes to previous result
    - up/down - arrow keyshello 
    - page up/page down - type u for up a page or d for down a page
- tab - to auto completion
- ls -a -l
    - -a = list all files/directories (including hidden)
    - -l = print them in list format with more information
    - -t = sort by time last modified

- Output redirect:
  - Standard out:
    * Default is the display
    * Can redirect into a file
      * > stoud into file
      * >> append
   * ls > a_file
   * echo "hello" >> .gitignore

- Standard in:
  * Default is keyboard
  * < redirect standard in of command so it no longer defaults to keyboard
  * sort a file:
      * sort < a_file

- Define function
    - declare -f test
- cat -n
- grep -v
    - pipe cat into grep
    - Difference between grep and egrep
      - In basic regular expressions (with grep), the meta-characters ?, +, {, |, (, and ) lose their special meaning. If you want grep to treat these characters as meta-characters, escape them \?, \+,\{, \|, \(, and \).
- find -iname
- head -n
- tail -f -n
- cut -d -f
- echo
- xargs
- wc -l
- ps aux

- Sed:
   * sed -n 1p
      * Print first line
   * sed -n 1,5p
      * Print first 5 lines
   * sed 1d
      * Delete first line of output
   * sed s/hello/goodbye/g

- -d = list directories as plain text instead of searching recursively
    - ls -d ~/\*xml - list all xml files with full path attached

- variables
    - echo $SHELL

- && vs ; when combining commands

- Cool command to open all files with certain market code in sublime (or any editor):
   - ls \*.xml | xargs grep -H "marketCode=\"$1\"" | cut -d ':' -f1 | xargs subl -n
