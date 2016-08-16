source /home/fsabado/.bashrc
source /opt/gurobi652/setup.bash
source /home/fsabado/Tezzaron3D_project/AstranStable/astran/Astran/setup-astran.sh


Astran --shell ./astranRunBatch.run > ./outputs.log 2>&1
