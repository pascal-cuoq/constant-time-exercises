(* ocamlopt unix.cmxa str.cmxa password.ml -o password *)

open Unix

let show_time () =
  let tod = gettimeofday () in
  let t = localtime tod in
  Printf.printf "%02d:%02d:%02d.%02d\n" 
    t.tm_hour t.tm_min t.tm_sec
    (int_of_float ((mod_float tod 1.0) *. 99.))

let correct_format =
  let f = Str.string_match (Str.regexp "[0-9][0-9][0-9][0-9][0-9]$") in
  fun attempt -> f attempt 0

exception Bad_password

let correct_password attempt =
  try 
    for i = 0 to 4 do
      if attempt.[i] <> Char.chr ((Char.code '2') + 2 * i + 
                                     (if (i > 2) then -3 else 0))
      then raise Bad_password;
      ignore (select [] [] [] 0.02); (* wait 0.02s *)
    done;
    true
  with Bad_password -> false
    
let () =
  while true do
    show_time ();
    Printf.printf "Password:";
    let attempt = read_line () in
    show_time ();
    if correct_format attempt 
    then begin
      if correct_password attempt
      then begin
        Printf.printf "Welcome.\n"; 
        exit 0 
      end
    end
    else begin
      Printf.printf "Password must have 5 digits (0-9).\n"
    end
  done
    
  
