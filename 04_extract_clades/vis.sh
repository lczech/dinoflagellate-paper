#!/bin/bash

BASEDIR=dinoflagellates
NUM_TASKS=4

echo "Start at `date`"
echo

# Input files
JPLACE_BASE=${BASEDIR}/04_extract_clades
GAPPA=${BASEDIR}/software/gappa/bin/gappa

# Run Forrest, run!
${GAPPA} analyze visualize-color --jplace-path ${JPLACE_BASE}/dinos.jplace     --write-svg-tree --write-nexus-tree --log-scaling --tree-file-prefix dinos
${GAPPA} analyze visualize-color --jplace-path ${JPLACE_BASE}/outgroup.jplace  --write-svg-tree --write-nexus-tree --log-scaling --tree-file-prefix outgroup
${GAPPA} analyze visualize-color --jplace-path ${JPLACE_BASE}/uncertain.jplace --write-svg-tree --write-nexus-tree --log-scaling --tree-file-prefix uncertain

${GAPPA} analyze visualize-color --jplace-path ${JPLACE_BASE}/dinos.jplace     --write-svg-tree --write-nexus-tree --log-scaling --tree-file-prefix dinos_max     --point-mass
${GAPPA} analyze visualize-color --jplace-path ${JPLACE_BASE}/outgroup.jplace  --write-svg-tree --write-nexus-tree --log-scaling --tree-file-prefix outgroup_max  --point-mass
${GAPPA} analyze visualize-color --jplace-path ${JPLACE_BASE}/uncertain.jplace --write-svg-tree --write-nexus-tree --log-scaling --tree-file-prefix uncertain_max --point-mass

echo
echo "End at `date`"
