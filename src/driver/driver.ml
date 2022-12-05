let () = Findlib.init ()

let load_plugin name =
  try Fl_dynload.load_packages [ name ]
  with Dynlink.Error err -> Printf.printf "%s\n" (Dynlink.error_message err)

let execute_plugin plugin data =
  Printf.printf "Executing: %s\n" plugin;
  Demo_lib.execute plugin data

let () =
  let plugin = Sys.argv.(1) in
  let data = Sys.argv.(2) in
  load_plugin plugin;
  execute_plugin plugin data
