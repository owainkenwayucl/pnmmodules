{ 
  This unit provides routines for writing PGM/PBM images in Pascal.
  Owain Kenway, 2018
}

Unit ImageIO;

Interface

{ Type to make referring to 2D arrays easier. }
Type
  pixels = Array of Array of Integer;

{ 
  Procedure to write out PGM images

  d - the 2d array (of type pixels, above).
  m - the value of white (max value).
  filename - the file to write to/
}
procedure writepgm(Const d:pixels; Const m:Integer; Const filename:String);

{ 
  Procedure to write out PBM images

  d - the 2d array (of type pixels, above).
  threshold - the value at which 0 becomes 1..
  filename - the file to write to/
}
procedure writepbm(Const d:pixels; Const threshold:Real; Const filename:String);


Implementation

var 
  i, j : Integer;
  outfile : Text;


{ 
  Procedure to write out PGM images

  d - the 2d array (of type pixels, above).
  m - the value of white (max value).
  filename - the file to write to/
}
Procedure writepgm(Const d:pixels; Const m:Integer; Const filename:String);
  Begin

    { Open file for writing, new file. }
    Assign(outfile, filename);
    Rewrite(outfile);

    { Write PGM header. }
    WriteLn(outfile, 'P2');
    WriteLn(outfile, '# Written by pnmmodules (https://github.com/owainkenwayucl/pnmmodules)');
    WriteLn(outfile, Length(d), ' ', Length(d[Low(d)]));
    WriteLn(outfile, m);
 
    { Write out 2D array. }
    For j := Low(d[0]) To High(d[0]) Do
      Begin
        for i := Low(d) To High(d) Do
          Begin
            Write(outfile, d[i][j], ' ');
          End;
          WriteLn(outfile, '');
      End;

    { Tidy up. }
    Close(outfile);
  End;

{ 
  Procedure to write out PBM images

  d - the 2d array (of type pixels, above).
  threshold - the value at which 0 becomes 1..
  filename - the file to write to/
}
Procedure writepbm(Const d:pixels; Const threshold:Real; Const filename:String);
  Begin

    { Open file for writing, new file. }
    Assign(outfile, filename);
    Rewrite(outfile);

    { Write PBM header. }
    WriteLn(outfile, 'P1');
    WriteLn(outfile, '# Written by pnmmodules (https://github.com/owainkenwayucl/pnmmodules)');
    WriteLn(outfile, Length(d), ' ', Length(d[Low(d)]));
 
    { Write out 2D array. }
    For j := Low(d[0]) To High(d[0]) Do
      Begin
        for i := Low(d) To High(d) Do
          Begin
            If (d[i][j] >= threshold)  Then
              Write(outfile, 1, ' ')
            Else
              Write(outfile, 0, ' ');
          End;
          WriteLn(outfile, '');
      End;

    { Tidy up. }
    Close(outfile);
  End;

End.
