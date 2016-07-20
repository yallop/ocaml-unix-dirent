open Ocamlbuild_plugin;;
open Ocamlbuild_pack;;

let ctypes_libdir = Sys.getenv "CTYPES_LIB_DIR" in
let ocaml_libdir = Sys.getenv "OCAML_LIB_DIR" in
let lwt_libdir = try Sys.getenv "LWT_LIB_DIR" with Not_found -> "" in

dispatch begin
  function
  | After_rules ->

    Ctypes_rules.rules ~prefix:"dirent" ~bindings_dir:"unix" ~os:"unix"
      ~ctypes_libdir ~lwt_libdir ~ocaml_libdir
      ()
  | _ -> ()
end;;
