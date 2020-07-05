#!/bin/bash

BASEDIR=dinoflagellates
NUM_TASKS=4

echo "Start at `date`"
echo

# Input files
JPLACE=${BASEDIR}/05_extract/dinos.jplace
MULTIPS=${BASEDIR}/00_data/OTU_representatives_dinoflagellates.upper
GAPPA=${BASEDIR}/software/gappa/bin/gappa

# Run Forrest, run!
${GAPPA} edit multiplicity --jplace-path ${JPLACE} --fasta-path	${MULTIPS} --keep-full-label --file-prefix multips_ -v
#${GAPPA} edit multiplicity --jplace-path ${JPLACE} --fasta-path	${MULTIPS} --file-prefix multips_ -v

echo
echo "End at `date`"
