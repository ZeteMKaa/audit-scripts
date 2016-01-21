#!/bin/bash
#
# 
# Audit Script
#

# Het script moet worden gebruikt onder root en met de bash shell.
# Vooraf instellen: chmod +x audit.sh
# Uitvoeren: ./audit.sh

# usage: PROCESS_FILE [filename] "[comments]"

function PROCESS_FILE ()
{
if [[ -f $1 && ! -L $1 ]]
then   echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="5" COLOR="#1C1C1C"><a name=\"$2\"></a>$2c" >> $TMPFILE
  echo "<li><a href=\"#$2\">$2</a>" >> $HTMLFILE
  echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="4" COLOR="#1C1C1C">Inhoud van het bestand: $1</FONT>" >> $TMPFILE
  echo "<pre>" >> $TMPFILE
  echo "Commando: cat $1"
  cat $1 | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/^/<br>/g' >> $TMPFILE
  echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="2" COLOR="#1C1C1C"><i><a href=#home>[Naar inhoudsopgave]</a></i></FONT>" >> $TMPFILE
  echo "</pre><hr>" >> $TMPFILE
fi
}

# usage: PROCESS_LOGFILE [filename] "[comments]"
function PROCESS_LOGFILE ()
{
if [[ -f $1 && ! -L $1 ]]
 then   echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="5" COLOR="#1C1C1C"><a name=\"$2\"></a>$2</FONT>" >> $TMPFILE
  echo "<li><a href=\"#$2\">$2</a>" >> $HTMLFILE
  echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="4" COLOR="#1C1C1C">Inhoud van het bestand: $1</FONT>" >> $TMPFILE
  echo "<pre>" >> $TMPFILE
  echo "<br>" >> $TMPFILE
  echo "Commando: tail -500 $1"
  tail -500 $1 | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/^/<br>/g' >> $TMPFILE
  echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="2" COLOR="#1C1C1C"><i><a href=#home>[Naar inhoudsopgave]</a></i></FONT>" >> $TMPFILE
  echo "</pre><hr>" >> $TMPFILE
fi
}

# usage: PROCESS_WHO [filename] "[comments]"
function PROCESS_WHO ()
{
if [[ -f $1 ]]
 then   echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="5" COLOR="#1C1C1C"><a name=\"$2\"></a>$2</FONT>" >> $TMPFILE
  echo "<li><a href=\"#$2\">$2</a>" >> $HTMLFILE
  echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="4" COLOR="#1C1C1C">Inhoud van het bestand (who commando): $1</FONT>" >> $TMPFILE
  echo "<pre>" >> $TMPFILE
  echo "<br>" >> $TMPFILE
  echo "Commando: who $1"
  who $1 | tail -500 | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/^/<br>/g' >> $TMPFILE
  echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="2" COLOR="#1C1C1C"><i><a href=#home>[Naar inhoudsopgave]</a></i></FONT>" >> $TMPFILE
  echo "</pre><hr>" >> $TMPFILE
fi
}

# usage: PROCESS_DIR [directory]
function PROCESS_DIR ()
{
if [[ -d $1 ]]
then   echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="5" COLOR="#1C1C1C"><a name=$1></a>$1</FONT>" >> $TMPFILE
  echo "<br>" >> $TMPFILE
  echo "<li><a href=#$1>Inhoud van de directory: $1</a>" >> $HTMLFILE
  echo "<pre>" >> $TMPFILE
  echo "<br>" >> $TMPFILE
  echo "Commando: ls -al $1"
  ls -al $1 | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/^/<br>/g' >> $TMPFILE
  echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="2" COLOR="#1C1C1C"><i><a href=#home>[Naar inhoudsopgave]</a></i></FONT>" >> $TMPFILE
  echo "</pre><hr>" >> $TMPFILE
fi
}

# usage: PROCESS_RDIR [directory]
function PROCESS_RDIR ()
{
if [[ -d $1 ]]
then   echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="5" COLOR="#1C1C1C"><a name=$1></a>$1</FONT>" >> $TMPFILE
  echo "<br>" >> $TMPFILE
  echo "<li><a href=#$1>Inhoud van de directory: $1</a>" >> $HTMLFILE
  echo "<pre>" >> $TMPFILE
  echo "<br>" >> $TMPFILE
  echo "Commando: ls -al $1"
  ls -aRl $1 | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/^/<br>/g' >> $TMPFILE
  echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="2" COLOR="#1C1C1C"><i><a href=#home>[Naar inhoudsopgave]</a></i></FONT>" >> $TMPFILE
  echo "</pre><hr>" >> $TMPFILE
fi
}

# usage: PROCESS_COM "[command params]" "[comments]"
function PROCESS_COM ()
{
  echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="5" COLOR="#1C1C1C"><a name=\"$2\"></a>$2</FONT>" >> $TMPFILE
  echo "<li><a href=\"#$2\">$2</a>" >> $HTMLFILE
  echo "<br>" >> $TMPFILE
  echo "Commando: $1"
  echo "<FONT FAMILY="Arial" SIZE="4" COLOR="#1C1C1C">Commando: $1</FONT>" >> $TMPFILE
  echo "<pre>" >> $TMPFILE
  $1 | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/^/<br>/g' >> $TMPFILE
  echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="2" COLOR="#1C1C1C"><i><a href=#home>[Naar inhoudsopgave]</a></i></FONT>" >> $TMPFILE;
  echo "</pre><hr>" >> $TMPFILE
}

function PROCESS_SCOMMENT ()
{
  echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="5" COLOR="#1C1C1C"><a name=$*></a>$*</FONT>" >> $TMPFILE
  echo "<li><a href=#$*>$*</a>" >> $HTMLFILE
}

function PROCESS_SCOM ()
{
  echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="5" COLOR="#1C1C1C">Commando: $*</FONT>" >> $TMPFILE
  echo "<br>" >> $TMPFILE
  echo "Commando: $*"
  echo "<pre>" >> $TMPFILE
  $* | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/^/<br>/g' >> $TMPFILE
  echo "<br>" >> $TMPFILE
  echo "<FONT FAMILY="Arial" SIZE="2" COLOR="#1C1C1C"><i><a href=#home>[Naar inhoudsopgave]</a></i></FONT>" >> $TMPFILE;
  echo "</pre><hr>" >> $TMPFILE;
}

