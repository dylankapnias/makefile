# Generic makefile template for C++

### Auto dependency generation and file hierarchy support

* Copy this into the top level directory of the project.
* Change the variables in the blocked out section to your specifications.

## Variables
![](/assets/images/variables.jpg)

| Name | Operation |
|------|-----------|
| SHELL | Sets the shell that the makefile will use. |
| CC | The compiler that we will use. |
| LD | The linker that we will use. |
| TARGET | The name of the executable to create. |
| ARCHNAME | The name of the tarball to create. |
| A_EXC | The names of the files/folders to be excluded from tarball |
| SOURCEDIR | The directory of the .cpp files. |
| INCDIR | The directory of the .h files. |
| OBJECTDIR | The directory to store the created .o files. |
| DEPSDIR | The directory to store the created .d files. |
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
