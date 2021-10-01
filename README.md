# Table Of Contents

- [About](#generic-makefile-template-for-c)
- [Variables](#variables)
- [Flags]()
- [Generated file lists](#generated-file-lists)
- [Generated string lists](#generated-string-lists)
- [Rules](#rules)
- [.PHONY / .PRECIOUS Rules](#phony--precious-rules)
- [Help](#help)

----------------------------------

# Generic makefile template for C++

### Auto dependency generation and deep file hierarchy support

* Copy this into the top level directory of the project.
* Change the variables in the blocked out section to your specifications.
* For usage go to the [help](#help) section

## Variables
![](/assets/images/variables.jpg)

| Name | Operation | Examples |
|------|-----------|----------|
| TEST | To control whether to link against Google Test or not. | TEST := 0 (0 = no, 1 = yes) |
| SHELL | Sets the shell that the makefile will use. | SHELL := /bin/bash |
| CC | The compiler that we will use. | CC := g++ |
| LD | The linker that we will use. | LD := g++ |
| TARGET | The name of the executable to create. | TARGET := main |
| ARCHNAME | The name of the tarball to create. | ARCHNAME := projectArchive |
| A_EXC | The names of the files/folders to be excluded from tarball | A_EXC := ./private ./admin priv.sh notArchiving.txt|
| SOURCEDIR | The directory of the .cpp files. | SOURCEDIR := src or SOURCEDIR := src/cpp |
| INCDIR | The directory of the .h files. | INCDIR := inc or INCDIR := src/h |
| OBJECTDIR | The directory to store the created .o files. | OBJECTDIR := obj |
| DEPSDIR | The directory to store the created .d files. | DEPSDIR := deps |
| LOGS | The directory to store the error log files. | LOGS := .logs |

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

## Generated string lists
![](/assets/images/stringGen.jpg)
| Name | Operation |
|------|-----------|
| COMPILE.cpp | Instruction string to use for compiling. |
| LINK.o | Instruction string to use for linking. |
| POSTCOMPILE | Instruction string to use after compiling. |

## Rules
![](/assets/images/compRules.jpg)
| Name | Operation |
|------|-----------|
| all | The entry point of the makefile. |
| $(ALLDIRS): | The rule for creating the directiories. |
| $(TARGET): $(OBJECTS) | The rule for linking. |
| $(OBJECTDIR)/%.o: $(SORUCEDIR)/%.cpp $(DEPSDIR)/%.d | The rule for compiling. |

## .PHONY / .PRECIOUS Rules
![](/assets/images/pRules.jpg)
| Name | Operation |
|------|-----------|
| $(DEPSDIR)/%.d |  Ensure the dep files were created. |
| clean | The rule to deleted all created files. |
| run | The rule to run the executable. |
| errt | The rule to display the error logs in one less. |
| errs | The rule to display the error logs in seperate less. |
| dist | The rule to create the tarball. |

## Help
![](/assets/images/help.jpg)
| Name | Operation |
|------|-----------|
| make | Compiles and links the files in the specified directories. |
| make run | Runs the specified executable. |
| make clean | Removes all the files created during the make process. |
| make dist | Creates an archive of the root directory, exxcluding the specified files. |
| make errt | Displays the error logs in one less command. |
| make errs | Displays the error logs in multiple less commands. |
