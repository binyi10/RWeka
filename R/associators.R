make_Weka_associator <-
function(name, class = NULL, init = NULL, package = NULL)
{
    ## Return a function interfacing the Weka association learner class
    ## 'name'.

    ## Add to registry.
    classes <- c(class, "Weka_associator")
    kind <- "R_Weka_associator_interface"
    name <- as_JNI_name(name)
    meta <- make_R_Weka_interface_metadata(name, kind, classes, init,
                                           package)
    Weka_interfaces[[Java_class_base_name(name)]] <- meta
        
    out <- function(x, control = NULL) {
        .structure(RWeka_build_associator(x, control, name, init,
                                          package),
                   class = classes)
    }
    make_R_Weka_interface(out, meta)
}

RWeka_build_associator <-
function(x, control, name, init, package)
{
    if(is.function(init))
        init()
    else if(!is.null(package))
        WPM(".check-installed-and-load", package)
    
    instances <- read_data_into_Weka(x)

    ## Build the associator.
    associator <- Weka_object_for_name(name, package)
    control <- as.character(control)
    if(length(control)) {
        if(.has_method(associator, "setOptions"))
            .jcall(associator, "V", "setOptions", .jarray(control))
        else
            warning("Associator cannot set control options.")
    }
    .jcall(associator, "V", "buildAssociations", instances)

    list(associator = associator, instances = instances)
}

print.Weka_associator <-
function(x, ...)
{
    writeLines(.jcall(x$associator, "S", "toString"))
    invisible(x)
}
