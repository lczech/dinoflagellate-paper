#!/bin/bash

BASEDIR=dinoflagellates
NUM_TASKS=4

echo "Start at `date`"
echo

ALI=${BASEDIR}/00_data/reference_alignment_dinoflagellates.phylip
TREE=${BASEDIR}/00_data/reference_tree_dinoflagellates_rerooted.tre
QUERY=${BASEDIR}/00_data/OTU_representatives_dinoflagellates.upper

PAPARA=${BASEDIR}/software/papara_nt/papara

# Run Forrest, run!
${PAPARA} -t ${TREE} -s ${ALI} -q ${QUERY} -j ${NUM_TASKS} -r -n raxml

echo
echo "End at `date`"
