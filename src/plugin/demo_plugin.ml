(** The module implements [Demo_lib.Plugin] signature. *)
module DemoPluginImpl = struct
  let transform s = s ^ "_demo"
end

let () =
  Demo_lib.register "demo_plugin" (module DemoPluginImpl)
