#!/bin/bash
. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions
#runParallel splitMeshRegions -cellZones -overwrite
#rm -r log.postProcess
#runParallel postProcess -func 'totalPressureIncompressible(p,U)'
#rm -r log.postProcess
#runParallel postProcess -func 'patchMassFlowAverage(name=inlet,total(p))'
rm -r log.simpleFoam
rm -r log.reconstructParMesh
rm -r log.reconstructPar

runApplication reconstructParMesh -constant -latestTime -mergeTol 1e-6
runApplication reconstructPar -latestTime
runApplication simpleFoam -postProcess
#runParallel simpleFoam -postProcess
