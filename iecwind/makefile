#================================================================================#
# This makefile created by B. Jonkman on 19-Feb-2013,                            #
# adapted from Crunch (M. Buhl on 25-Jan-2013).                                  #
# (c) 2013 National Renewable Energy Laboratory                                  #
#                                                                                #
# This makefile has been tested on Windows 7 with gfortran.                      #
# This makefile works with mingw32-make.exe.                                     #
#                                                                                #
# It was designed to be used with:                                               #
#     FAST                    (v7.02.00d-bjj, 20-Feb-2013)                       #
#     AeroDyn                 (v13.00.02a-bjj, 20-Feb-2013)                      #
#     InflowWind              (v1.01.00b-bjj, 10-Aug-2012)                       #
#     NWTC Subroutine Library (v1.07.00b-mlb, 10-Jan-2013)                       #
#                                                                                #
# Older versions of the source code may not work with this makefile.             #
#================================================================================#

   # 32-bit or 64-bit?
BITS = 32
#BITS = 64


   # Location of source files for FAST, AeroDyn, InflowWind, and the NWTC Library.
   # You will probably need to change these for your system.


ifeq ($(OS),Windows_NT)
else
   WIND_DIR     = ../externals/nrel-iecwind/Source
endif


   # Name of compiler to use and flags to use.
FC      = gfortran
FFLAGS  = -O2 -m$(BITS) -fbacktrace -finit-local-zero -fno-automatic -ffree-line-length-none
LDFLAGS = -O2 -m$(BITS) -fbacktrace

# other useful gfortran options:
#  -fdefault-real-8 -fcheck=bounds -std=f2003 -O0 -v


   # Precision.

# Use "SingPrec" for single precision and "DoubPrec" for double precision. You may also need to change an option switch to make constants DP.
PREC = SingPrec


   # Destination and RootName for executable

OUTPUT_NAME = IECWind
DEST_DIR    = .

   #==========================================================#
   # You should not need to change anything beyond this point #
   #==========================================================#

   # System-specific settings.

ifeq ($(OS),Windows_NT)
      # Windows
   DEL_CMD   = del
   EXE_EXT   = _gwin$(BITS).exe
   INTER_DIR = Obj_win$(BITS)
   MD_CMD    = @mkdir
   OBJ_EXT   = .obj
   PATH_SEP  = \\
   SYS_FILE  = SysGnuWin
else
      # Linux
   DEL_CMD   = rm -f
   EXE_EXT   = _glin$(BITS)
   INTER_DIR = Obj_lin$(BITS)
   MD_CMD    = @mkdir -p
   OBJ_EXT   = .o
   PATH_SEP  = /
   SYS_FILE  = SysGnuLinux
endif


   # Source files (by module)

WIND_SOURCES =          \
	IECwind.f90 


vpath %.f90 $(WIND_DIR)
vpath %.mod $(INTER_DIR)
vpath %.obj $(INTER_DIR)

WIND_OBJS     = $(WIND_SOURCES:.f90=.obj)
ALL_OBJS      =  $(WIND_OBJS) 

   # Rule to do everything.

all:     default
default:  $(INTER_DIR) $(DEST_DIR)/$(OUTPUT_NAME)$(EXE_EXT)

   # General rules for compliling the files.

%.obj: %.f90
	$(FC)  $(FFLAGS) -c $< -o $(INTER_DIR)/$@ -J $(INTER_DIR)

fftpack.obj: fftpack.f
	$(F77) $(FFLAGS) -c $< -o $(INTER_DIR)/$@ -J $(INTER_DIR)

IECwind.obj:

#$(OUTPUT_NAME)$(EXE_EXT): Fast_Prog.obj

   # Make sure the destination directory for the intermediate files exist.

$(INTER_DIR):
	$(MD_CMD) $(INTER_DIR)


   # For linking FAST.

$(DEST_DIR)/$(OUTPUT_NAME)$(EXE_EXT): $(ALL_OBJS) | $(INTER_DIR)
	$(FC) $(LDFLAGS) -I $(INTER_DIR) -o $(DEST_DIR)/$(OUTPUT_NAME)$(EXE_EXT) \
	$(foreach src, $(ALL_OBJS), $(addprefix $(INTER_DIR)/,$(src)))

   # Cleanup afterwards.

clean:
	$(DEL_CMD) $(INTER_DIR)$(PATH_SEP)*.mod $(INTER_DIR)$(PATH_SEP)*.obj

