# 23 "src/wp/script.mll"
 

  type token =
    | Id of string
    | Key of string
    | Proof of string
    | Word
    | Eof

  let fill buffer lexbuf =
    Buffer.add_string buffer (Lexing.lexeme lexbuf)

  open Lexing

  let newline lexbuf =
    lexbuf.lex_curr_p <-
      { lexbuf.lex_curr_p with pos_lnum = succ lexbuf.lex_curr_p.pos_lnum }


# 22 "src/wp/script.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base = 
   "\000\000\247\255\248\255\000\000\250\255\078\000\160\000\254\255\
    \002\000\238\000\060\001\138\001\216\001\007\000\253\255\249\255\
    \111\001\251\255\252\255\253\255\001\000\000\000\255\255\254\255\
    \011\002\249\255\250\255\251\255\006\000\018\000\027\000\024\000\
    \036\000\015\000\255\255\019\000\037\000\016\000\000\000\254\255\
    \252\255\112\001\251\255\252\255\253\255\022\000\049\000\255\255\
    \254\255";
  Lexing.lex_backtrk = 
   "\255\255\255\255\255\255\008\000\255\255\004\000\004\000\255\255\
    \000\000\004\000\004\000\004\000\004\000\003\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\004\000\004\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\006\000\006\000\006\000\006\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\002\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\004\000\004\000\255\255\
    \255\255";
  Lexing.lex_default = 
   "\001\000\000\000\000\000\255\255\000\000\255\255\255\255\000\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\000\000\000\000\
    \017\000\000\000\000\000\000\000\255\255\255\255\000\000\000\000\
    \025\000\000\000\000\000\000\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\000\000\255\255\255\255\255\255\255\255\000\000\
    \000\000\042\000\000\000\000\000\000\000\255\255\255\255\000\000\
    \000\000";
  Lexing.lex_trans = 
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\008\000\007\000\008\000\000\000\008\000\000\000\008\000\
    \013\000\014\000\000\000\000\000\013\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \008\000\000\000\008\000\000\000\000\000\000\000\000\000\013\000\
    \003\000\022\000\015\000\023\000\004\000\005\000\004\000\040\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\004\000\004\000\038\000\034\000\034\000\048\000\
    \039\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \006\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\047\000\000\000\000\000\000\000\005\000\
    \000\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\035\000\032\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \033\000\036\000\037\000\000\000\000\000\000\000\000\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\000\000\000\000\000\000\000\000\005\000\000\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\000\000\000\000\000\000\000\000\005\000\000\000\000\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\000\000\000\000\000\000\000\000\005\000\
    \002\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\009\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\000\000\000\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\000\000\000\000\000\000\000\000\005\000\000\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\010\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\000\000\000\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\000\000\000\000\
    \000\000\018\000\043\000\000\000\000\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\020\000\
    \046\000\021\000\045\000\005\000\000\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\011\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \000\000\000\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\000\000\000\000\000\000\
    \000\000\005\000\000\000\005\000\005\000\005\000\005\000\005\000\
    \012\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\013\000\000\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\000\000\000\000\000\000\026\000\000\000\000\000\
    \000\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\029\000\000\000\028\000\000\000\005\000\
    \000\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\031\000\000\000\030\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\019\000\
    \044\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\027\000";
  Lexing.lex_check = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\008\000\255\255\000\000\255\255\008\000\
    \013\000\013\000\255\255\255\255\013\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\008\000\255\255\255\255\255\255\255\255\013\000\
    \000\000\021\000\003\000\020\000\000\000\000\000\000\000\028\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\029\000\033\000\037\000\045\000\
    \038\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\046\000\255\255\255\255\255\255\000\000\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\005\000\030\000\031\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \032\000\035\000\036\000\255\255\255\255\255\255\255\255\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\255\255\255\255\255\255\255\255\005\000\255\255\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\255\255\255\255\255\255\255\255\006\000\255\255\255\255\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\255\255\255\255\255\255\255\255\006\000\
    \000\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\009\000\255\255\255\255\009\000\009\000\
    \009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\009\000\
    \009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
    \009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
    \009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
    \009\000\255\255\255\255\255\255\255\255\009\000\255\255\009\000\
    \009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
    \009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
    \009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
    \009\000\010\000\255\255\255\255\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\255\255\255\255\
    \255\255\016\000\041\000\255\255\255\255\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\016\000\
    \041\000\016\000\041\000\010\000\255\255\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\011\000\
    \255\255\255\255\011\000\011\000\011\000\011\000\011\000\011\000\
    \011\000\011\000\011\000\011\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\011\000\011\000\011\000\011\000\011\000\
    \011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
    \011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
    \011\000\011\000\011\000\011\000\011\000\255\255\255\255\255\255\
    \255\255\011\000\255\255\011\000\011\000\011\000\011\000\011\000\
    \011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
    \011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
    \011\000\011\000\011\000\011\000\011\000\012\000\012\000\255\255\
    \012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\255\255\255\255\255\255\024\000\255\255\255\255\
    \255\255\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\024\000\255\255\024\000\255\255\012\000\
    \255\255\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\024\000\255\255\024\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\016\000\
    \041\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\024\000";
  Lexing.lex_base_code = 
   "";
  Lexing.lex_backtrk_code = 
   "";
  Lexing.lex_default_code = 
   "";
  Lexing.lex_trans_code = 
   "";
  Lexing.lex_check_code = 
   "";
  Lexing.lex_code = 
   "";
}

