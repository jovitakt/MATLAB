% Load the variable RNA_sequence from RNA_sequence.mat
load RNA_sequence.mat
% Run the function base2amino
amino_sequence = base2amino(RNA_sequence);
% Load the variable amino_sequence_reference from amino_sequence_reference.mat
load amino_sequence_reference.mat
% Compare the character string for amino_sequence and amino_sequence_reference
compare = sum(char(amino_sequence) ~= char(amino_sequence_reference));
