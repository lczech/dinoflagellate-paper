## Overview ##

This is the supplemental code repository for the phylogenetic analyses of our manuscript

> "The Windblown: Possible Explanations for Dinophyte DNA in Forest Soils."</br>
> Marc Gottschling, Lucas Czech, Frédéric Mahé, Sina Adl, Micah Dunthorn.</br>
> Journal of Eukaryotic Microbiology, 2020, https://doi.org/10.1111/jeu.12833

The subdirectories contain the analysis steps in order, and are explained in the following.

## 0. Input Data ##

Our goal is to phylogenetically place environmental sequences on a suitable reference tree:

 * `00_data/reference_alignment_dinoflagellates.phylip`, `00_data/reference_tree_dinoflagellates.tre`:
   The reference alignment and tree on which we phylogenetically placed our environmental sequences.
 * `00_data/OTU_representatives_dinoflagellates.fas`: The environmental sequences to be placed,
   clustered into OTUs via [swarm](https://github.com/torognes/swarm).

There also is a rerooted variant of the tree for visualization purposes, as well as a version
of the environmental sequence OTUs where the sequences were converted to upper case,
as this was needed for some downstream tools.

## 1. Alignment ##

The first step is to align the environmental sequence OTUs (called the "query" sequences) to the
given reference alignment. To this end, we used [papara](https://github.com/lczech/papara_nt),
using the commands as shown in `01_align/align.sh`.

The resulting alignment is `01_align/papara_alignment.raxml`, which contains both the reference
and the query sequences. Other output files of papara are kept for reference as well.

## 2. Phylogenetic Placement ##

Phylogenetic placement of the query sequences was conducted with the EPA command of
[RAxML](https://github.com/stamatak/standard-RAxML), as shown in `02_epa/epa.sh`.
We used a high `accumulated-threshold=0.99`, to include most placement locations.

The main result is `02_epa/RAxML_portableTree.epa_raxml.jplace`, which contains the placement locations
of all environmental sequence OTUs on the reference tree, while again all other output
of RAxML was also kept for reference.

## 3. Visualization of Clades ##

In the next step, we were interested in finding and extracting all environmental sequence OTUs
that were placed in either the Dinoflagellates or our outgroup. The file `03_vis_all/clades.txt`
contains our categorization into these two groups.

To ensure that the clades were properly found by the algorithm, they were visualized using
`03_vis_clades/vis.sh`, with the resulting files `03_vis_clades/dinos.svg` and `03_vis_clades/outgroup.svg`,
respectively.

## 4. Dinoflagellate Extraction ##

We then used [gappa](https://github.com/lczech/gappa) for the extraction of the OTUs that were placed
in these clades, using `04_extract_clades/extract.sh`. This results in three new jplace files,
`04_extract_clades/dinos.jplace`, `04_extract_clades/outgroup.jplace`, and `04_extract_clades/uncertain.jplace`,
where the latter collects all OTUs that did not cross a threshold of certainty for being placed
in either our ingroup or our outgroup.

These files were then visualized using `04_extract_clades/vis.sh`, one time using all placement locations,
and one time only using the most probable location (files suffixed `_max` in `04_extract_clades`).
See for example `04_extract_clades/dinos_max.png` for the resulting tree colorized by the amount
of placed sequences on each branch.

Furthermore, using `04_extract_clades/hists.sh`, we built histograms of the placement probabilities
(the "likelihood weight ratios" of the placement algorithm), as shown in `04_extract_clades/hist_lwr.png`,
as well as a histogram of the expected distance between placement locations
([EDPL](http://matsen.github.io/pplacer/generated_rst/guppy_edpl.html#guppy-edpl)),
as shown in `04_extract_clades/hist_edpl.png`.

## 5. Dinoflagellate Extraction, pt 2 ##

We later repeated the above setup, changing some details concerning the treatment of placements on
the branch in between the Dinoflagellates and the outgroup. Four sequences were affected by this change.
Hence, we stored the updated results in `05_extract/dinos.jplace`.

Furthermore, we also tested how taking the multiplicities of each OTUs changes the results.
That is, each environmental sequence OTU resulting from a clustering with swarm contains information
about how many original reads were used to form the respective OTU (their abundance).
In `05_extract/multiplicities.sh`, we use this information to edit our placements of the
Dinoflagellates accordingly, resulting in a new placement file `05_extract/multips_dinos.jplace`.

## 6. Visualization of Dinoflagellates ##

All resulting extracted groups of placed OTUs were then visualized with `06_vis_dinos/vis_all.sh`
as heat trees, were branches of the reference tree are colorized according to how many placements
(i.e., how much placement mass of all sequences combined) is present on each branch. This allows
to easily spot regions and branches of the tree on which many environmental sequences were placed.

We conducted this in several variants:

 1. With or without multiplicities/abundances.
    With abundances, the focus is to show the distribution of the total amount of sequence reads
    placement on the tree.
    Without abundances, the focus is to see how many different OTUs were placed
    on the branches of the tree. The resulting files are distinguished by either containing `abun`
    or `no_abun` in their filename, e.g., `06_vis_dinos/dinos_abun.svg`.
 2. With all placement locations taken into account, or with just the most probable location considered.
    Keeping all placement locations of a placed sequence (query) reveals the uncertainty in the placement
    (locations are weighted by their likelihood weight ratio). On the other hand, we also wanted
    to see how ignoring this and just visualizing the most probable placement changes the result
    (not much), which are the files containing `max`, e.g, `06_vis_dinos/dinos_abun_max.svg`.

For the Dinoflagellates, we created visualizations of all four combinations of these variants.
For the outgroup and the sequences that were neither placed in the Dinoflagellates nor the outgroup
with enough certainty (that is, these sequences had placement locations in both parts of the tree),
we only visualized the variant without multiplicities/abundances, but with keeping all placement
locations.

## 7. Manual Visualization Refinement ##

Lastly, we manually refined the visualization of the Dinoflagellates with abundances,
in order to contain clade annotations, as seen in `07_vis_manual`.

## Software ##

We used a few of our own tools for the analyses presented in this repository:

 * https://github.com/lczech/papara_nt
 * https://github.com/stamatak/standard-RAxML
 * https://github.com/lczech/gappa - we used a version before gappa had official releases. However,
   the commands that we used here should run with [gappa v0.1.0](https://github.com/lczech/gappa/releases/tag/v0.1.0).

Furthermore, for the histograms shown in `04_extract_clades`, we used the genesis demo program
[`placement_histograms`](https://github.com/lczech/genesis/blob/54059b418d15afd9fa9b7fe6eeec5f6771ea5297/doc/demos/placement_histograms.cpp), which should compile with [genesis v0.20.0](https://github.com/lczech/genesis/releases/tag/v0.20.0).
