echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%% ttH ANALYSIS: COMPARISON BETWEEN TOP, STOP AND TTH LEPTON IDS %%%%%%%%%%%%%%%%%%%%%%%%%%"
echo ""
if [ "$1" == "an" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Creating jobs..."
  MVAet=$(qsub -q proof -l nodes=1:ppn=$2 -F "an $2 ttH_LMVAet" DottHAnalysis.sh)
  echo $MVAet

  MVAvt=$(qsub -q proof -l nodes=1:ppn=$2 -W depend=afterany:$MVAet -o /nfs/fanae/user/vrbouza/Documents/TFG/Executions/LEPMVACOMPARISONlogs -e /nfs/fanae/user/vrbouza/Documents/TFG/Executions/LEPMVACOMPARISONlogs DottHAnalysis.sh -F "an $2 ttH_LMVAvt")
  echo $MVAvt

  MVAt=$(qsub -q proof -l nodes=1:ppn=$2 -W depend=afterany:$MVAvt -o /nfs/fanae/user/vrbouza/Documents/TFG/Executions/LEPMVACOMPARISONlogs -e /nfs/fanae/user/vrbouza/Documents/TFG/Executions/LEPMVACOMPARISONlogs DottHAnalysis.sh -F "an $2 ttH_LMVAt")
  echo $MVAt

  MVAm=$(qsub -q proof -l nodes=1:ppn=$2 -W depend=afterany:$MVAt -o /nfs/fanae/user/vrbouza/Documents/TFG/Executions/LEPMVACOMPARISONlogs -e /nfs/fanae/user/vrbouza/Documents/TFG/Executions/LEPMVACOMPARISONlogs DottHAnalysis.sh -F "an $2 ttH_LMVAm")
  echo $MVAm

  MVAtth=$(qsub -q proof -l nodes=1:ppn=$2 -W depend=afterany:$MVAm -o /nfs/fanae/user/vrbouza/Documents/TFG/Executions/LEPMVACOMPARISONlogs -e /nfs/fanae/user/vrbouza/Documents/TFG/Executions/LEPMVACOMPARISONlogs DottHAnalysis.sh -F "an $2 ttH_LMVAtth")
  echo $MVAtth
  echo "%%%%%> DONE"
  echo ""
elif [ "$1" == "pl" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ttH PLOTTER EXECUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting to plot"
  source QueueDottHAnalysis.sh pl et
  source QueueDottHAnalysis.sh pl vt
  source QueueDottHAnalysis.sh pl t
  source QueueDottHAnalysis.sh pl m
  source QueueDottHAnalysis.sh pl tth

else
    echo "ERROR - No valid arguments given"
    echo "Please, execute this script with a valid argument"
fi
