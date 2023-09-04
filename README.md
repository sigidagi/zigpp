## Cross-compiling with zig

### Zig install

[download link](https://ziglang.org/download/)

Advantage using 'Zig' compiler for cross-compilation: 
1. Zig can compile to all supported targets with a single toolchain.Check all supported targets: `zig targets`
2. Hermetic toolchain. Given the same input, always produces the same output regardless of the environment. In this context “hermetic” means that it does not use files from the host (which is “leaky”) and contains everything it needs to compile a file. 


