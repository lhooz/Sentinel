#!/bin/bash
. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions

cd constant/triSurface

surfaceTransformPoints -rollPitchYaw '(90 0 0)' sentinel_camera.stl camera.stl

surfaceTransformPoints -translate '(0 0.134791 -0.057002)' camera.stl camera.stl

surfaceTransformPoints -translate '(0 0.002 0)' sensorPad.stl sensor.stl

cd ../..

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

runApplication checkMesh

touch open.foam
