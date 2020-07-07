#!/bin/sh

# echo -n -> does not print newline at the end

# 1. Count how many lines are there in “data.dat”.
# wc -l -> counts number of lines; 
#     < -> removes the file name returned at the end of wc command
echo -n "Number of lines in \"data.dat\": " && wc -l < data/data.dat 

# NOTE: "wc -l < filename" is kinda dangerous if "<" is by mistake replaced
#       by ">" the command instead removes everything from the file
#       storing only the output from "wc -l". Perhaps pipe the output of cat into
#       "wc -l" to only get the count.  


# 2. Count how many lines of those contain “dolor” or “dalor”?
# grep -w -> looks only for whole words, instead of treating the word
#            like a regex pattern
#      -e -> marks a pattern, any number of patterns can be searched for
#            by daisy-chaining a bunch of -e. I find this more readable
#            The other method of macthing multiple patterns is "dolor\|dalor"
# wc -l   -> as before counts the number of lines piped in by grep
echo -n "Number of lines in \"data.dat\" that contain \"dolor\" or \"dalor\"?: " && grep -w -e 'dolor' -e 'dalor' data/data.dat | wc -l


# 3. Count how many words are there in “data.dat”?
# wc -w -> counts the number of words (words are whitespace separated)
#     < -> removes the filename at the ed giving just the count
echo -n "Number of words in \"data.dat\: " && wc -w < data/data.dat


# 4. Count how many of those start with “mol”?
# grep -o -> output only matches instead of entire lines where matches occur
#      The pattern: 
#                   - "\b" : match from word boundry, since at the start of 
#                      the regex epxression look from word string
#                   - "mol": the pattern to look for
#                   - "w*" : match any word character
#                   - "\b" : again look for word boundry, in this case ending 
#                            word boundry
# wc -l : counts the lines piped in by grep 
echo -n "Number of words in \"data.dat\ that start with \"mol\": " && grep -o "\bmol\w*\b" data/data.dat | wc -l


# 5. Count how many files in “test folder” are “.txt” files?
# ls data/test_folder/: list all dirs in the test_folder
# grep "\.txt" : match all folder piped in by ls that end with .txt
#      The pattern: 
#                   - "\." : match the dot(.), otherwise a non-escaped dot in
#                            in regex means "any character"
#                   - "txt": match "txt" pattern
#                   - "\b" : look for word boundry, in this case ending 
#                            word boundry
# wc -l : count all the lines piped in by grep. 
echo -n "Number of files in \"test_foler\" with \".txt\" extenssion: " && ls data/test_folder/ | grep "\.txt\b" | wc -l



