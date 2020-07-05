#!/bin/bash

BASEDIR=dinoflagellates
NUM_TASKS=4

echo "Start at `date`"
echo

# Input files
JPLACE=${BASEDIR}/02_epa/RAxML_portableTree.epa_raxml.jplace
CLADES=${BASEDIR}/03_vis/outgroup.txt
TREE=${BASEDIR}/03_vis/outgroup.svg
GAPPA=${BASEDIR}/software/gappa/bin/gappa

# Run Forrest, run!
${GAPPA} prepare extract --jplace-path ${JPLACE} --clade-list-file ${CLADES} --color-tree-file ${TREE}

echo
echo "End at `date`"
