# PolyOriginCmd

PolyOriginCmd is a package for using PolyOrigin.jl  (https://github.com/chaozhi/PolyOrigin.jl) in a command line

## Get started

1) Download and install Julia at https://julialang.org/
2) Download PolyOriginCmd, and setup work directory including "polyOrigin_main.jl" and data files.
2) In the command shell, change into your work directory
3) Run command line:

```
pathtojulia\\julia.exe polyOrigin_main.jl -g geno.csv -p ped.csv
```

## Help
```
pathtojulia\\julia.exe polyOrigin_main.jl --help
```
```
usage: polyOrigin_main.jl -g GENOFILE -p PEDFILE
                        [--delimchar DELIMCHAR]
                        [--missingstring MISSINGSTRING]
                        [--commentstring COMMENTSTRING]
                        [--isphysmap ISPHYSMAP]
                        [--recomrate RECOMRATE] [--epsilon EPSILON]
                        [--seqerr SEQERR]
                        [--chrpairing_phase CHRPAIRING_PHASE]
                        [--chrpairing CHRPAIRING]
                        [--chrsubset CHRSUBSET]
                        [--isparallel ISPARALLEL]
                        [--delsiglevel DELSIGLEVEL]
                        [--maxstuck MAXSTUCK] [--maxiter MAXITER]
                        [--minrun MINRUN] [--maxrun MAXRUN]
                        [--byparent BYPARENT]
                        [--refhapfile REFHAPFILE]
                        [--correctthreshold CORRECTTHRESHOLD]
                        [--refinemap REFINEMAP]
                        [--refineorder REFINEORDER]
                        [--maxwinsize MAXWINSIZE]
                        [--inittemperature INITTEMPERATURE]
                        [--coolingrate COOLINGRATE]
                        [--stripdis STRIPDIS]
                        [--maxepsilon MAXEPSILON]
                        [--skeletonsize SKELETONSIZE] [-o OUTSTEM]
                        [-w WORKDIR] [-v VERBOSE] [-h]

Haplotype reconstruction in polypoid multiparental populations

optional arguments:
  -g, --genofile GENOFILE
                        filename for genotypic data file
  -p, --pedfile PEDFILE
                        filename for pedigree info
  --delimchar DELIMCHAR
                        text delimiter (type: AbstractChar, default:
                        ',')
  --missingstring MISSINGSTRING
                        string code for missing value (default: "NA")
  --commentstring COMMENTSTRING
                        rows that begins with commentstring will be
                        ignored (default: "#")
  --isphysmap ISPHYSMAP
                        if true, input markermap is physical map
                        (location in bp) (type: Bool, default: false)
  --recomrate RECOMRATE
                        recombination rate in unit of cM/Mbp (type:
                        Float64, default: 1.0)
  --epsilon EPSILON     genotypic error probability in offspring
                        (type: Float64, default: 0.01)
  --seqerr SEQERR       sequencing read error probability for GBS data
                        (type: Float64, default: 0.001)
  --chrpairing_phase CHRPAIRING_PHASE
                        chromosome pairing in parental phasing, with
                        22 being only            bivalent formations
                        and 44 being bi- and quadri-valent formations
                        (type: Int64, default: 22)
  --chrpairing CHRPAIRING
                        chromosome pairing in offspring decoding, with
                        22 being only            bivalent formations
                        and 44 being bivalent and quadrivalent
                        formations (type: Int64, default: 44)
  --chrsubset CHRSUBSET
                        subset of chromosomes, with nothing denoting
                        all chromosomes,            e.g, "[2,10]"
                        denotes the second and tenth chromosomes
                        (default: "nothing")
  --isparallel ISPARALLEL
                        if true, multicore computing over chromosomes
                        (type: Bool, default: false)
  --delsiglevel DELSIGLEVEL
                        if true, delete markers during parental
                        phasing (type: Float64, default: 0.05)
  --maxstuck MAXSTUCK   the max number of consecutive iterations that
                        are rejected            in a phasing run
                        (type: Int64, default: 5)
  --maxiter MAXITER     the max number of iterations in a phasing run
                        (type: Int64, default: 30)
  --minrun MINRUN       if the min number of phasing runs that are at
                        the same local maximimum or            have
                        the same parental phases reaches minrun,
                        phasing algorithm will stop before reaching
                        the maxrun. (type: Int64, default: 3)
  --maxrun MAXRUN       the max number of phasing runs (type: Int64,
                        default: 10)
  --byparent BYPARENT   if true, update parental phases
                        parent by parent; if false, update parental
                        phases one subpopulation by subpopulation.
                        (type: Bool, default: true)
  --refhapfile REFHAPFILE
                        reference haplotype file            for
                        setting absolute parental phases. It has the
                        same format as the input genofile,
                        except that parental genotypes are phased and
                        offspring genotypes are ignored if they exist.
                        (default: "nothing")
  --correctthreshold CORRECTTHRESHOLD
                        a candidate marker is selected for
                        parental error correction if the fraction of
                        offspring genotypic error >= correctthreshold.
                        (type: Float64, default: 0.15)
  --refinemap REFINEMAP
                        if true, refine marker map (type: Bool,
                        default: false)
  --refineorder REFINEORDER
                        if true, refine marker mordering, valid only
                        if refinemap=true (type: Bool, default: false)
  --maxwinsize MAXWINSIZE
                        max size of sliding windown in map refinning
                        (type: Int64, default: 50)
  --inittemperature INITTEMPERATURE
                        initial temperature of simulated annealing in
                        map refinning (type: Float64, default: 4.0)
  --coolingrate COOLINGRATE
                        cooling rate of annealing temperature in map
                        refinning (type: Float64, default: 0.5)
  --stripdis STRIPDIS   a chromosome end in map refinement is removed
                        if it has a distance gap > stripdis
                        (centiMorgan) and it contains less than 5%
                        markers. (type: Float64, default: 20.0)
  --maxepsilon MAXEPSILON
                        markers in map refinement are removed it they
                        have error            rates > maxepsilon.
                        (type: Float64, default: 0.5)
  --skeletonsize SKELETONSIZE
                        the number of markers in the skeleton map that
                        is used            to reduce map length
                        inflation by subsampling markers (type: Int64,
                        default: 50)
  -o, --outstem OUTSTEM
                        stem of output filenames (default: "outstem")
  -w, --workdir WORKDIR
                        directory for reading and writing files
                        (default: pwd())
  -v, --verbose VERBOSE
                        if true, print messages on console (type:
                        Bool, default: true)
  -h, --help            show this help message and exit
```  

## Citing PolyOrigin

 If you use PolyOrigin in your analyses and publish your results, please cite the article:

  *Zheng C, Amadeu R, Munoz P, and Endelman J. 2020. Haplotype reconstruction in tetraploid multi-parental populations. In preparation.*
