(lang dune 3.3)
(using dune_site 0.1)

(name ocaml-plugins-demo)
(version 0.0.1)
(authors "Georgiy Komarov")
(license MIT)
(source (github jubnzv/ocaml-plugins-demo))
(maintainers "Georgiy Komarov <jubnzv@gmail.com>")

(package
 (name driver)
 (depends (ocaml (>= 4.13))))

(package
 (name demo_lib)
 (depends (ocaml (>= 4.13))))

(package
 (name demo_plugin)
 (depends (ocaml (>= 4.13))))
