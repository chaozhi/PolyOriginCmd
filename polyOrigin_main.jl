function tryusing(pkgname::AbstractString;
        pkgurl::Union{Nothing,AbstractString}=nothing)
    try
        @eval using $(Symbol(pkgname))
    catch
        @eval using Pkg
        if pkgurl==nothing
            Pkg.add(pkgname)
        else
            Pkg.add(PackageSpec(url=pkgurl, rev="master"))
        end
        @eval using $(Symbol(pkgname))
    end
end

@time tryusing("PolyOrigin",pkgurl="https://github.com/chaozhi/PolyOrigin.jl")
tryusing("ArgParse")

function parse_commandline()
    s = ArgParseSettings()
    s.description = "Haplotype reconstruction in polypoid multiparental populations"
    workdir = pwd()
    @add_arg_table! s begin
        "--genofile", "-g"
            help = "filename for genotypic data file"
            arg_type = AbstractString
            required = true
        "--pedfile", "-p"
            help = "filename for pedigree info"
            arg_type = AbstractString
            required = true
        "--delimchar"
            help = "text delimiter"
            arg_type = AbstractChar
            default = ','
        "--missingstring"
            help = "string code for missing value"
            arg_type = AbstractString
            default = "NA"
        "--commentstring"
            help = "rows that begins with commentstring will be ignored"
            arg_type = AbstractString
            default = "#"
        "--isphysmap"
            help = "if true, input markermap is physical map with marker location in base pair(bp)"
            arg_type = Bool
            default = false
        "--recomrate"
            help = "recombination rate in unit of cM/Mbp (centiMorgan per million base pair)"
            arg_type = Real
            default = 1.0
        "--outstem", "-o"
            help = "stem of output filenames"
            arg_type = AbstractString
            default = "outstem"
        "--workdir", "-w"
            help = "directory for reading and writing files"
            arg_type = AbstractString
            default = workdir
        "--verbose", "-v"
            help = "if true, print messages on console"
            arg_type = Bool
            default = true
    end
    return parse_args(s, as_symbols=true)
end

function main(args::Vector{String})
    parsed_args = parse_commandline()
    verbose = parsed_args[:verbose]
    if verbose
        println("Parsed arguments:")
        for (arg,val) in parsed_args
            if val==nothing
                println("  $arg  =>  nothing ")
            else
                println("  $arg  =>  $val")
            end
        end
    end
    outstem = parsed_args[:outstem]
    logfile=string(outstem,".log")
    genofile = parsed_args[:genofile]
    pedfile = parsed_args[:pedfile]
    delete!(parsed_args,:genofile)
    delete!(parsed_args,:pedfile)
    push!(parsed_args,:logfile=>logfile)
    @time polyOrigin(genofile, pedfile; parsed_args...)
    workdir = parsed_args[:workdir]
    outfiles = filter(x->occursin(outstem,x), readdir(workdir))
    verbose && println("output files: ", join(outfiles,","))
    return 0
end

main(ARGS)
