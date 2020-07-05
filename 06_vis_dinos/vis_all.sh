#!/bin/bash

BASEDIR=dinoflagellates
NUM_TASKS=4

echo "Start at `date`"
echo

rm -f *.svg
rm -f *.nexus

# Input files
JPLACE_BASE=${BASEDIR}/05_extract
GAPPA=${BASEDIR}/software/gappa/bin/gappa

# Run Forrest, run!
${GAPPA} analyze visualize-color --jplace-path ${JPLACE_BASE}/dinos.jplace           --write-svg-tree --write-nexus-tree --log-scaling --under-color "#cccccc" --mask-color "#cccccc" --tree-file-prefix dinos_no_abun
${GAPPA} analyze visualize-color --jplace-path ${JPLACE_BASE}/multips_dinos.jplace   --write-svg-tree --write-nexus-tree --log-scaling --under-color "#cccccc" --mask-color "#cccccc" --tree-file-prefix dinos_abun
${GAPPA} analyze visualize-color --jplace-path ${JPLACE_BASE}/outgroup.jplace  --write-svg-tree --write-nexus-tree --log-scaling --under-color "#cccccc" --mask-color "#cccccc" --tree-file-prefix outgroup
${GAPPA} analyze visualize-color --jplace-path ${JPLACE_BASE}/uncertain.jplace       --write-svg-tree --write-nexus-tree --log-scaling --under-color "#cccccc" --mask-color "#cccccc" --tree-file-prefix uncertain


${GAPPA} analyze visualize-color --jplace-path ${JPLACE_BASE}/dinos.jplace           --write-svg-tree --write-nexus-tree --log-scaling --under-color "#cccccc" --mask-color "#cccccc" --tree-file-prefix dinos_no_abun_max --point-mass
${GAPPA} analyze visualize-color --jplace-path ${JPLACE_BASE}/multips_dinos.jplace   --write-svg-tree --write-nexus-tree --log-scaling --under-color "#cccccc" --mask-color "#cccccc" --tree-file-prefix dinos_abun_max    --point-mass
#${GAPPA} analyze visualize-color --jplace-path ${JPLACE_BASE}/outgroup.jplace  --write-svg-tree --write-nexus-tree --log-scaling --under-color "#cccccc" --mask-color "#cccccc" --tree-file-prefix outgroup_max      --point-mass
#${GAPPA} analyze visualize-color --jplace-path ${JPLACE_BASE}/uncertain.jplace       --write-svg-tree --write-nexus-tree --log-scaling --under-color "#cccccc" --mask-color "#cccccc" --tree-file-prefix uncertain_max     --point-mass

echo
echo "End at `date`"
