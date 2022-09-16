import sys,re

# Function that runs the left-to-right longest match algorithm.
def maxmatch(sentence, dictionary):

    firstWord = '' # the first first part of the word
    remainder = '' # the remainder of the word

    # If line is empty, return nothing.
    if sentence == '':
        return list()

    # Run function on substrings of line that decrement the size of firstWord by 1 on each loop.
    for i in range(len(sentence), 1, -1):

        firstWord = sentence[0:i] # set first word to a substring from 0 to i of line
        remainder = sentence[i:] # set remainder to a substring from i to end of line of line

        # Check if firstWord is in the dictionary
        if InDictionary(firstWord, dictionary):
            return [firstWord] + maxmatch(remainder, dictionary)

    firstWord = sentence[0:1] # set firstWord to the first letter
    remainder = sentence[1:] # set lastWord to the substring from the 2nd letter onwards
    
    return [firstWord] + maxmatch(remainder, dictionary)

# Function to check if firstWord is in the dictionary list
def InDictionary(firstWord, dictionary):
    if firstWord in dictionary:
        return True
    return False

# Get line from standard input.
line = sys.stdin.readline()

# Convert file into a list
dictionary_file = open(sys.argv[1], "r")
dictionary = dictionary_file.read()
dictionary_list = dictionary.split("\n")

# Run program while line is not empty.
while line != '':

    # Print output from the maxmatch function.
    print(maxmatch(line.strip(), dictionary_list))

    # Get next line.
    line = sys.stdin.readline()

dictionary_file.close()
