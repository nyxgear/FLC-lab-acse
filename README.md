# FLC Laboratory part

This repo stores the [ACSE suite] and the solved exercises based on it.


- [Make commands](#make-commands)
	- [Compile compiler, compile program and run it](#compile-compiler-compile-program-and-run-it)
	- [Apply patch, compile compiler, compile program and execute it](#apply-patch-compile-compiler-compile-program-and-execute-it)
	- [Patch apply existing](#patch-apply-existing)
	- [Patch create new](#patch-create-new)
	- [Compile compiler](#compile-compiler)
	- [Compile program](#compile-program)
	- [Execute program](#execute-program)
	- [Clean](#clean)
	- [Clean acse](#clean-acse)
	- [Clean all exercises](#clean-all-exercises)
- [Professor's guidelines](#professors-guidelines)


## Make commands

> *ex* stands for *exercise* and is expected to be one directory on the root of the repo

### Compile compiler, compile program and run it

```bash
$ make ex=<exercise-dir>

# all: compile_compiler compile_program execute_program
```

### Apply patch, compile compiler, compile program and execute it

```bash
$ make patch_compile_execute ex=<exercise-dir>

# patch_compile_execute: patch_apply all
```

### Patch apply existing

```bash
$ make patch_apply ex=<exercise-dir>
```
The directory of the patch is expected to contain:

- __\<directory-name\>.patch__ the patch file
- __program.src__ the program to execute

### Patch create new

```bash
$ make patch_create_new ex=<exercise-dir>
```

The directory of the patch will be created with all the unstaged git changes.

### Compile compiler

```bash
$ make compile_compiler
```

### Compile program

```bash
$ make compile_program ex=<exercise-dir>
```

### Execute program

```bash
$ make execute_program ex=<exercise-dir>
```

### Clean

```bash
$ make clean

# clean: clean_acse clean_all_ex
```
Clean all the compiled compiler and program files.

**NB: It cleans also the changes made to the acse folder!!.**


### Clean acse

```bash
$ make clean_acse
```
Remove all unstaged git changes to acse folder introduced by the patch or by manual edits.

### Clean all exercises

```bash
$ make clean_all_ex
```
Clean all compilation files from all exercises.

## Professor's guidelines

In the following we assume that:
*   ${PATCH_DIR} is the directory containing patch files
*   ${ACSE_DIR} is the directory of the ACSE toolchain (the directory that
    contains the 'acse', 'assembler', 'mace' directories)

To apply a patch file:

  cd ${ACSE_DIR}
  patch -Np1 -i ${PATCH_DIR}/file.patch


To compile the compiler:

  make -C ${ACSE_DIR}

Given a source file 'program.src', to compile it through ACSE:

  ${ACSE_DIR}/bin/acse program.src   # if successful it produces 'output.cfg', 'output.asm'
  ${ACSE_DIR}/bin/asm output.asm     # if successful it produces 'output.o'
  ${ACSE_DIR}/bin/mace output.o      # it executes the compiled program

To check that the generated code reflects what you expect, you can verify the
content of 'output.cfg' file: it contains the code just after the codegen phase
of the compiler, where each scalar variable has a unique register associated
and where implicit memory operations have not been added yet.


[ACSE suite]: https://github.com/zerbfra/acse
