#!/bin/bash

BASEDIR=dinoflagellates
NUM_TASKS=4

echo "Start at `date`"
echo

# Input files
JPLACE=${BASEDIR}/02_epa/RAxML_portableTree.epa_raxml.jplace
GAPPA=${BASEDIR}/software/gappa/bin/gappa

# Run Forrest, run!
${GAPPA} analyze visualize-color --jplace-path ${JPLACE} --write-svg-tree --write-nexus-tree --log-scaling

echo
echo "End at `date`"
