# PolyOriginCmd

PolyOriginCmd is a package for using PolyOrigin.jl  (https://github.com/chaozhi/PolyOrigin.jl) in a command line

## Get started

1) Download and install Julia at https://julialang.org/
2) Download PolyOriginCmd, and setup work directory including "polyOrigin_main.jl" and data files.
2) In the command shell, change into your work directory
3) Run command line:

```
pathtojulia\\julia.exe polyOrigin_main.jl --help
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
                        [--recomrate RECOMRATE] [-o OUTSTEM]
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
                        if true, input markermap is physical map with
                        marker location in base pair(bp) (type: Bool,
                        default: false)
  --recomrate RECOMRATE
                        recombination rate in unit of cM/Mbp
                        (centiMorgan per million base pair) (type:
                        Real, default: 1.0)
  -o, --outstem OUTSTEM
                        stem of output filenames (default: "outstem")
  -w, --workdir WORKDIR
                        directory for reading and writing files
                        (default:
                        "C:\\Chaozhi\\Workspace\\JuliaWorkspace\\Workspace_Polyploid\\PolyOriginCmd")
  -v, --verbose VERBOSE
                        if true, print messages on console (type:
                        Bool, default: true)
  -h, --help            show this help message and exit
```  

## Citing PolyOrigin

 If you use PolyOrigin in your analyses and publish your results, please cite the article:

  *Zheng C, Amadeu R, Munoz P, and Endelman J. 2020. Haplotype reconstruction in tetraploid multi-parental populations. In preparation.*
