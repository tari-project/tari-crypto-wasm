# Tari Crypto WASM Wrapper

This is a WASM library wrapper for (Tari Crypto)[https://github.com/tari-project/tari-crypto]

# Compiling to WebAssembly

To build the WebAssembly module, the `wasm` feature must be enabled:

    $ wasm-pack build . -- --features "wasm"

To generate a module for use in node.js, use this command:

    $ wasm-pack build --target nodejs -d tari_js . -- --features "wasm"

To run the wasm bindings unit tests, use this command:

    $ wasm-pack test --node --features wasm

Note: Node v10+ is needed for the WASM

## Example (Node.js)

```js
const keys = KeyRing.new();

// Create new keypair
keys.new_key("Alice");
keys.new_key("Bob");
console.log(`${keys.len()} keys in ring`); // 2
console.log("kA = ", keys.private_key("Alice"));
console.log("PB = ", keys.public_key("Bob"));
keys.free();
```

# Benchmarks

To run the benchmarks:

    $ cargo bench

The benchmarks use Criterion and will produce nice graphs (if you have gnuplot installed)

To run the benchmarks with SIMD instructions:

    $ cargo bench --features "avx2"

# Building the C FFI module

To build the C bindings, you can run

    make ffi

To build the release version (recommended):

    make ffi-release

To run the small demo:

    make demo
    ./bin/demo
