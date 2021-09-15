#!/bin/bash
. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions

#cp -f constant/turbulenceProperties.air.laminar constant/turbulenceProperties.air
cp -f constant/turbulenceProperties.air.LES constant/turbulenceProperties.air       

restore0Dir

rm -r log.decomposePar
runApplication decomposePar -force

cp -f system/fvSchemes.mppic system/fvSchemes
cp -f system/fvSolution.mppic system/fvSolution
cp -f constant/kinematicCloudProperties.mppic constant/kinematicCloudProperties
rm -r log.MPPICFoam
runParallel MPPICFoam

#cp -f system/fvSchemes.dpm system/fvSchemes
#cp -f system/fvSolution.dpm system/fvSolution
#cp -f constant/kinematicCloudProperties.dpm constant/kinematicCloudProperties
#rm -r log.DPMFoam
#runParallel DPMFoam
