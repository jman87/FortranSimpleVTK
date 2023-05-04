# FortranSimpleVTK

## Overview

FortranSimpleVTK is a Fortran library for generating VTK files. It is written
in conformance to the Fortran 2018 Standard and comes with a Makefile to help 
with implementation.

It is intended to be a simple module that can be used by other Fortran programs
that need to write finite element data in a format that can be read into 
ParaView. It is intentionally NOT object-oriented, as there are already other object-oriented packages available in Fortran and other languages. This code is intended for use by those Fortran users who prefer to avoid OOP while taking advantage of modern syntax and features. 

The emphasis for this package has been to support research in the
field of solid mechanics and structural dynamics. Thus, the element types
supported are those more common to these fields. The program, however, can
easily be extended to cover any of the VTK types.

Currently, this library only supports writing VTU (unstructured grid) data in
XML-ASCII format. As a side note, many are unaware that the VTK standard does
not require that XML files be Binary - they can actually be ASCII, Binary, or
Appended. For more details on this, please consult official VTK documentation.
The XML-ASCII was chosen to permit the newer features of XML to be utilized
while still permitting users and developers to easily inspect the generated
VTK files (which is obviously much harder if most of the data is binary).

## License

FortranSimpleVTK is licensed under the permissive MIT License.

## Contribution

Contributions to FortranSimpleVTK are most welcome. Please feel free to fork
the repository and contact the developer through GitHub if you feel your edits
would be appreciated and in keeping with the overall design of the code.

NOTE: If you desire for your edits to be seriously considered, then please 
study the syntax/style of the existing source code and follow that as a general
guide for your edits. Again, this code intentionally avoids OOP, while taking
advantage of more modern features like operator overloading and submodules.

## Compiling

FortranSimpleVTK can be compiled/built using the provided `Makefile`. The 
`Makefile` may require some editing depending on your system. It was originally
configured to work on a Mac with either the GCC/GFortran (installed by HomeBrew)
or the Intel Fortran Classic Compiler (which is now freely availabe from Intel).

The `Makefile` currently has the following options:

* `make clean` => Delete all object files and library files
* `make objects` => Compile all required modules/submodules and place them in
/obj directory
* `make all` => Compile all required modules/submodules and build `libFortranSimpleVTK.a` and place in /bin directory

## Usage

A test program is provided in the file `test_FortranSimpleVTK.f90`. 
This program imports the FortranSimpleVTK libary via a `use` statement and then demonstrates how to generate a simple VTK file by calling various 
FortranSimpleVTK procedures.

The following lists the Fortran procedures relevant to the supported file types.

### Unstructured Grid (VTU)

* `initialize_vtu_file`
* `finalize_vtu_file`
* `write_vtu_mesh`
* `write_cell_data`
* `write_point_data`