let rec token lexbuf =
    __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 46 "src/wp/script.mll"
           ( token lexbuf )
# 267 "src/wp/script.ml"

  | 1 ->
# 47 "src/wp/script.mll"
         ( newline lexbuf ; token lexbuf )
# 272 "src/wp/script.ml"

  | 2 ->
# 49 "src/wp/script.mll"
      (
        newline lexbuf ;
        let buffer = Buffer.create 512 in
        proof buffer 0 lexbuf ;
        Proof (Buffer.contents buffer)
      )
# 282 "src/wp/script.ml"

  | 3 ->
# 56 "src/wp/script.mll"
      (
        let buffer = Buffer.create 512 in
        proof buffer 0 lexbuf ;
        Proof (Buffer.contents buffer)
      )
# 291 "src/wp/script.ml"

  | 4 ->
# 62 "src/wp/script.mll"
      (
        Id (Lexing.lexeme lexbuf)
      )
# 298 "src/wp/script.ml"

  | 5 ->
# 65 "src/wp/script.mll"
                        ( Key(Lexing.lexeme lexbuf) )
# 303 "src/wp/script.ml"

  | 6 ->
# 66 "src/wp/script.mll"
         ( comment 0 lexbuf )
# 308 "src/wp/script.ml"

  | 7 ->
# 67 "src/wp/script.mll"
        ( Eof )
# 313 "src/wp/script.ml"

  | 8 ->
# 68 "src/wp/script.mll"
      ( Word )
# 318 "src/wp/script.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and comment n lexbuf =
    __ocaml_lex_comment_rec n lexbuf 16
and __ocaml_lex_comment_rec n lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 71 "src/wp/script.mll"
         ( if n > 0 then comment (pred n) lexbuf else token lexbuf )
# 329 "src/wp/script.ml"

  | 1 ->
# 72 "src/wp/script.mll"
         ( comment (succ n) lexbuf )
# 334 "src/wp/script.ml"

  | 2 ->
# 73 "src/wp/script.mll"
        ( failwith "Non-terminated comment" )
# 339 "src/wp/script.ml"

  | 3 ->
# 74 "src/wp/script.mll"
         ( newline lexbuf ; comment n lexbuf )
# 344 "src/wp/script.ml"

  | 4 ->
# 75 "src/wp/script.mll"
      ( comment n lexbuf )
# 349 "src/wp/script.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; __ocaml_lex_comment_rec n lexbuf __ocaml_lex_state

and proof buffer n lexbuf =
    __ocaml_lex_proof_rec buffer n lexbuf 24
and __ocaml_lex_proof_rec buffer n lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 79 "src/wp/script.mll"
      (
        if n > 0 then proof buffer (pred n) lexbuf
      )
# 362 "src/wp/script.ml"

  | 1 ->
# 82 "src/wp/script.mll"
          ( skip 0 lexbuf ; proof buffer n lexbuf )
# 367 "src/wp/script.ml"

  | 2 ->
