BEGIN { FS=OFS="\t" }
{
    if ( NR==1 ) {
        for ( i=1 ; i<=NF ; i++ ) {
            if ($i == column) {
                f = i
                break
            }
        }
    }
    else {
        $(f) = file
    }
    print
}