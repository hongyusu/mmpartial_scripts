

for inname in 'emotions' 'yeast' 'scene' 'enron' 'cal500' 'fp' 'cancer' 'medical' 'toy10' 'toy50'
do
    for missingper = '0' '0.05' '0.15' '0.25' '0.5'
    do
        nohup matlab -nodesktop -nosplash -r "run_MMCRFpartial_exp1 '$inname' '$missingper'" &
        sleep 0.5
    done
done
wait
rm nohup.out
