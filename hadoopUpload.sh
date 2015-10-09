#!/bin/sh

scp -rp /Users/samdavies/Documents/Informatics/Year4/EXC/word-counter/word-counter s1220039@student.ssh.inf.ed.ac.uk:/afs/inf.ed.ac.uk/user/s12/s1220039/Documents/EXC/

# remove the existing output directory
ssh -t -t s1220039@student.ssh.inf.ed.ac.uk << EOL
    rm -r /afs/inf.ed.ac.uk/user/s12/s1220039/Documents/EXC/word-counter/output
    exit
EOL

echo ""
echo "JOB COMMAND"
echo "-----------"
echo "hdfs dfs -rm -r /user/\$USER/data/output/; hadoop jar /opt/hadoop/hadoop-2.7.1/share/hadoop/tools/lib/hadoop-streaming-2.7.1.jar \
 -input /user/\$USER/data/input \
 -output /user/\$USER/data/output \
 -mapper mapper.py \
 -file Documents/EXC/word-counter/mapper.py \
 -reducer reducer.py \
 -file Documents/EXC/word-counter/reducer.py \
 -jobconf mapred.job.name=\"Sam's Word counter\" "
echo ""

echo "COPY RESULTS COMMAND"
echo "---------------------"
echo "hdfs dfs -copyToLocal /user/\$USER/data/output /afs/inf.ed.ac.uk/user/s12/s1220039/Documents/EXC/word-counter/"
echo ""

echo "LOCAL COPY RESULTS COMMAND"
echo "---------------------"
echo "scp -rp s1220039@student.ssh.inf.ed.ac.uk:/afs/inf.ed.ac.uk/user/s12/s1220039/Documents/EXC/word-counter/output /Users/samdavies/Documents/Informatics/Year4/EXC/word-counter"
echo ""


