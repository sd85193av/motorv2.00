#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/MOTOR_PIC1947_V2.00.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/MOTOR_PIC1947_V2.00.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=modbus-rtu.s MOTOR_1947_V2.00.s

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/modbus-rtu.o ${OBJECTDIR}/MOTOR_1947_V2.00.o
POSSIBLE_DEPFILES=${OBJECTDIR}/modbus-rtu.o.d ${OBJECTDIR}/MOTOR_1947_V2.00.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/modbus-rtu.o ${OBJECTDIR}/MOTOR_1947_V2.00.o

# Source Files
SOURCEFILES=modbus-rtu.s MOTOR_1947_V2.00.s



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/MOTOR_PIC1947_V2.00.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=PIC16F1947
FINAL_IMAGE_NAME_MINUS_EXTENSION=${DISTDIR}/MOTOR_PIC1947_V2.00.${IMAGE_TYPE}
# ------------------------------------------------------------------------------------
# Rules for buildStep: pic-as-assembler
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/modbus-rtu.o: modbus-rtu.s  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/modbus-rtu.o 
	${MP_AS} -mcpu=PIC16F1947 -c \
	-o ${OBJECTDIR}/modbus-rtu.o \
	modbus-rtu.s \
	 -D__DEBUG=1  -msummary=+mem,-psect,-class,-hex,-file,-sha1,-sha256,-xml,-xmlfull -fmax-errors=20 -mwarn=0 -xassembler-with-cpp -Wa,-a -Wl,-pmain=0h,-ptool=0D00h
	
${OBJECTDIR}/MOTOR_1947_V2.00.o: MOTOR_1947_V2.00.s  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MOTOR_1947_V2.00.o 
	${MP_AS} -mcpu=PIC16F1947 -c \
	-o ${OBJECTDIR}/MOTOR_1947_V2.00.o \
	MOTOR_1947_V2.00.s \
	 -D__DEBUG=1  -msummary=+mem,-psect,-class,-hex,-file,-sha1,-sha256,-xml,-xmlfull -fmax-errors=20 -mwarn=0 -xassembler-with-cpp -Wa,-a -Wl,-pmain=0h,-ptool=0D00h
	
else
${OBJECTDIR}/modbus-rtu.o: modbus-rtu.s  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/modbus-rtu.o 
	${MP_AS} -mcpu=PIC16F1947 -c \
	-o ${OBJECTDIR}/modbus-rtu.o \
	modbus-rtu.s \
	 -msummary=+mem,-psect,-class,-hex,-file,-sha1,-sha256,-xml,-xmlfull -fmax-errors=20 -mwarn=0 -xassembler-with-cpp -Wa,-a -Wl,-pmain=0h,-ptool=0D00h
	
${OBJECTDIR}/MOTOR_1947_V2.00.o: MOTOR_1947_V2.00.s  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MOTOR_1947_V2.00.o 
	${MP_AS} -mcpu=PIC16F1947 -c \
	-o ${OBJECTDIR}/MOTOR_1947_V2.00.o \
	MOTOR_1947_V2.00.s \
	 -msummary=+mem,-psect,-class,-hex,-file,-sha1,-sha256,-xml,-xmlfull -fmax-errors=20 -mwarn=0 -xassembler-with-cpp -Wa,-a -Wl,-pmain=0h,-ptool=0D00h
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: pic-as-linker
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/MOTOR_PIC1947_V2.00.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_LD} -mcpu=PIC16F1947 ${OBJECTFILES_QUOTED_IF_SPACED} \
	-o ${DISTDIR}/MOTOR_PIC1947_V2.00.${IMAGE_TYPE}.${OUTPUT_SUFFIX} \
	 -D__DEBUG=1  -msummary=+mem,-psect,-class,-hex,-file,-sha1,-sha256,-xml,-xmlfull -mcallgraph=std -Wl,-Map=${FINAL_IMAGE_NAME_MINUS_EXTENSION}.map -mno-download-hex -Wa,-a -Wl,-pmain=0h,-ptool=0D00h
else
${DISTDIR}/MOTOR_PIC1947_V2.00.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_LD} -mcpu=PIC16F1947 ${OBJECTFILES_QUOTED_IF_SPACED} \
	-o ${DISTDIR}/MOTOR_PIC1947_V2.00.${IMAGE_TYPE}.${OUTPUT_SUFFIX} \
	 -msummary=+mem,-psect,-class,-hex,-file,-sha1,-sha256,-xml,-xmlfull -mcallgraph=std -Wl,-Map=${FINAL_IMAGE_NAME_MINUS_EXTENSION}.map -mno-download-hex -Wa,-a -Wl,-pmain=0h,-ptool=0D00h
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
