function [wordList,wordCount] = count_words(filename)

% Convert txt file into string array
rawText = readlines(filename);
% Remove any empty rows in the string array
rawText(cellfun('isempty',rawText)) = [];
% Combine all the rows of the string array into a text string, with a white
% Space added in between rows.
TextString = join(rawText);
TextString = char(TextString);
% Remove punctuation
% Gives a logical array that determines the punctuations in the char array
PunctLogical = isstrprop(TextString,"punct"); 
% Creates an empty character array noPunct
noPunct = '';
% Loop through all the characters in the text string
for i = 1:length(TextString)
    if PunctLogical(i)==0 % If the logical class is 0 (is not a punctuation)
        noPunct = [noPunct TextString(i)]; % Add the character to the nopunct array
    end
end
% Convert everything to lowercase
TextString = lower(noPunct);
% Splitting the words at each white space.
% Creates a cell array of all words that appear in the long string of text. 
TextCells = split(TextString);
TextCells = TextCells'; 
% Initialising wordList and wordCount
wordList = [TextCells(1)]; % First is word automatically unique
% Generate a cell array that contains each unique word in the text.
for i = 2:length(TextCells) % For cells 2 onwards for TextCells
    if ismember(TextCells(i),TextCells(1:(i-1))) == 0 
       % If the word is not found yet in the previous cells
       wordList{end+1} = TextCells(i); % Add the unique word to wordList
    end
end
wordCount=[];
% Generate a vector that contains the number of instances of the words.
for k = 1:length(wordList) % For all the words in wordList
    wordCount(k) = nnz(strcmp(wordList{k},TextCells(:)));
    % Compare the unique word to the words in TextCells, if the word is found, 
    % then logical value is 1. Count the number of 1s in the logical array
end
% Sort wordCount (and wordList accordingly) in descending order.
[wordCount,sortIndex] = sort(wordCount,'descend');
wordList = wordList(sortIndex);

end