# 83 "src/wp/script.mll"
          ( fill buffer lexbuf ; proof buffer (succ n) lexbuf )
# 372 "src/wp/script.ml"

  | 3 ->
# 84 "src/wp/script.mll"
          ( fill buffer lexbuf ;
            if n>0 then proof buffer (pred n) lexbuf
            else failwith "Non-terminated comment (inside proof)" )
# 379 "src/wp/script.ml"

  | 4 ->
# 87 "src/wp/script.mll"
         ( failwith "Non-terminated proof" )
# 384 "src/wp/script.ml"

  | 5 ->
# 88 "src/wp/script.mll"
         ( fill buffer lexbuf ; newline lexbuf ; proof buffer n lexbuf )
# 389 "src/wp/script.ml"

  | 6 ->
# 89 "src/wp/script.mll"
         ( fill buffer lexbuf ; proof buffer n lexbuf )
# 394 "src/wp/script.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; __ocaml_lex_proof_rec buffer n lexbuf __ocaml_lex_state

and skip n lexbuf =
    __ocaml_lex_skip_rec n lexbuf 41
and __ocaml_lex_skip_rec n lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 92 "src/wp/script.mll"
         ( skip (succ n) lexbuf )
# 405 "src/wp/script.ml"

  | 1 ->
# 93 "src/wp/script.mll"
         ( if n>0 then skip (pred n) lexbuf )
# 410 "src/wp/script.ml"

  | 2 ->
# 94 "src/wp/script.mll"
         ( () )
# 415 "src/wp/script.ml"

  | 3 ->
# 95 "src/wp/script.mll"
         ( newline lexbuf ; skip n lexbuf )
# 420 "src/wp/script.ml"

  | 4 ->
# 96 "src/wp/script.mll"
      ( skip n lexbuf )
# 425 "src/wp/script.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; __ocaml_lex_skip_rec n lexbuf __ocaml_lex_state

;;

# 98 "src/wp/script.mll"
 

  let filter key =
    let lexbuf = Lexing.from_string key in
    match token lexbuf with
      | Id a -> Some a
      | _ -> None

  type input = {
    src : string ;
    inc : in_channel ;
    lexbuf : Lexing.lexbuf ;
    mutable token : token ;
    mutable tik : int ;
  }

  let open_file f =
    let inc = open_in f in
    let lex = Lexing.from_channel inc in
    let tok = token lex in
    { src=f ; tik=0 ; inc=inc ; lexbuf=lex ; token=tok }

  let pp_token lexbuf fmt = function
    | Id x -> Format.fprintf fmt "ident '%s'" x
    | Key k -> Format.fprintf fmt "'%s'" k
    | Proof _ -> Format.fprintf fmt "Proof...Qed"
    | Eof -> Format.fprintf fmt "end-of-file"
    | Word -> Format.fprintf fmt "start of '%s'" (Lexing.lexeme lexbuf)


  let skip input =
    if input.token <> Eof then
      ( input.tik <- 0 ; input.token <- token input.lexbuf )
  let token input =
    input.tik <- succ input.tik ;
    if input.tik > 1000 then failwith "Blocked" ;
    input.token
  let close input = close_in input.inc
  let error input text =
    let buffer = Buffer.create 80 in
    let fmt = Format.formatter_of_buffer buffer in
    let line = (Lexing.lexeme_start_p input.lexbuf).Lexing.pos_lnum in
    Format.fprintf fmt "%s:%d: " input.src line ;
    Format.kfprintf
      (fun fmt ->
         Format.fprintf fmt "(at %a)" (pp_token input.lexbuf) input.token ;
         Format.pp_print_flush fmt () ;
         failwith (Buffer.contents buffer)
      ) fmt text

  let key input k =
    match input.token with
      | (Key a) | (Id a) when a=k -> skip input ; true
      | _ -> false

  let eat input k =
    if not (key input k) then error input "Missing '%s'" k

  let ident input =
    match input.token with
      | Id a -> skip input ; a
      | _ -> error input "Missing identifier"

  let rec idents input =
    match input.token with
      | Id a ->
          skip input ;
          if key input "," then a :: idents input else [a]
      | _ -> []


# 503 "src/wp/script.ml"