# Generic makefile template for C++

### Auto dependency generation and file hierarchy support

* Copy this into the top level directory of the project.
* Change the variables in the blocked out section to your specifications.

## Variables
![](/assets/images/variables.jpg)

| Name | Operation | Examples |
|------|-----------|----------|
| SHELL | Sets the shell that the makefile will use. | SHELL := /bin/bash |
| CC | The compiler that we will use. | CC := g++ |
| LD | The linker that we will use. | LD := g++ |
| TARGET | The name of the executable to create. |
| ARCHNAME | The name of the tarball to create. | ARCHNAME := projectArchive |
| A_EXC | The names of the files/folders to be excluded from tarball | A_EXC := ./private ./admin priv.sh notArchiving.txt|
| SOURCEDIR | The directory of the .cpp files. | SOURCEDIR := src or SOURCEDIR := src/cpp |
| INCDIR | The directory of the .h files. | INCDIR := inc or INCDIR := src/h |
| OBJECTDIR | The directory to store the created .o files. | OBJECTDIR := obj |
| DEPSDIR | The directory to store the created .d files. | DEPSDIR := deps |
| LOGS | The directory to store the error log files. |

## Flags
![](/assets/images/flags.jpg)

| Name | Operation |
|------|-----------|
| CPPFLAGS | A set of compiler flags to use. |
| DEPFLAGS | A set of dependency creation flags to use. |
| LINKFLAGS | A set of linker flags to use. |
| A_EXC_FLAGS | Generating the archive exclude flags. |

## Generated file lists
![](/assets/images/fileGen.jpg)

| Name | Operation |
|------|-----------|
| SOURCES | Generatng the .cpp file list. |
| OBJECTS | Generating the .o file list. |
| DEPS | Generating the .d file list. |
| ALLDIRS | Generating the dir list. |
| ALLFILES | Generating the remaining file list. |

## Generated strings list
![](/assets/images/stringGen.jpg)
| Name | Operation |
|------|-----------|
| COMPILE.cpp | Instruction string to use for compiling. |
| LINK.o | Instruction string to use for linking. |
| POSTCOMPILE | Instruction string to use after compiling. |

## Recipes
![](/assets/images/compRules.jpg)
| Name | Operation |
|------|-----------|
| all | The entry point of the makefile. |
| $(ALLDIRS): | The recipe for creating the directiories. |
| $(TARGET): $(OBJECTS) | The recipe for linking. |
| $(OBJECTDIR)/%.o: $(SORUCEDIR)/%.cpp $(DEPSDIR)/%.d | The recipe for compiling. |

## .PHONY / .PRECIOUS Recipes
![](/assets/images/pRules.jpg)
| Name | Operation |
|------|-----------|
| $(DEPSDIR)/%.d |  Ensure the dep files were created. |
| clean | The recipe to deleted all created files. |
| run | The recipe to run the executable. |
| errt | The recipe to display the error logs in one less. |
| errs | The recipe to display the error logs in seperate less. |
| dist | The recipe to create the tarball. |
