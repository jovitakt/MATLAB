function amino_sequence = base2amino(RNA_sequence)

% Replace 1 = U, 2 = C, 3 = A, 4 = G
RNA_sequence(RNA_sequence == 1) = 'U';
RNA_sequence(RNA_sequence == 2) = 'C';
RNA_sequence(RNA_sequence == 3) = 'A';
RNA_sequence(RNA_sequence == 4) = 'G';
% Change unicode values of U, C, A, G into a character string
RNA_sequence = char(RNA_sequence);

% Break the row vector into character strings per 3 characters
RNA_sequence = cellstr(reshape(RNA_sequence,3,[])');
codon = RNA_sequence';
amino_sequence = [];

% Switch case to replace codon into amino acid name
for j = 1:length(codon)
    switch codon{j}
        case {'UUU','UUC'}
            amino_sequence = [amino_sequence,'-Phe'];
        case {'UUA','UUG','CUU','CUC','CUA','CUG'}
            amino_sequence = [amino_sequence,'-Leu'];
        case {'AUU','AUC','AUA'}
            amino_sequence = [amino_sequence,'-Ile'];
        case {'AUG'}
            amino_sequence = [amino_sequence,'-Met'];
        case {'GUU','GUC','GUA','GUG'}
            amino_sequence = [amino_sequence,'-Val'];
        case {'UCU','UCC','UCA','UCG'}
            amino_sequence = [amino_sequence,'-Ser'];
        case {'CCU','CCC','CCA','CCG'}
            amino_sequence = [amino_sequence,'-Pro'];
        case {'ACU','ACC','ACA','ACG'}
            amino_sequence = [amino_sequence,'-Thr'];
        case {'GCU','GCC','GCA','GCG'}
            amino_sequence = [amino_sequence,'-Ala'];
        case {'UAU','UAC'}
            amino_sequence = [amino_sequence,'-Tyr'];
        case {'UAA','UAG'}
            amino_sequence = [amino_sequence,'-STOP'];
        case {'CAU','CAC'}
            amino_sequence = [amino_sequence,'-His'];
        case {'CAA','CAG'}
            amino_sequence = [amino_sequence,'-Gln'];
        case {'AAU','AAC'}
            amino_sequence = [amino_sequence,'-Asn'];
        case {'AAA','AAG'}
            amino_sequence = [amino_sequence,'-Lys'];
        case {'GAU','GAC'}
            amino_sequence = [amino_sequence,'-Asp'];
        case {'GAA','GAG'}
            amino_sequence = [amino_sequence,'-Glu'];
        case {'UGU','UGC'}
            amino_sequence = [amino_sequence,'-Cys'];
        case {'UGA'}
            amino_sequence = [amino_sequence,'-STOP'];
        case {'UGG'}
            amino_sequence = [amino_sequence,'-Trp'];
        case {'CGU','CGC','CGA','CGG'}
            amino_sequence = [amino_sequence,'-Arg'];
        case {'AGU','AGC'}
            amino_sequence = [amino_sequence,'-Ser'];
        case {'AGA','AGG'}
            amino_sequence = [amino_sequence,'-Arg'];
        case {'GGU','GGC','GGA','GGG'}
            amino_sequence = [amino_sequence,'-Gly'];
    end
end

amino_sequence(1) = [];