#source /home/fsabado/.bashrc
#source /opt/gurobi652/setup.bash
#source /home/fsabado/Tezzaron3D_project/AstranStable/astran/Astran/setup-astran.sh

# This must be set before running
export LD_LIBRARY_PATH=/mscad/apps/Linux/cadence/MMSIM101/tools/lib:/opt/gurobi652/linux64/lib:/mscad/apps/Linux/cadence/MMSIM101/tools/lib:$LD_LIBRARY_PATH

Astran --shell ./astranRunBatch.run > ./outputs.log 2>&1
