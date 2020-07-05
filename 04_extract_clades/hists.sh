#!/bin/bash

BASEDIR=dinoflagellates
NUM_TASKS=4

echo "Start at `date`"
echo

# Input files
JPLACE_BASE=${BASEDIR}/04_extract_clades
HISTS=${BASEDIR}/software/genesis/bin/apps/placement_histograms

# Run three times. As the app is pretty simple, we need to rename its output files
# each time before running again for other inputs.

${HISTS} ${JPLACE_BASE}/dinos.jplace     .
mv histogram_edpl.csv histogram_edpl_dinos.csv
mv histogram_lwr.csv  histogram_lwr_dinos.csv

${HISTS} ${JPLACE_BASE}/outgroup.jplace  .
mv histogram_edpl.csv histogram_edpl_outgroup.csv
mv histogram_lwr.csv  histogram_lwr_outgroup.csv

${HISTS} ${JPLACE_BASE}/uncertain.jplace .
mv histogram_edpl.csv histogram_edpl_uncertain.csv
mv histogram_lwr.csv  histogram_lwr_uncertain.csv

echo
echo "End at `date`"