function PROCESS_SECTION1 ()
{
echo "<br><br>" >> $TMPFILE
chmod 700 $TMPFILE
echo "<FONT FAMILY="Arial" SIZE="5" COLOR="#1C1C1C">" >> $TMPFILE
echo $* >> $TMPFILE
echo "</FONT>" >> $TMPFILE
echo "<hr>" >> $TMPFILE;
}

function PROCESS_SECTION2 ()
{
echo "<br>" >> $TMPFILE
echo "<CENTER>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="5" COLOR="#1C1C1C">" >> $HTMLFILE
echo $* >> $HTMLFILE
echo "</CENTER>" >> $HTMLFILE
echo "</FONT>" >> $HTMLFILE;
}

# start of execution
TMPFILE="temp_file.tmp"
HTMLFILE="EY_IT_Audit.html"
NAME=`uname -n`
rm -f $HTMLFILE
rm -f $TMPFILE
echo "<HTML>" >> $HTMLFILE
echo "<HEAD>" >> $HTMLFILE
echo "<style>br {" >> $HTMLFILE
echo "   display: block;" >> $HTMLFILE
echo "   margin: 1px 0;" >> $HTMLFILE
echo "}</style>" >> $HTMLFILE
echo "<TITLE>"$NAME" - EY Audit</TITLE>" >> $HTMLFILE
echo "</HEAD>" >> $HTMLFILE
echo "<BODY BGCOLOR=#FFFFFF LINK=#1C1C1C VLINK=#1C1C1C>" >> $HTMLFILE
clear
echo "Script is gestart."
echo ""
echo "Even geduld."
echo ""
chmod 700 $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#1C1C1C"><a name=home></a>Inhoud</FONT>" >> $HTMLFILE

# General information #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Algemene informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Algemene informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_COM "date" "Current date"
PROCESS_COM "who" "Currently logged on users"
PROCESS_COM "whoami" "Display effective userid"
PROCESS_COM "id" "Information about current userid"
PROCESS_COM "uname -a" "Information about system"
PROCESS_FILE $(ls -l /etc/lsb-release | awk '{print$NF}') "Linux Standard Base"
PROCESS_FILE $(ls -l /etc/system-release | awk '{print$NF}') "Generic Linux Release"
PROCESS_FILE $(ls -l /etc/debian_version | awk '{print$NF}') "Debian Linux Release"
PROCESS_FILE $(ls -l /etc/centos-release | awk '{print$NF}') "CentOs Linux Release"
PROCESS_FILE $(ls -l /etc/redhat-release | awk '{print$NF}') "RedHat Linux Release"
PROCESS_FILE $(ls -l /etc/oracle-release | awk '{print$NF}') "Oracle Linux Release"

PROCESS_SCOMMENT "Shows environment settings"
PROCESS_SCOM set
# End of General information #

