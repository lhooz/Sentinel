#!/bin/bash
. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions

foamCleanTutorials

runApplication blockMesh

runApplication surfaceFeatureExtract

decomposePar

runParallel snappyHexMesh -overwrite

runApplication reconstructParMesh -constant -latestTime -mergeTol 1e-6

runApplication checkMesh

touch open.foam
