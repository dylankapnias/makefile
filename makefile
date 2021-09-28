##########################################################################
#
#	@author Dylan Kapnias
#
#	@description A makefile for C++ compilation with an automatic
#				 dependency creation. 
#
##########################################################################


###############################################
# Change these variables to your specifications
###############################################
# Setting shell
SHELL=/bin/bash
# Setting compiler
CC := g++
# Linker
LD := g++
# Target file of compilation
TARGET := Main
# Name of archive without extension
ARCHNAME := # Insert name here #
# Archive excludes
A_EXC := # Insert paths here, space delimited i.e. ./private priv.sh #
# Source file path without final '/'
SORUCEDIR := .# Insert path here i.e. src, if all in same file use'.' #
# Include file path without final '/'
INCDIR := .# Insert path here i.e. inc, if all in same file use '.' #
# Object file path without final '/'
OBJECTDIR := .# Insert path here i.e. obj, if all in same file use '.' #
# Dependency file path without final '/'
DEPSDIR := .# Insert path here i.e. dep, if all in same file use '.' #
# Log directory without final '/'
LOGS := .logs# Insert path here i.e. .logs #
###############################################
# End of variables
###############################################


###############################################
# Setting flags
###############################################
# List of all flags tags
CPPFLAGS := \
-g \
-Wall \
-Wextra \
-pedantic \
-Weffc++
# List of dependency flags
DEPFLAGS = \
-MT \
$@ \
-MD \
-MP \
-MF \
$(DEPSDIR)/$*.d.tmp
# List of linking flags
LINKFLAGS := \
# List of archive exclude flags
A_EXC_FLAGS := $(addprefix --exclude=,$(A_EXC))
###############################################
# End of flags 
###############################################


###############################################
# Generating based off Source files 
###############################################
# Source files
SOURCES := $(wildcard $(SORUCEDIR)/*.cpp)
# Object files
OBJECTS := $(patsubst %.cpp, $(OBJECTDIR)/%.o, $(notdir $(SOURCES)))
# Dependency files
DEPS := $(patsubst %.cpp, $(DEPSDIR)/%.d, $(notdir $(SOURCES)))
# All created directories used
ALLDIRS := $(sort $(OBJECTDIR) $(DEPSDIR) $(LOGS))
# All remaining files
ALLFILES := $(wildcard *.o) $(wildcard *.d) 
###############################################
# End of generation 
###############################################


###############################################
# Setting the strings to use for compilation
###############################################
# Compile string
COMPILE.cpp = $(CC) $(DEPFLAGS) $(CPPFLAGS) -c -o $@
# Link string
LINK.o = $(LD) $(LINKFLAGS) -o $@
# Post compilation string
POSTCOMPILE = mv -f $(DEPSDIR)/$*.d.tmp $(DEPSDIR)/$*.d
###############################################
# End of string setting 
###############################################


# '@' makes the command that is being run only display it's output and not itself.

# Entry point for makefile
all: $(ALLDIRS) $(TARGET)
	@echo "======================="
	@echo "All done."
	@echo "======================="

# Creating all required directories
$(ALLDIRS):
	@mkdir -p $@

# Linking with a list of rules:
# $@ expands into the rule's target
# $^ expands into the rule's dependencies
$(TARGET): $(OBJECTS)
	@echo "======================="
	@echo "Linking the target $@"
	@echo "======================="
	@$(LINK.o) $^
	@echo "-- Linking finished. --"

# Compiling with a pattern rule:
# $(OBJECTDIR)/%.o: $(SORUCEDIR)/%.cpp is saying create a .o file for every .cpp file
# $@ is the pattern matched target
# $< is the pattern matched dependency
$(OBJECTDIR)/%.o: $(SORUCEDIR)/%.cpp $(DEPSDIR)/%.d
	@echo "======================="
	@echo "Compiling $<."
	@echo "======================="
	@$(COMPILE.cpp) $< > $(LOGS)/$(basename $(notdir $@)).log 2>&1
	@$(POSTCOMPILE)

# Dependecy rules (.PRECIOUS stops the target from being deleted if make happens to be interrupted during the recipe)
.PRECIOUS: $(DEPSDIR)/%.d
$(DEPSDIR)/%.d: ;

# Setting the includes
-include $(DEPS)

# Cleaning directories of compiled files (.PHONY shows the makefile that the name is not a file and only a recipe)
.PHONY: clean
clean:
	@rm -f $(TARGET) $(ALLFILES)
	@rm -fr $(ALLDIRS) 2&> /dev/null || :
	@echo "======================="
	@echo "Cleaning done"
	@echo "======================="

# Running executable
.PHONY: run
run:
	@echo "======================="
	@echo "Running ./$(TARGET)."
	@echo "======================="
	@./$(TARGET)

# Display error logs in one less command
.PHONY: errt
errt:
	@find $(LOGS) -type f -exec less '{}' +;

# Display error logs in seperate less commands
.PHONY: errs
errs:
	@find $(LOGS) -type f -exec less '{}' \;

# Archive
.PHONY: dist
dist:
	@tar $(A_EXC_FLAGS) -zcvf $(ARCHNAME).tar.gz *
	@echo "======================="
	@echo "Tarball created."
	@echo "======================="
