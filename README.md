# ocaml-plugins-demo
This project demonstrates how to use the [Findlib library](projects.camlcity.org/projects/findlib.html) to implement a system with dynamically loaded plugins.

The project structured as follows:
- `src/lib` is a library that provides a public interface that must be implemented by plugins
- `src/driver` is an executable that loads and runs a given plugin
- `src/plugin` contains a demo plugin

The driver dynamically loads a compiled plugin that implements the `Plugin` module signature from the library. When running, the plugin transforms the provided input data.

The idea of this demo is to show that the same approach could be used to transform more complicated structures like ASTs using external plugins without recompiling the library or the driver.

## Usage
Clone a repository and build the project from the source:
```
git clone https://github.com/jubnzv/ocaml-plugins-demo
cd ocaml-plugins-demo
dune build
```

To run the experiment, execute:
```
export OCAMLPATH=_build/install/default/lib
_build/default/src/driver/driver.exe demo_plugin test
```

The expected output is:
```
Registered: demo_plugin
Executing: demo_plugin
demo_plugin executed: test_demo
```

Under the hood the driver dynamically loads and executes the plugin `demo_plugin.cxo` on the input data `"test"`. The plugin get the input string and transforms it adding the `_demo` suffix to it.

## Alternative approaches
1. `dune` has its own [plugins infrastructure](https://dune.readthedocs.io/en/stable/sites.html#plugins). This requires inclusion of source code of plugins to the codebase.
2. [janestreet/ocaml_plugin](https://github.com/janestreet/ocaml_plugin/) is a wrapper for `Dynlink` module that allows to compile OCaml source files and immediately link them using `Dynlink`. These modules must implement the interface present in the user's code.

## References
1. [OCaml library : Dynlink](https://v2.ocaml.org/api/Dynlink.html)
2. [OCaml - The dynlink library: dynamic loading and linking of object files](https://v2.ocaml.org/manual/libdynlink.html)
3. [[Dune] Link against cmo / cmi without source? - Ecosystem - OCaml](https://discuss.ocaml.org/t/dune-link-against-cmo-cmi-without-source/2488/10)
4. [dune: Findlib integration](https://dune.readthedocs.io/en/stable/advanced-topics.html#dynamic-loading-of-packages-with-findlib)