# Authentication information #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Authenticatie informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Authenticatie informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_FILE $(ls -l /etc/passwd | awk '{print$NF}') "Password file"
PROCESS_FILE $(ls -l /etc/master.passwd | awk '{print$NF}') "Shadow Password file"
PROCESS_FILE $(ls -l /tcb/files/auth/r/root | awk '{print$NF}') "Password file"
PROCESS_FILE $(ls -l ~ftp/etc/passwd | awk '{print$NF}') "Password file for ftp servers"
PROCESS_FILE $(ls -l /etc/security/passwd | awk '{print$NF}') "Shadow password file"
PROCESS_FILE $(ls -l /etc/security/passwd.adjunct | awk '{print$NF}') "Shadow password file"
PROCESS_FILE $(ls -l /etc/security/opasswd | awk '{print$NF}') "Password history file"
PROCESS_LOGFILE /etc/security/lastlog "Last login date info"
PROCESS_FILE $(ls -l /etc/security/user | awk '{print$NF}') "User security configuration file"
PROCESS_FILE $(ls -l /etc/group | awk '{print$NF}') "User groups"
PROCESS_FILE ~ftp/etc/group "User groups"
PROCESS_FILE $(ls -l /etc/logingroup | awk '{print$NF}') "Secondary group file"
PROCESS_FILE $(ls -l /etc/login.defs | awk '{print$NF}') "Config control definitions for login package"
PROCESS_LOGFILE /var/adm/sialog "Logfile of the su command"
PROCESS_FILE $(ls -l /etc/default/init | awk '{print$NF}') "Environment variables"
PROCESS_FILE $(ls -l /etc/security/environ | awk '{print$NF}') "Exceptions to default environment information"
PROCESS_FILE $(ls -l /etc/krb.conf | awk '{print$NF}') "Kerberos authentication config file"
PROCESS_FILE $(ls -l /etc/kdc.conf | awk '{print$NF}') "Kerberos server config file"
PROCESS_FILE $(ls -l /etc/krb5/krb5.conf | awk '{print$NF}') "Kerberos 5 authentication config file"
PROCESS_FILE $(ls -l /etc/krb5.conf | awk '{print$NF}') "Kerberos 5 authentication config file"
PROCESS_FILE $(ls -l /etc/krb.realms | awk '{print$NF}') "Kerberos translations from hosts to authentication realms"
PROCESS_FILE $(ls -l /spdata/sys1/spmon/hmacls | awk '{print$NF}') "SP:ACLs used by the Hardware Monitor daemon"
PROCESS_FILE $(ls -l /etc/environment | awk '{print$NF}') "Specifies basic environment for all processes"
PROCESS_FILE $(ls -l /etc/security/group | awk '{print$NF}') "Group information"
PROCESS_FILE $(ls -l /etc/security/group.adjunct | awk '{print$NF}') "Shadow group file"
PROCESS_FILE $(ls -l /etc/profile | awk '{print$NF}') "Default user profile"
PROCESS_FILE $(ls -l /etc/bashrc | awk '{print$NF}') "Default user bashrc"
PROCESS_FILE $(ls -l /etc/etc_profile | awk '{print$NF}') "Default user etc_profile"
PROCESS_FILE $(ls -l /etc/defaults/su | awk '{print$NF}') "Default environment for root after su"
PROCESS_FILE $(ls -l /etc/default/security | awk '{print$NF}') "Security defaults config file"
PROCESS_FILE $(ls -l /etc/defaults/login | awk '{print$NF}') "Defaults for login"
PROCESS_FILE $(ls -l /etc/default/login | awk '{print$NF}') "Defaults for login"
PROCESS_FILE $(ls -l /etc/default/passwd | awk '{print$NF}') "Defaults for passwords"
PROCESS_FILE $(ls -l /usr/default/login | awk '{print$NF}') "Defaults for login"
PROCESS_FILE $(ls -l /usr/default/su | awk '{print$NF}') "Default environment after su"
PROCESS_FILE $(ls -l /etc/security/login.conf | awk '{print$NF}') "Login configuration file"
PROCESS_FILE $(ls -l /etc/security/mkuser.default | awk '{print$NF}') "Defaults for generating a new user"
PROCESS_FILE $(ls -l /etc/sshd_config | awk '{print$NF}') "ssh deamon config file"
PROCESS_FILE $(ls -l /usr/lpp/spp/bin/spmkuser.default | awk '{print$NF}') "Defaults for generating a new SP user"
PROCESS_FILE $(ls -l /tcb/files/auth/system/default | awk '{print$NF}') "Password rules"
PROCESS_FILE $(ls -l /etc/security/login.cfg | awk '{print$NF}') "Password rules, terminal controls and allowed shells"
PROCESS_FILE $(ls -l /etc/security/shadow | awk '{print$NF}') "Shadow password file"
PROCESS_FILE $(ls -l /etc/samba/smbpasswd | awk '{print$NF}') "Samba encrypted password file"
PROCESS_FILE $(ls -l /etc/smbpasswd | awk '{print$NF}') "Samba encrypted password file"
PROCESS_FILE $(ls -l /usr/lpp/ssp/config/admin/newpass.log | awk '{print$NF}') "AIX SP user passwords"
PROCESS_FILE $(ls -l /etc/shadow | awk '{print$NF}') "Shadow password file"
PROCESS_FILE $(ls -l /.secure/etc/passwd | awk '{print$NF}') "Password file in trusted mode"
PROCESS_FILE $HOME/.cshrc "Environment file for C shell"
PROCESS_FILE $(ls -l /usr/skell/.cshrc | awk '{print$NF}') "Default file for C shell"
PROCESS_FILE $HOME/.kshrc "Environment file for Korn shell"
PROCESS_FILE $HOME/.login "Environment file for csh shell"
PROCESS_FILE $(ls -l /usr/skell/.login | awk '{print$NF}') "Default file for csh shell"
PROCESS_FILE $HOME/.netrc "Information used for ftp auto-login"
PROCESS_FILE $HOME/.rhosts "Trusted hosts"
PROCESS_FILE $HOME/.profile "Environment file for sh and ksh shells"
PROCESS_FILE $(ls -l /usr/skell/.profile | awk '{print$NF}') "Default file for sh and ksh shells"
PROCESS_FILE $HOME/.plan "Message displayed by the finger command"
PROCESS_FILE $(ls -l /etc/d_passwd | awk '{print$NF}') "File of dialup passwords"
PROCESS_FILE $(ls -l /etc/wvdial.conf | awk '{print$NF}' ) "File of Wvdial"
# PROCESS_SCOMMENT Display contents of .profile files
# PROCESS_SCOM find / \( -name .profile \) ! -fstype nfs -exec ls -la {} \; -exec echo "Contents of:" {} \; -exec cat {} \;
# PROCESS_SCOMMENT Display contents of .rhosts files
# PROCESS_SCOM find / \( -name .rhosts \) ! -fstype nfs -exec ls -la {} \; -exec echo "Contents of:" {} \; -exec cat {} \;
# PROCESS_SCOMMENT Display contents of .shosts files
# PROCESS_SCOM find / \( -name .shosts \) ! -fstype nfs -exec ls -la {} \; -exec echo "Contents of:" {} \; -exec cat {} \;
# PROCESS_SCOMMENT Display contents of .klogin files
# PROCESS_SCOM find / \( -name .klogin \) ! -fstype nfs -exec ls -la {} \; -exec echo "Contents of:" {} \; -exec cat {} \;
# PROCESS_SCOMMENT Display contents of .netrc files
# PROCESS_SCOM find / \( -name .netrc \) ! -fstype nfs -exec ls -la {} \; -exec echo "Content of:" {} \; -exec cat {} \;
# PROCESS_SCOMMENT Display contents of .Xauthority files
# PROCESS_SCOM find / \( -name .Xauthority \) ! -fstype nfs -exec ls -la {} \; -exec echo "Content of:" {} \; -exec cat {} \;
PROCESS_FILE $(ls -l /etc/logindevperm | awk '{print$NF}') "Login device permissions"
PROCESS_FILE $(ls -l /etc/motd | awk '{print$NF}') "Message displayed after login"
PROCESS_FILE $(ls -l /etc/issue | awk '{print$NF}') "Message displayed before login"
PROCESS_FILE $(ls -l /etc/issue.net | awk '{print$NF}') "Message displayed before login telnet"
PROCESS_FILE $(ls -l /etc/herald | awk '{print$NF}') "Herald Banner"
PROCESS_FILE $(ls -l /etc/smb.conf | awk '{print$NF}') "Samba config file"
PROCESS_FILE $(ls -l /etc/login.access | awk '{print$NF}') "Shows who can login from where"
PROCESS_FILE $(ls -l /etc/shells | awk '{print$NF}') "Legal shells for FTP users and for legal shells to the chsh command"
PROCESS_FILE $(ls -l /etc/tftpaccess.ctl | awk '{print$NF}') "List of users with access to tftp"
PROCESS_FILE $(ls -l /etc/dialup | awk '{print$NF}') "List of dialup lines"
PROCESS_FILE $(ls -l /etc/securettys | awk '{print$NF}') "Secure terminal configuration"
PROCESS_FILE $(ls -l /etc/securetty | awk '{print$NF}') "Secure terminal configuration"
PROCESS_FILE $(ls -l /etc/ttys | awk '{print$NF}') "Terminal config file"
PROCESS_WHO /var/adm/wtmp "Logins, logouts etc."
PROCESS_WHO /etc/security/failedlogin "File with contains failed logins"
PROCESS_WHO /var/log/wtmp "Logins, logouts etc."
PROCESS_WHO /var/adm/btmp "Unsucessful logins"
PROCESS_WHO /var/adm/utmp "Users logged on to the system"
PROCESS_WHO /var/run/utmp "Users logged on to the system"
PROCESS_WHO /var/adm/wtmpx "Extended wtmp file"
PROCESS_WHO /var/adm/lastlog "Last logins"
PROCESS_WHO /var/log/lastlog "Last logins"
PROCESS_WHO /var/log/secure "/var/log/secure file" 
PROCESS_WHO /var/log/auth "/var/log/auth file" 
PROCESS_COM "last -100" "Shows last 100 login sessions"
PROCESS_FILE $(ls -l /$HOME/.Xdefaults | awk '{print$NF}') "X-Windows file, containts workstation ACL"
PROCESS_FILE $(ls -l /etc/security/access.conf | awk '{print$NF}') "Loging access control table"
PROCESS_FILE $(ls -l /etc/security/console.perms | awk '{print$NF}') "Console permissions"
PROCESS_FILE $(ls -l /etc/security/group.conf | awk '{print$NF}') "Group permissions for tty and services"
PROCESS_FILE $(ls -l /etc/security/pam_env.conf | awk '{print$NF}') "Configuration file for PAM module #1"
# for A in $(ls -1 /etc/pam.d/); do PROCESS_FILE $(ls -l $A | awk '{print$NF}') "PAM.D files"; done
PROCESS_FILE $(ls -l /etc/pam.conf | awk '{print$NF}') "Configuration file for pluggable authentication modules"
for A in $(ls -1 /etc/pam.d/*); do PROCESS_FILE $(ls -l $A | awk '{print$NF}') "Pam.d $A files"; done
PROCESS_FILE $(ls -l /etc/auth/system/files | awk '{print$NF}') "Protection attributes of system files"
PROCESS_FILE $(ls -l /etc/auth/system/default | awk '{print$NF}') "Default values for database fields"
# End of Authentication information #

# Homedirs information#
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Homedirs informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Homedirs informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_RDIR "/home"
for A in $(ls -1 /home/); do PROCESS_FILE $(ls -l /home/$A/.profile | awk '{print$NF}') "User profile from $A"; done
for A in $(ls -1 /home/); do PROCESS_FILE $(ls -l /home/$A/.rhosts | awk '{print$NF}') "User rhosts config from $A"; done
# End of homedirs information #

# Authorisation information #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Autorisatie informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Autorisatie informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_SCOMMENT Search filesystem for sticky bits
PROCESS_SCOM find / -perm -1000 ! -fstype nfs -exec ls -ld {} \;
PROCESS_SCOMMENT Search filesystem for directory sticky bits 
PROCESS_SCOM df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null 
PROCESS_SCOMMENT Search filesystem for SGID bits
PROCESS_SCOM find / -perm -2000 ! -fstype nfs -exec ls -ld {} \;
PROCESS_SCOMMENT Search filesystem for SUID bits
PROCESS_SCOM find / -perm -4000 ! -fstype nfs -exec ls -ld {} \;
PROCESS_SCOMMENT Search filesystem for world writable files
PROCESS_SCOM find / -perm -2 -a -type f ! -fstype nfs -exec ls -ld {} \;
PROCESS_SCOMMENT Search filesystem for world writable directories
PROCESS_SCOM find / -perm -2 -a -type d ! -fstype nfs -exec ls -ld {} \;
PROCESS_SCOMMENT Search for files without user or group
PROCESS_SCOM find / -nouser -o -nogroup ! -fstype nfs -exec ls -ld {} \;
PROCESS_DIR "/"
PROCESS_DIR "/etc"
PROCESS_DIR "/etc/inet/"
PROCESS_DIR "/etc/security"
PROCESS_DIR "/etc/sec"
PROCESS_DIR "/etc/ssh" 
PROCESS_DIR "/etc/pam.d" 
PROCESS_DIR "/etc/cron.d"
PROCESS_DIR "/etc/selinux"
PROCESS_DIR "/etc/modprobe.d"
PROCESS_DIR "$HOME"
PROCESS_DIR "/home"
PROCESS_DIR "/var/adm/crontab/"
PROCESS_DIR "/tcb"
PROCESS_DIR "/tcb/files"
PROCESS_DIR "/var/tcb/"
PROCESS_DIR "/tcb/files/auth"
PROCESS_DIR "~ftp"
PROCESS_DIR "/var"
PROCESS_DIR "/var/audit"
PROCESS_DIR "/var/log"
PROCESS_DIR "/var/log/apache2"
PROCESS_FILE $(ls -l /etc/aliases | awk '{print$NF}') "File with aliases"
PROCESS_FILE $(ls -l /etc/bootparams | awk '{print$NF}') "Boot parameters database"
PROCESS_FILE $(ls -l /etc/filesystems | awk '{print$NF}') "List of filesystems"
PROCESS_FILE $(ls -l /etc/mnttab | awk '{print$NF}') "Table of devices that can be mounted"
PROCESS_FILE $(ls -l /etc/vfstab | awk '{print$NF}') "Filesystems to mount at boottime"
PROCESS_FILE $(ls -l /etc/fstab | awk '{print$NF}') "Filesystem table"
PROCESS_FILE $(ls -l /etc/xtab | awk '{print$NF}') "Filesystem table"
PROCESS_FILE $(ls -l /etc/dfs/dfstab | awk '{print$NF}') "Filesystem table"
PROCESS_FILE $(ls -l /etc/mtab | awk '{print$NF}') "Filesystem table"
PROCESS_FILE $(ls -l /etc/inittab | awk '{print$NF}') "Config file for init process"
PROCESS_FILE $(ls -l /etc/exports | awk '{print$NF}') "Local file systems and directories available for NFS support"
PROCESS_FILE $(ls -l /usr/sbin/cluster/etc/exports | awk '{print$NF}') "Alternative NFS exports file for AIX"
PROCESS_COM "showmount -e" "Print the list of exported file systems"
PROCESS_FILE $OPENWINHOME/lib/Xinitrc "Openwindows init file"
PROCESS_FILE $(ls -l /etc/fbtab | awk '{print$NF}') "Framebuffer table"
PROCESS_FILE $(ls -l /etc/rc.local | awk '{print$NF}') "Startup configuration"
PROCESS_FILE $(ls -l /etc/rpc | awk '{print$NF}') "Configuration file for RPC"
PROCESS_COM "umask" "Shows current umask of current user"
PROCESS_FILE $(ls -l /etc/security/limits.conf | awk '{print$NF}') "User limitations"
PROCESS_FILE $(ls -l /etc/security/limits | awk '{print$NF}') "User limitations"
PROCESS_FILE $(ls -l /etc/sudoers | awk '{print$NF}') "User in sudoers file"
for A in $(ls -1 /etc/sudoers.d/*); do PROCESS_FILE $(ls -l $A | awk '{print$NF}') "Sudoers.d files"; done
PROCESS_DIR "/boot/grub"
PROCESS_DIR "/boot/grub2"
PROCESS_FILE $(ls -l /boot/grub/grub.cfg | awk '{print$NF}') "Grub configuration"
PROCESS_FILE $(ls -l /boot/grub2/grub.cfg | awk '{print$NF}') "Grub2 configuration"
PROCESS_FILE $(ls -l /etc/sysctl.conf | awk '{print$NF}') "Kernel parameters configuration"
PROCESS_COM "/sbin/sysctl -a" "Kernel parameters all values currently available"


# End of Authorisation information #

# Network and daemon configuration information #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Netwerk en deamon configuratie informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Netwerk en deamon configuratie informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_COM "ip addr" "Network configuration"
PROCESS_COM "ps -ef" "Current processes 1"
PROCESS_COM "ps -faux" "Current processes 2"
PROCESS_COM "lsof -l" "lsof -l"
PROCESS_COM "rpcinfo -p" "Shows which services are registered with the portmapper"
PROCESS_FILE $(ls -l /etc/inet/services | awk '{print$NF}') "Shows available services"
#PROCESS_FILE $(ls -l /etc/services | awk '{print$NF}') "Shows available services"
PROCESS_FILE $(ls -l /etc/mail/sendmail.cf | awk '{print$NF}') "Sendmail configuration file"
PROCESS_FILE $(ls -l /etc/rc.config.d/mailservs | awk '{print$NF}') "Sendmail daemon config file"
PROCESS_FILE $(ls -l /var/adm/sendmail/sendmail.cf | awk '{print$NF}') "Sendmail configuration file"
PROCESS_FILE $(ls -l /etc/routes | awk '{print$NF}') "Static TCP/IP routes"
PROCESS_FILE $(ls -l /etc/named.conf | awk '{print$NF}') "Reverse name resolution information for the named daemon"
PROCESS_FILE $(ls -l /etc/rc.nfs | awk '{print$NF}') "Startup file for NFS"
PROCESS_FILE $(ls -l /etc/nfssec.conf | awk '{print$NF}') "Config file for NFS Security service"
PROCESS_COM "ypcat passwd" "NIS password file"
PROCESS_FILE $(ls -l /etc/resolv.conf | awk '{print$NF}') "DNS configuration file"
PROCESS_FILE $(ls -l /etc/netsvc.conf)"Default name resolution config file"
PROCESS_FILE $(ls -l /etc/nsswitch.conf | awk '{print$NF}') "Nameserver list"
PROCESS_FILE $(ls -l /etc/hosts | awk '{print$NF}') "List of hosts"
PROCESS_FILE $(ls -l /etc/host.conf | awk '{print$NF}') "List of hosts"
PROCESS_FILE $(ls -l /etc/inet/hosts | awk '{print$NF}') "List of hosts"
PROCESS_FILE $(ls -l /etc/hosts.allow | awk '{print$NF}') "Trusted hosts which are allowed"
PROCESS_FILE $(ls -l /etc/hosts.deny | awk '{print$NF}') "Trusted hosts which are not allowed"
PROCESS_FILE $(ls -l /etc/netgroup | awk '{print$NF}') "Config file for netgroups"
PROCESS_FILE $(ls -l /etc/inetd.conf | awk '{print$NF}') "Config file of the inet daemon"
PROCESS_FILE $(ls -l /etc/inet/ipsecinit.conf | awk '{print$NF}') "Optional inetd security file for remote access"
PROCESS_FILE $(ls -l /etc/xinetd.conf | awk '{print$NF}') "Extended config file of the inet daemon"
PROCESS_FILE $(ls -l /etc/inet/inetd.conf | awk '{print$NF}') "Config file of inet daemon"
PROCESS_FILE $(ls -l /etc/ifaccess.conf | awk '{print$NF}') "Interface access filtering config file"
PROCESS_FILE $(ls -l /etc/protocols | awk '{print$NF}') "Defined Internet protocols"
PROCESS_FILE $(ls -l /etc/inet.local | awk '{print$NF}') "Additional network parameters"
PROCESS_FILE $(ls -l /etc/system | awk '{print$NF}') "Kernel config file"
PROCESS_FILE $(ls -l /etc/rc.tcpip | awk '{print$NF}') "Shell script for initializing daemons"
PROCESS_FILE $(ls -l /etc/inetd.conf.local | awk '{print$NF}') "Specific inetd config file for cluster member"
PROCESS_FILE $(ls -l /etc/default/inetinit )"Network tunable parameters"
PROCESS_FILE $(ls -l /etc/sysconfigtab | awk '{print$NF}') "Subsystem configuration database"
PROCESS_FILE $(ls -l /etc/sysconfigtab.cluster | awk '{print$NF}') "Clusterwide subsystem configuration database"
PROCESS_FILE $(ls -l /etc/init.d/inetinit | awk '{print$NF}') "Script for inet deamon"
PROCESS_FILE $(ls -l /etc/inetd.sec | awk '{print$NF}') "Optional inetd security file for remote access"
PROCESS_FILE $(ls -l /etc/inet/ipsec.key | awk '{print$NF}') "IPsec architecture"
PROCESS_FILE $(ls -l /etc/inet/ipsecinit.conf | awk '{print$NF}') "IPsec config file"
PROCESS_FILE $(ls -l /etc/inet/ipsecpolicy.conf | awk '{print$NF}') "IPsec system policy"
PROCESS_FILE $(ls -l /etc/rc.config.d/security.rc.config | awk '{print$NF}') "Personal firewall config file"
PROCESS_FILE $(ls -l /var/adm/inetd.sec | awk '{print$NF}') "Optional inetd security file for remote access"
PROCESS_FILE $(ls -l /etc/rc.config.d/nddconf | awk '{print$NF}') "Network tunable parameters"
PROCESS_FILE $(ls -l /etc/rc.net | awk '{print$NF}') "Network tunable parameters"
PROCESS_LOGFILE /etc/rc.log "RC log file"
PROCESS_FILE $(ls -l /etc/rc.conf | awk '{print$NF}') "RC config file"
PROCESS_FILE $(ls -l /etc/hosts.equiv | awk '{print$NF}') "Remote systems that can execute commands on the local system"
PROCESS_FILE $(ls -l /etc/networks | awk '{print$NF}') "Network name information"
PROCESS_FILE $(ls -l /etc/hosts.lpd | awk '{print$NF}') "Remote hosts that can print on local host"
PROCESS_FILE $(ls -l /etc/rc.config | awk '{print$NF}') "Parameters used for scripts loaded at system startup"
PROCESS_FILE $(ls -l /etc/rc.sp | awk '{print$NF}') "AIX script which is launched after inittab"
PROCESS_FILE $(ls -l /etc/rc.config.common | awk '{print$NF}') "Parameters used for scripts loaded at system startup"
PROCESS_FILE $(ls -l /etc/snmpd.conf | awk '{print$NF}') "SNMP configuration file"
PROCESS_FILE $(ls -l /etc/SnmpAgent.d/snmpd.conf | awk '{print$NF}') "SNMP configuration file"
PROCESS_FILE $(ls -l /etc/snmp/conf/snmpd.conf | awk '{print$NF}') "SNMP configuration file"
PROCESS_FILE $(ls -l /etc/snmp/conf/snmpdx.acl | awk '{print$NF}') "ACL for SNMP"
PROCESS_FILE $(ls -l /var/spool/uucp/Permissions | awk '{print$NF}') "UUCP permissions"
PROCESS_FILE $(ls -l /var/spool/uucp/Sytems | awk '{print$NF}') "UUCP systems"
PROCESS_COM "crontab -l" "List current crontab contents"
PROCESS_FILE $(ls -l /etc/default/cron | awk '{print$NF}') "Defaults for cron"
PROCESS_FILE $(ls -l /var/adm/cron.deny | awk '{print$NF}') "Cron access which is denied"
PROCESS_FILE $(ls -l /var/adm/cron/cron.deny | awk '{print$NF}') "Cron access which is denied"
PROCESS_FILE $(ls -l /usr/lib/cron/cron.deny | awk '{print$NF}') "Cron access which is denied"
PROCESS_FILE $(ls -l /etc/cron.d/cron.deny | awk '{print$NF}') "Cron access which is denied"
PROCESS_FILE $(ls -l /etc/cron.deny | awk '{print$NF}') "Cron access which is denied"
PROCESS_FILE $(ls -l /var/adm/cron.allow | awk '{print$NF}') "Cron access which is allowed"
PROCESS_FILE $(ls -l /var/adm/cron/cron.allow | awk '{print$NF}') "Cron access which is allowed"
PROCESS_FILE $(ls -l /usr/lib/cron/cron.allow | awk '{print$NF}') "Cron access which is allowed"
PROCESS_FILE $(ls -l /etc/cron.d/cron.allow | awk '{print$NF}') "Cron access which is allowed"
PROCESS_FILE $(ls -l /etc/cron.allow )"Cron access which is allowed"
PROCESS_FILE $(ls -l /usr/var/adm/cron/cron.allow | awk '{print$NF}') "Cron access which is allowed"
PROCESS_COM "at -l" "List user's pending jobs"
for A in $(ls -1 /etc/cron.*); do PROCESS_FILE $(ls -l $A | awk '{print$NF}') "Cron $A files"; done
PROCESS_FILE $(ls -l /etc/at.deny | awk '{print$NF}') "AT access which is denied"
PROCESS_FILE $(ls -l /etc/at.allow | awk '{print$NF}') "AT access which is allowed"
PROCESS_FILE $(ls -l /etc/cron.d/at.allow | awk '{print$NF}') "AT access which is allowed"
PROCESS_FILE $(ls -l /usr/var/adm/cron/at.allow | awk '{print$NF}') "AT access which is allowed"
PROCESS_FILE $(ls -l /var/adm/cron/at.deny | awk '{print$NF}') "AT access which is denied"
PROCESS_FILE $(ls -l /usr/lib/cron/at.deny )"AT access which is denied"
PROCESS_FILE $(ls -l /var/adm/cron/at.allow )"AT access which is allowed"
PROCESS_FILE $(ls -l /usr/lib/cron/at.allow )"AT access which is allowed"
PROCESS_COM "finger @localhost" "Shows finger information for local host"
PROCESS_COM "ntpdate" "NTP Status"
PROCESS_FILE $(ls -l /etc/ntp.conf | awk '{print$NF}') "NTP config"
PROCESS_FILE $(ls -l /etc/gettydefs | awk '{print$NF}') "Terminal config file"
PROCESS_FILE $(ls -l /etc/gettytab | awk '{print$NF}') "Terminal config file"
PROCESS_FILE $(ls -l /etc/defaultdomain | awk '{print$NF}') "Default NIS domain"
PROCESS_FILE $(ls -l /etc/defaultrouter | awk '{print$NF}') "Default router to other networks"
PROCESS_FILE $(ls -l /etc/netmasks | awk '{print$NF}') "Config file for subnet addresses"
PROCESS_FILE $(ls -l /etc/rc.config.d/netconf | awk '{print$NF}') "IP configuration"
PROCESS_FILE $(ls -l /etc/ssh/sshd_config | awk '{print$NF}') "SSH configuration"
PROCESS_COM "ifconfig -a" "Status network interfaces"
PROCESS_COM "route -n" "Information about routes"
PROCESS_COM "route" "Information about rout1es"
PROCESS_COM "netstat -pan" "Netstat -pan"
PROCESS_COM "netstat -Aan" "Netstat -Aan"
PROCESS_COM "lsof -i" "lsof -i"


PROCESS_COM "iptables-save" "IPTables"

# End of Network information #

# Services #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Services</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Services"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_FILE $(ls -l /etc/apache2/apache2.conf | awk '{print$NF}') "Apache config"
PROCESS_FILE $(ls -l /etc/apache2/httpd.conf | awk '{print$NF}') "Apache config"
PROCESS_FILE $(ls -l /etc/httpd/conf/httpd.conf | awk '{print$NF}') "Apache config"
PROCESS_COM "apache2ctl -v" "Apache version"
PROCESS_COM "apachectl -v" "Apache version"
PROCESS_FILE $(ls -l /etc/php5/apache2/php.ini | awk '{print$NF}') "PHP config"
PROCESS_FILE $(ls -l /etc/php.ini | awk '{print$NF}') "PHP config"
PROCESS_COM "php -v" "PHP version"
PROCESS_FILE $(ls -l /etc/my.cnf | awk '{print$NF}') "MySQL config"
PROCESS_FILE $(ls -l /etc/mysql/my.cnf | awk '{print$NF}') "MySQL config"
PROCESS_COM "mysql -V" "MySQL version"
PROCESS_FILE $(ls -l /etc/vsftpd.conf | awk '{print$NF}') "VSFTPd config"
PROCESS_FILE $(ls -l etc/vsftpd/vsftpd.conf | awk '{print$NF}') "VSFTPd config"
PROCESS_FILE $(ls -l /etc/ftpusers | awk '{print$NF}') "List of unauthorised ftp users"
PROCESS_FILE $(ls -l /etc/ftpd/ftpusers | awk '{print$NF}') "List of unauthorised ftp users"


# Services # 

# Logging and auditing information #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Logging en auditing informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Logging en auditing informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_LOGFILE $(ls -l /var/adm/sulog)"Logfile of the su command"
PROCESS_LOGFILE $(ls -l /var/log/sulog | awk '{print$NF}') "Logfile of the su command"
PROCESS_FILE $(ls -l /etc/security/audit_class | awk '{print$NF}') "Audit classes"
PROCESS_FILE $(ls -l /etc/security/audit_event | awk '{print$NF}') "Audit events"
PROCESS_FILE $(ls -l /etc/security/audit_user | awk '{print$NF}') "audit user information"
PROCESS_FILE $(ls -l /etc/security/audit/events | awk '{print$NF}') "Audit events file"
PROCESS_FILE $(ls -l /etc/security/audit/objects | awk '{print$NF}') "Description of audited objects"
PROCESS_FILE $(ls -l /etc/security/audit/config | awk '{print$NF}') "Audit config file"
PROCESS_FILE $(ls -l /etc/security/audit/snarestream | awk '{print$NF}') "Snarestream config file"
PROCESS_FILE $(ls -l /etc/sec/audit_events | awk '{print$NF}') "Audit events"
PROCESS_FILE $(ls -l /etc/sec/site_events | awk '{print$NF}') "Specific audit events"
PROCESS_FILE $(ls -l /etc/security/audit_control | awk '{print$NF}') "Audit control file"
PROCESS_FILE $(ls -l /etc/sec/event_aliases | awk '{print$NF}') "Aliases of sets of audit events"
PROCESS_FILE $(ls -l /etc/sec/auditmask_style | awk '{print$NF}') "Audit style flags for profiles"
PROCESS_FILE $(ls -l /etc/sec/rc_audit_events | awk '{print$NF}') "Audit events loaded at system startup"
PROCESS_FILE $(ls -l /etc/sec/fs_objects | awk '{print$NF}') "List of files that are subject to audit selection"
PROCESS_FILE $(ls -l /etc/sec/auditd_loc | awk '{print$NF}') "Alternate location of audit logs"
PROCESS_FILE $(ls -l /etc/sec/auditd_clients | awk '{print$NF}') "List of remote hosts that send their audit data to local system"
PROCESS_FILE $(ls -l /etc/syslog.conf | awk '{print$NF}') "Rules for logging system messages"
PROCESS_FILE $(ls -l /etc/rsyslog.conf | awk '{print$NF}') "Rsyslog config"
for A in $(ls -1 /etc/rsyslog.d/*); do PROCESS_FILE $(ls -l $A | awk '{print$NF}') "Rsyslog.d $A files"; done
PROCESS_FILE $(ls -l /etc/audit/auditd.conf | awk '{print$NF}') "Audit config"
PROCESS_FILE $(ls -l /etc/audit/audit.rules | awk '{print$NF}') "Audit rules"
for A in $(ls -1 /var/log/audit/*); do PROCESS_FILE $(ls -l $A | awk '{print$NF}') "Audit log $A files"; done
PROCESS_LOGFILE $(ls -l /var/adm/messages | awk '{print$NF}') "Record of important messages"
PROCESS_LOGFILE $(ls -l /var/log/messages | awk '{print$NF}') "Record of important messages"
PROCESS_LOGFILE $(ls -l /var/log/syslog | awk '{print$NF}') "Record of system messages"
PROCESS_LOGFILE $(ls -l /var/adm/syslog/syslog.log | awk '{print$NF}') "Record of system messages"
PROCESS_LOGFILE $(ls -l /var/log/secure | awk '{print$NF}') "Record of secure messages"
PROCESS_LOGFILE $(ls -l /var/log/auth | awk '{print$NF}') "Record of auth messages"
PROCESS_LOGFILE $(ls -l /var/log/auth.log | awk '{print$NF}') "Record of auth messages"
PROCESS_LOGFILE $(ls -l /var/log/fail2ban.log | awk '{print$NF}') "Fail2Ban log"
PROCESS_LOGFILE $(ls -l /var/log/mysqld.log | awk '{print$NF}') "MySQL log"
PROCESS_COM "sestatus -v" "SELinux sestatus"
PROCESS_FILE $(ls -l /etc/selinux/semanage.conf | awk '{print$NF}') "SELinux semanage.conf"
PROCESS_FILE $(ls -l /etc/selinux/config | awk '{print$NF}') "SELinux config"

# End of Logging auditing information #

# Oracle Information #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Oracle informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Oracle informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_FILE $(ls -l $ORACLE_HOME/network/admin/listener.ora | awk '{print$NF}')  "Content of listener.ora"
PROCESS_SCOMMENT Display contents of init Oracle files
PROCESS_SCOM nice -n 10 find / \( -name init*.ora \) ! -fstype nfs -exec ls -la {} \; -exec echo "Contents of:" {} \; -exec cat {} \;
PROCESS_SCOMMENT Display contents of orapwd Oracle files
PROCESS_SCOM nice -n 10 find / \( -name orapwd* \) ! -fstype nfs -exec ls -la {} \; -exec echo "Contents of:" {} \; -exec cat {} \;
PROCESS_SCOMMENT Display contents of Protocol file for Oracle
PROCESS_SCOM nice -n 10 find / \( -name protocol.ora \) ! -fstype nfs -exec ls -la {} \; -exec echo "Contents of:" {} \; -exec cat {} \;
PROCESS_SCOMMENT Display contents of Config.ora file for Oracle
PROCESS_SCOM nice -n 10 find / \( -name config.ora \) ! -fstype nfs -exec ls -la {} \; -exec echo "Contents of:" {} \; -exec cat {} \;
PROCESS_SCOMMENT Display contents of Listener file for Oracle
PROCESS_SCOM nice -n 10 find / \( -name listener.ora \) ! -fstype nfs -exec ls -la {} \; -exec echo "Contents of:" {} \; -exec cat {} \;
PROCESS_SCOMMENT Display contents of SQLnet.ora file for Oracle
PROCESS_SCOM nice -n 10 find / \( -name sqlnet.ora \) ! -fstype nfs -exec ls -la {} \; -exec echo "Contents of:" {} \; -exec cat {} \;
PROCESS_SCOMMENT Display contents of .dbf file for Oracle
PROCESS_SCOM nice -n 10 find / \( -name *.dbf \) ! -fstype nfs -exec ls -la {} \; -exec echo "Contents of:" {} \; -exec cat {} \;
PROCESS_SCOMMENT tkprof utility for Oracle
PROCESS_SCOM nice -n 10 find / \( -name tkprof \) ! -fstype nfs -exec ls -la {} \; -exec ls -la {} \;
PROCESS_RDIR "$ORACLE_BASE/oradata/"
# End of Oracle information #

# OS specific commands #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Besturingssysteem specifieke informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Besturingssysteem specifieke informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_COM "rpm -qa" "RHEL list installed packages"
PROCESS_COM "yum check-update --security" "RHEL available security updates"
PROCESS_COM "yum check-update" "RHEL available updates"
PROCESS_DIR "/etc/yum.repos.d/"
PROCESS_FILE $(ls -l /etc/yum.conf | awk '{print$NF}') "RHEL yum configuration"
PROCESS_FILE $(ls -l /etc/yum/vars | awk '{print$NF}') "RHEL yum vars configuration"
PROCESS_FILE $(ls -l /etc/security/pwquality.conf | awk '{print$NF}') "RHEL7 Password quality configuration pam_pwquality.so"
PROCESS_COM "pwscore" "RHEL 7 Password quality check"
PROCESS_COM "rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey" "Verify GPG Key is Installed"
PROCESS_COM "rpm -qVa | awk '$2 != "c" { print $0}'" "RHEL Verify Package Integrity Using RPM"
PROCESS_COM "chkconfig --list" "RHEL Lists all of the services which chkconfig knows about" 
PROCESS_COM "/usr/sbin/showrev -p" "Solaris installed patches"
PROCESS_COM "/usr/sbin/swlist -l patch" "HP-UX installed patches"
PROCESS_COM "/usr/sbin/instfix -i" "AIX installed patches"
PROCESS_COM "/usr/sbin/no -a" "AIX network options"
PROCESS_COM "/usr/bin/oslevel -r" "AIX highest recommended maintenance level"
PROCESS_COM "lslpp -l" "AIX List installed software"
PROCESS_COM "lsfilt -v4" "AIX List filewall rules"
PROCESS_FILE $(ls -l /usr/lib/security/methods.cfg | awk '{print$NF}') "AIX Security methods"
PROCESS_FILE $(ls -l /etc/objrepos | awk '{print$NF}') "AIX Object Data Manager /etc"
PROCESS_FILE $(ls -l /usr/lib/objrepos | awk '{print$NF}') "AIX Object Data Manager /usr"
PROCESS_FILE $(ls -l /usr/share/lib/objrepos | awk '{print$NF}') "AIX Object Data Manager /usr/share"
PROCESS_RDIR "/usr/IBM/HTTPserver/"
for A in $(ls -1 /usr/IBM/HTTPserver/conf/*); do PROCESS_FILE $(ls -l $A | awk '{print$NF}') "IBM HTTPserver configuration: $A"; done



# End of OS specific information #

# Custom OS configuration #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Custom OS configurations</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Custom OS configurations"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_RDIR "/prj"
PROCESS_RDIR "/opt"
# End of Custom OS configuration #

clear
echo ""
echo "Het script heeft succesvol gedraaid!"
echo ""
cat $TMPFILE >> $HTMLFILE
rm -f $TMPFILE
echo "</BODY>" >> $HTMLFILE
echo "</HTML>" >> $HTMLFILE
sed -n p $HTMLFILE > /dev/null
exit 0
