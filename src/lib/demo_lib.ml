(** A definition of the library used by both plugins and the driver. *)

open Core

(** An interface to be implemented by each plugin *)
module type Plugin = sig
  val transform : string -> string
end

(** All registered plugins *)
let registered_plugins: ((string, (module Plugin)) Caml.Hashtbl.t) =
  Caml.Hashtbl.create 1

(** Registers a new plugin *)
let register name plugin =
  Caml.Hashtbl.add registered_plugins name plugin;
  Printf.printf "Registered: %s\n" name

(** Executes registered plugin [name] with input [data]. Raises [Not_found] if
    there is no known registered plugin with this name. *)
let execute (name : string) (data : string) =
  let plugin = Caml.Hashtbl.find registered_plugins name in
  let module P = (val plugin : Plugin) in
  P.transform data
  |> Printf.printf "%s executed: %s\n" name
