#!/bin/bash

BASEDIR=dinoflagellates
NUM_TASKS=4

echo "Start at `date`"
echo

# Input files
TREE=${BASEDIR}/00_data/reference_tree_dinoflagellates_rerooted.tre
ALI=${BASEDIR}/01_align/papara_alignment.raxml
RAXML=${BASEDIR}/software/standard-RAxML/raxmlHPC-PTHREADS-AVX

# Run Forrest, run!
${RAXML} -f v --epa-accumulated-threshold=0.99 -t ${TREE} -s ${ALI} -m GTRGAMMAX -n epa_raxml -T ${NUM_TASKS}

echo
echo "End at `date`"
