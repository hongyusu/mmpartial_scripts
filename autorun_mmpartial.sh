
node=('ukko017.hpc' 'ukko012.hpc' 'ukko018.hpc' 'ukko014.hpc' 'ukko015.hpc')
missingpers=('0' '0.05' '0.15' '0.25' '0.5')

for i in 0 1 2 3 4 
do
    for inname in 'emotions' 'yeast' 'scene' 'enron' 'cal500' 'fp' 'cancer' 'medical' 'toy10' 'toy50'
    do
        ssh ${node[$i]} "cd /home/group/urenzyme/workspace/sop/predict_with_missing/mmpartial_scripts/; nohup matlab -nodesktop -nosplash -r \"run_MMCRFpartial_exp1 '$inname' '${missingpers[$i]}' \" " &
        # ssh ${node[$i]} "pkill -u su" 
    done
done
wait
rm nohup.out
