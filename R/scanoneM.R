scanoneM <- function(cross, Y, tol=1e-7, n.perm=0, method=c("hk","f"), pheno.cols ) {

    if (missing(pheno.cols)) {
        pheno.cols = 1:nphe(cross)
    }

    method <- match.arg(method)
    n.ind <- nind(cross) # n
    n.phe <- nphe(cross)
    n.chr <- nchr(cross)
    n.mar <- nmar(cross)

    if(missing(Y)) {
        p <- nphe(cross)
        Y <- as.matrix(cross$pheno)
    } else {
        if(is.vector(Y)) { p = 1} else {p = ncol(Y)}
    }

    if(n.perm == 0) {


        E <- matrix(NA, n.ind, p)
        X <- cbind(rep(1,n.ind))
        E <- .Call(stats:::C_Cdqrls, X, Y, tol)$residuals
        Sigma <- crossprod(E)

        if( method == "hk") {
            L0 <- determinant(Sigma)$modulus
        } else {
            L0 <- sum(diag(Sigma))
        }

        out <- NULL;
        for(i in 1:n.chr) {
            LOD = NULL;
            for(j in 1:n.mar[i]) {
                X <- cbind(rep(1,n.ind), cross$geno[[i]]$prob[,j,1])
                E <- .Call(stats:::C_Cdqrls, X, Y, tol)$residuals
                Sigma <- crossprod(E)

                if( method == "hk") {
                    L1 <- determinant(Sigma)$modulus
                } else {
                    L1 <- sum(diag(Sigma))
                }

#                LOD <- c(LOD, n.ind/2*log(L0/L1,10 ) )
                LOD <- c(LOD, n.ind/2*log10(exp(1))*(L0 - L1) )
            }
            out <- rbind(out, cbind(rep(i,n.mar[i]), cross$geno[[i]]$map, LOD) )
        }

        outt <- data.frame( chr = out[,1], pos = out[,2], lod = out[,3])

        class(outt) <- c("scanone", "data.frame")
        return(outt)
    } else {

        lods = NULL;
        for( rep in 1:n.perm) {
            o <- sample(n.ind)
            if(is.vector(Y)) { nY <- Y[o] } else { nY <- Y[o,] }


            E <- matrix(NA, n.ind, p)
            X <- cbind(rep(1,n.ind))
            E <- .Call(stats:::C_Cdqrls, X, nY, tol)$residuals
            Sigma <- crossprod(E)

            if( method == "hk") {
                L0 <- determinant(Sigma)$modulus
            } else {
                L0 <- sum(diag(Sigma))
            }

            out <- NULL;
            for(i in 1:n.chr) {
                LOD = NULL;
                for(j in 1:n.mar[i]) {
                    X <- cbind(rep(1,n.ind), cross$geno[[i]]$prob[,j,1])
                    E <- .Call(stats:::C_Cdqrls, X, nY, tol)$residuals
                    Sigma <- crossprod(E)

                    if( method == "hk") {
                        L1 <- determinant(Sigma)$modulus
                    } else {
                        L1 <- sum(diag(Sigma))
                    }
#                    LOD <- c(LOD, n.ind/2*log(L0/L1,10) )
                    LOD <- c(LOD, n.ind/2*log10(exp(1))*(L0 - L1) )

                }
                out <- rbind(out, cbind(rep(i,n.mar[i]), cross$geno[[i]]$map, LOD) )
            }

            lods <- c(lods, max(out[,3]) )
        }
        return(lods)
    }
}

