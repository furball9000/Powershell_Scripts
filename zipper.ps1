#----------------------------------------------------------------------
# Function     :  Zipper. 
# Description  :  Zips the files residing in the temp directory and deletes the temp folder
# Input        :  Files in temp folder
# Output       :  Zip file with a unique name
#----------------------------------------------------------------------
Function Zipper ($zipfilename, $sourcedir){

Try {
   
    #Zip the file at best compression
    Add-Type -Assembly System.IO.Compression.FileSystem
    $compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
    [System.IO.Compression.ZipFile]::CreateFromDirectory($sourcedir ,$zipfilename, $compressionLevel, $false)

    }
Catch {

    #exitCode -errorDescription "SPARS_FAILURE: Issue with Zipper/Archiving function." -exitCode 1
	#Whatever you're catching errors with

    }
}



Zipper -zipfilename "$Archive\$strFileName.zip" -sourcedir "$DestinationTemp"