datacache <- new.env(hash=TRUE, parent=emptyenv())

org.Cneoformans.var.grubii.KN99.eg <- function() showQCData("org.Cneoformans.var.grubii.KN99.eg", datacache)
org.Cneoformans.var.grubii.KN99.eg_dbconn <- function() dbconn(datacache)
org.Cneoformans.var.grubii.KN99.eg_dbfile <- function() dbfile(datacache)
org.Cneoformans.var.grubii.KN99.eg_dbschema <- function(file="", show.indices=FALSE) dbschema(datacache, file=file, show.indices=show.indices)
org.Cneoformans.var.grubii.KN99.eg_dbInfo <- function() dbInfo(datacache)

org.Cneoformans.var.grubii.KN99.egORGANISM <- "Cryptococcus neoformans.var.grubii.KN99"

.onLoad <- function(libname, pkgname)
{
    ## Connect to the SQLite DB
    dbfile <- system.file("extdata", "org.Cneoformans.var.grubii.KN99.eg.sqlite", package=pkgname, lib.loc=libname)
    assign("dbfile", dbfile, envir=datacache)
    dbconn <- dbFileConnect(dbfile)
    assign("dbconn", dbconn, envir=datacache)

    ## Create the OrgDb object
    sPkgname <- sub(".db$","",pkgname)
    db <- loadDb(system.file("extdata", paste(sPkgname,
      ".sqlite",sep=""), package=pkgname, lib.loc=libname),
                   packageName=pkgname)    
    dbNewname <- AnnotationDbi:::dbObjectName(pkgname,"OrgDb")
    ns <- asNamespace(pkgname)
    assign(dbNewname, db, envir=ns)
    namespaceExport(ns, dbNewname)
        
    packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Cneoformans.var.grubii.KN99.eg.db"))
}

.onUnload <- function(libpath)
{
    dbFileDisconnect(org.Cneoformans.var.grubii.KN99.eg_dbconn())
}

