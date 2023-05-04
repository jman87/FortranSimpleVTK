# Disable all of make's built-in rules (similar to Fortran's implicit none)
MAKEFLAGS += --no-builtin-rules --no-builtin-variables

################################################################################
#                                  Executable                                  #
################################################################################
EXE = libFortranSimpleVTK.a

################################################################################
#                              Directories & Paths                             #
################################################################################
EXE_DIR = bin/
SRC_DIR = src/
OBJ_DIR = obj/

VPATH = $(SRC_DIR):$(OBJ_DIR)

################################################################################
#                                    Sources                                   #
################################################################################
SRCS = \
FortranSimpleVTK.f90 \
kind_module.f90 \
fsvtk_constants.f90 \
fsvtk_file_smod.f90 \
fsvtk_points_smod.f90 \
fsvtk_cells_smod.f90 \
fsvtk_vtu_smod.f90 \
fsvtk_variables.f90 \
string_operation_module.f90

SRC = $(addprefix $(SRCS_DIR), $(SRCS))

################################################################################
#                                    Ojects                                    #
################################################################################
OBJS = \
FortranSimpleVTK.o \
kind_module.o \
fsvtk_constants.o \
fsvtk_file_smod.o \
fsvtk_points_smod.o \
fsvtk_cells_smod.o \
fsvtk_vtu_smod.o \
fsvtk_variables.o \
string_operation_module.o

OBJ = $(addprefix $(OBJ_DIR), $(OBJS))
################################################################################
#                               ar Library Linker                              #
################################################################################
# Linking (ar)
LD = ar
# Linker Flags (ar)
LFLAGS = r

################################################################################
#                             GNU Fortran Compiler                             #
################################################################################
# Fortran Compiler
FC = gfortran
# Compiler Flags (GFortran)
CFLAGS = -O2 -std=f2018 -fimplicit-none -pedantic -Wall -J$(OBJ_DIR)

# Linking (GFortran)
# LD = gfortran
# Linker Flags (GFortran)
#LFLAGS = -static -static-libgfortran -static-libgcc -flinker-output=exec

################################################################################
#                            Intel Fortran Compiler                            #
################################################################################
# Fortran Compiler
# FC = ifort
# Compiler Flags (Intel)
# CFLAGS = -O2 -std18 -module $(OBJ_DIR)

# Linking (Intel)
# LD = ifort
# Linker Flags (Intel)
#LFLAGS =

################################################################################
#                                Debugging Rules                               #
################################################################################
.PHONY: all clean

printobj:
	@echo ""
	@echo "OBJS:"
	@echo $(OBJS)
	@echo ""
	@echo "OBJ:"
	@echo $(OBJ)

printsrc:
	@echo ""
	@echo "SRCS:"
	@echo $(SRCS)
	@echo ""
	@echo "SRC:"
	@echo $(SRC)

################################################################################
#                            Compiling/Linking Rules                           #
################################################################################

all: $(EXE)

$(EXE): $(OBJS)
	@mkdir -p $(EXE_DIR)
	$(LD) $(LFLAGS) $(EXE_DIR)$(EXE) $(OBJ)
#	$(LD) $(LFLAGS) -o $(EXE_DIR)$(EXE) $(OBJ)

objects: $(OBJS)

$(OBJS):
	@mkdir -p $(OBJ_DIR)
	$(FC) $(CFLAGS) -c $(SRC_DIR)$(@:.o=.f90) -o $(OBJ_DIR)$@
	@touch $(OBJ_DIR)$@

clean:
	rm -f $(SRC_DIR)*.o $(SRC_DIR)*.mod $(SRC_DIR)*.smod $(SRC_DIR)*.i90
	rm -f $(OBJ_DIR)*.o $(OBJ_DIR)*.mod $(OBJ_DIR)*.smod $(OBJ_DIR)*.i90 
	rm -f $(OBJ_DIR)*.a
	rm -f $(EXE_DIR)$(EXE)

################################################################################
#                                  Dependencies                                #
################################################################################

# Support Modules
string_operation_module.o: \
	string_operation_module.f90
kind_module.o: \
	kind_module.f90
fsvtk_constants.o: \
	fsvtk_constants.f90 \
	kind_module.o
fsvtk_variables.o: \
	fsvtk_variables.f90 \
	kind_module.o

# Main Module/Program
FortranSimpleVTK.o: \
	FortranSimpleVTK.f90 \
	kind_module.o \
	fsvtk_constants.o \
	fsvtk_variables.o \
	string_operation_module.o

# Submodules for FortranSimpleVTK.f90
fsvtk_file_smod.o: \
	fsvtk_file_smod.f90 \
	fsvtk_variables.o
fsvtk_points_smod.o: \
	fsvtk_points_smod.f90 \
	fsvtk_variables.o
fsvtk_cells_smod.o: \
	fsvtk_cells_smod.f90 \
	fsvtk_variables.o
fsvtk_vtu_smod.o: \
	fsvtk_vtu_smod.f90 \
	fsvtk_variables.o
