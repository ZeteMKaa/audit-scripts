#!/bin/bash

# Variables
L_hostname=$(uname -n)                          # Set hostname
L_date=$(date +%Y%m%dT%H%M)                     # Set Date & Time
L_auditor="Advisory"                            # Set auditor name for report
L_profile="default.prf"                         # Set profile to use
# Archive Variables
L_archive="tar"                                 # Set archive tool
L_archiveparm="-cf"                             # Set archive tool parameters
L_afile=$L_date.$L_hostname.tar                 # Define archive name
# Logging Variables
L_screenlog=$L_date.$L_hostname.screen.log      # Define screenlog
L_logginglog=$L_date.$L_hostname.logging.log    # Define logginglog
L_reportlog=$L_date.$L_hostname.report.dat      # Define reportlog
L_eyreport=EY_IT_Audit.html
# Debug
L_debug=0                                       # on = 1 and off = 0

# Make scripts executable
chmod +x lynis
chmod +x unix_audit_1.0.sh
chown 0:0 lynis
chown 0:0 unix_audit_1.0.sh
chown 0:0 default.prf
chown -R 0:0 db
chown -R 0:0 include
chown -R 0:0 plugins


# Select profile (for future use of profiles)
#echo "[?] Select profile:"
#select L_profile in "linux" "default"; do
#    case $L_profile in
#        linux ) break;;
#        default )  break;;
#    esac
#done

# Run lynis with parameters and check debugging for screen output.
echo "[Audit] Audit #1 script running, this may take a while..."
if [ $L_debug -eq 1 ];
then
        ./lynis audit system --cronjob --auditor "$L_auditor" --report-file ./$L_reportlog --logfile ./$L_logginglog  --profile $L_profile
else
        ./lynis audit system --cronjob --auditor "$L_auditor" --report-file ./$L_reportlog --logfile ./$L_logginglog  --profile $L_profile &> ./$L_screenlog
fi
echo "[Audit] Audit #1 script done!"

# Run lynis with parameters and check debugging for screen output.
echo "[Audit] Audit #2 script running, this may take a while..."
./unix_audit_1.0.sh
echo "[Audit] Audit #2 script done!"

# Archiving log files
echo "[EY] Archiving data..."
if [ -e $(which $L_archive) ];
then
        echo $L_archive $L_archiveparm $L_afile $L_reportlog $L_logginglog $L_screenlog $L_eyreport
        echo "[EY] Archiving done!"
        echo "[EY] Audit script done!"
        echo "[EY] Dont forget the archive: $L_afile"
else
        echo "[EY] Archiving failed, $L_archive not found on system..."
        echo "[EY] Audit script done!"
        echo "[EY] Dont forget the files: $L_reportlog, $L_logginglog, $L_screenlog"
fi
