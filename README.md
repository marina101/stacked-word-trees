# README

This is a toy app that combines a rails app with a word tree processing algorithm that I was once asked to write. The app lets a user upload a .dat wordlist file. Once a file is uploaded, the app runs it through its algorithm and then displays the results back to the user.

## File criteria:
-the wordlist file contains between 1 and 500,000 words
-each word is on a single line
-the words are not in any specified order
-the wordlist may contain duplicate words

## The processing:
- the server should process the wordlist
- the server should pick the longest word that is part of
a StackedWordTree
- the server should return the StackedWordTree for that word

## StackedWordTrees:
-a StackedWordTree is a sequence of words, starting with a 3- letter word, that are incrementally longer than each other via the addition of a letter
example:  
bus  
stub  
burst  
bursts  

-all words in a StackedWordTree must appear in the input wordlist

(published with permission)