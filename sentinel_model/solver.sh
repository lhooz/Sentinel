#!/bin/bash
. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions

restore0Dir

runApplication decomposePar -force

runParallel MPPICFoam

#pvbatch pvpost_diffuser.py | tee log.pvpost
#cp -r ./diffuser_design/0_diffuser_main/log.simpleFoam ./pv_results
