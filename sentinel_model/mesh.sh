#!/bin/bash
. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions

foamCleanTutorials

runApplication blockMesh

runApplication surfaceFeatureExtract

decomposePar

cp -f system/snappyHexMeshDict.csnap system/snappyHexMeshDict
runParallel snappyHexMesh -overwrite

mv log.snappyHexMesh log.snappyHexMesh.csnap
cp -f system/snappyHexMeshDict.addlayers system/snappyHexMeshDict
runParallel snappyHexMesh -overwrite

runApplication reconstructParMesh -constant -latestTime -mergeTol 1e-6

runApplication checkMesh -allGeometry

touch open.foam
