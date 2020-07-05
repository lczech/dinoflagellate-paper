#!/bin/bash

BASEDIR=dinoflagellates
NUM_TASKS=4

echo "Start at `date`"
echo

# Input files
JPLACE=${BASEDIR}/02_epa/RAxML_portableTree.epa_raxml.jplace
CLADES=${BASEDIR}/05_extract/dinos.txt
TREE=${BASEDIR}/05_extract/clades.svg
GAPPA=${BASEDIR}/softwaregappa/bin/gappa

# Run Forrest, run!
${GAPPA} prepare extract --jplace-path ${JPLACE} --clade-list-file ${CLADES} --color-tree-file ${TREE} --samples-out-dir .

mv basal_branches.jplace outgroup.jplace

echo
echo "End at `date`"
