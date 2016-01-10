program hangman;

uses crt;

var input,guess:string;

letters : array [1..26] of string;

attempts,len,x,y,current:integer;

returned,won,invalid:boolean;

procedure main;
begin

    write('Word to guess: ');
    
    for x := 1 to len do
    begin
    
        returned := false;
        
        for y := 1 to 26 do 
        begin
            if letters[y] = input[x] then 
            begin
                write(letters[y]);
                returned := true;
            end;
        end;
        
        if returned = false then write('*');
        
    end;
    
    returned := false;
    
    writeln;
    writeln;
    writeln('You have ', attempts, ' attempts left. Write letter or guess word...');
    
    repeat
    
        invalid := false;
        
        writeln;
        readln(guess);
        writeln;
    
        if Length(guess) = 1 then
        begin
            for x := 1 to len do
            begin 
                if guess = input[x] then
                begin
                    letters[current] := guess;
                    current := current + 1;
                    returned := true;
                end;
            
                if returned = true then break;
            end;
        end
        else if Length(guess) = len then
        begin
            if guess = input then won := true
            else writeln('You guessed the word incorrectly!');
        end
        else
        begin
            writeln('You can only enter one letter! Try again...');
            invalid := true;
        end;
    
    until invalid = false;
    
    if current = len then won := true;
    
    if won = false then attempts := attempts - 1;

end;

begin

    clrscr;
    TextColor(White);
    
    attempts := 5;
    current := 1;
    
    writeln('Welcome to Hang Man, enter a word to guess below...');
    writeln;
    readln(input);
    
    len := Length(input);
    clrscr;
    
    repeat
        main;
    until (won = true) xor (attempts = 0);
    
    if won = true then writeln('You guessed the word correctly!')
    else writeln('You ran out of attempts! Game over!');
    
    readln;
    
end.
