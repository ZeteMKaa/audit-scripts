#!/bin/bash
#
# 
# Audit Scirpt
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
rm -f $HTMLFILE
rm -f $TMPFILE
echo "<HTML>" >> $HTMLFILE
echo "<HEAD>" >> $HTMLFILE
echo "<style>br {" >> $HTMLFILE
echo "   display: block;" >> $HTMLFILE
echo "   margin: 1px 0;" >> $HTMLFILE
echo "}</style>" >> $HTMLFILE
echo "<TITLE>EY - Unix/Linux script</TITLE>" >> $HTMLFILE
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
PROCESS_FILE $(readlink -f /etc/lsb-release) "Linux Standard Base"
PROCESS_FILE $(readlink -f /etc/system-release) "Generic Linux Release"
PROCESS_FILE $(readlink -f /etc/debian_version) "Debian Linux Release"
PROCESS_FILE $(readlink -f /etc/centos-release) "CentOs Linux Release"
PROCESS_FILE $(readlink -f /etc/redhat-release) "RedHat Linux Release"
PROCESS_FILE $(readlink -f /etc/oracle-release) "Oracle Linux Release"

PROCESS_SCOMMENT "Shows environment settings"
PROCESS_SCOM set
# End of General information #

# Authentication information #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Authenticatie informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Authenticatie informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_FILE $(readlink -f /etc/passwd) "Password file"
PROCESS_FILE $(readlink -f /etc/master.passwd) "Shadow Password file"
PROCESS_FILE $(readlink -f /tcb/files/auth/r/root) "Password file"
PROCESS_FILE $(readlink -f ~ftp/etc/passwd) "Password file for ftp servers"
PROCESS_FILE $(readlink -f /etc/security/passwd) "Shadow password file"
PROCESS_FILE $(readlink -f /etc/security/passwd.adjunct) "Shadow password file"
PROCESS_LOGFILE /etc/security/lastlog "Last login date info"
PROCESS_FILE $(readlink -f /etc/security/user) "User security configuration file"
PROCESS_FILE $(readlink -f /etc/group) "User groups"
PROCESS_FILE ~ftp/etc/group "User groups"
PROCESS_FILE $(readlink -f /etc/logingroup) "Secondary group file"
PROCESS_FILE $(readlink -f /etc/login.defs) "Config control definitions for login package"
PROCESS_LOGFILE /var/adm/sialog "Logfile of the su command"
PROCESS_FILE $(readlink -f /etc/default/init) "Environment variables"
PROCESS_FILE $(readlink -f /etc/security/environ) "Exceptions to default environment information"
PROCESS_FILE $(readlink -f /etc/krb.conf) "Kerberos authentication config file"
PROCESS_FILE $(readlink -f /etc/kdc.conf) "Kerberos server config file"
PROCESS_FILE $(readlink -f /etc/krb5/krb5.conf) "Kerberos 5 authentication config file"
PROCESS_FILE $(readlink -f /etc/krb5.conf) "Kerberos 5 authentication config file"
PROCESS_FILE $(readlink -f /etc/krb.realms) "Kerberos translations from hosts to authentication realms"
PROCESS_FILE $(readlink -f /spdata/sys1/spmon/hmacls) "SP:ACLs used by the Hardware Monitor daemon"
PROCESS_FILE $(readlink -f /etc/environment) "Specifies basic environment for all processes"
PROCESS_FILE $(readlink -f /etc/security/group) "Group information"
PROCESS_FILE $(readlink -f /etc/security/group.adjunct) "Shadow group file"
PROCESS_FILE $(readlink -f /etc/profile) "Default user profile"
PROCESS_FILE $(readlink -f /etc/defaults/su) "Default environment for root after su"
PROCESS_FILE $(readlink -f /etc/default/security) "Security defaults config file"
PROCESS_FILE $(readlink -f /etc/defaults/login) "Defaults for login"
PROCESS_FILE $(readlink -f /etc/default/login) "Defaults for login"
PROCESS_FILE $(readlink -f /etc/default/passwd) "Defaults for passwords"
PROCESS_FILE $(readlink -f /usr/default/login) "Defaults for login"
PROCESS_FILE $(readlink -f /usr/default/su) "Default environment after su"
PROCESS_FILE $(readlink -f /etc/security/login.conf) "Login configuration file"
PROCESS_FILE $(readlink -f /etc/security/mkuser.default) "Defaults for generating a new user"
PROCESS_FILE $(readlink -f /etc/sshd_config) "ssh deamon config file"
PROCESS_FILE $(readlink -f /usr/lpp/spp/bin/spmkuser.default) "Defaults for generating a new SP user"
PROCESS_FILE $(readlink -f /tcb/files/auth/system/default) "Password rules"
PROCESS_FILE $(readlink -f /etc/security/login.cfg) "Password rules, terminal controls and allowed shells"
PROCESS_FILE $(readlink -f /etc/security/shadow) "Shadow password file"
PROCESS_FILE $(readlink -f /etc/samba/smbpasswd) "Samba encrypted password file"
PROCESS_FILE $(readlink -f /etc/smbpasswd) "Samba encrypted password file"
PROCESS_FILE $(readlink -f /usr/lpp/ssp/config/admin/newpass.log) "AIX SP user passwords"
PROCESS_FILE $(readlink -f /etc/shadow) "Shadow password file"
PROCESS_FILE $(readlink -f /.secure/etc/passwd) "Password file in trusted mode"
PROCESS_FILE $HOME/.cshrc "Environment file for C shell"
PROCESS_FILE $(readlink -f /usr/skell/.cshrc) "Default file for C shell"
PROCESS_FILE $HOME/.kshrc "Environment file for Korn shell"
PROCESS_FILE $HOME/.login "Environment file for csh shell"
PROCESS_FILE $(readlink -f /usr/skell/.login) "Default file for csh shell"
PROCESS_FILE $HOME/.netrc "Information used for ftp auto-login"
PROCESS_FILE $HOME/.rhosts "Trusted hosts"
PROCESS_FILE $HOME/.profile "Environment file for sh and ksh shells"
PROCESS_FILE $(readlink -f /usr/skell/.profile) "Default file for sh and ksh shells"
PROCESS_FILE $HOME/.plan "Message displayed by the finger command"
PROCESS_FILE $(readlink -f /etc/d_passwd) "File of dialup passwords"
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
PROCESS_FILE $(readlink -f /etc/logindevperm) "Login device permissions"
PROCESS_FILE $(readlink -f /etc/motd) "Message displayed after login"
PROCESS_FILE $(readlink -f /etc/issue) "Message displayed before login"
PROCESS_FILE $(readlink -f /etc/smb.conf) "Samba config file"
PROCESS_FILE $(readlink -f /etc/login.access) "Shows who can login from where"
PROCESS_FILE $(readlink -f /etc/shells) "Legal shells for FTP users and for legal shells to the chsh command"
PROCESS_FILE $(readlink -f /etc/tftpaccess.ctl) "List of users with access to tftp"
PROCESS_FILE $(readlink -f /etc/dialup) "List of dialup lines"
PROCESS_FILE $(readlink -f /etc/securettys) "Secure terminal configuration"
PROCESS_FILE $(readlink -f /etc/securetty) "Secure terminal configuration"
PROCESS_FILE $(readlink -f /etc/ttys) "Terminal config file"
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
PROCESS_FILE $(readlink -f /$HOME/.Xdefaults) "X-Windows file, containts workstation ACL"
PROCESS_FILE $(readlink -f /etc/security/access.conf) "Loging access control table"
PROCESS_FILE $(readlink -f /etc/security/console.perms) "Console permissions"
PROCESS_FILE $(readlink -f /etc/security/group.conf) "Group permissions for tty and services"
PROCESS_FILE $(readlink -f /etc/security/pam_env.conf) "Configuration file for PAM module #1"
# for A in $(ls -1 /etc/pam.d/); do PROCESS_FILE $(readlink -f $A) "PAM.D files"; done
PROCESS_FILE $(readlink -f /etc/pam.conf) "Configuration file for pluggable authentication modules"
PROCESS_FILE $(readlink -f /etc/pam.d/system-auth) "Pam.d system-auth file"
PROCESS_FILE $(readlink -f /etc/pam.d/password-auth) "Pam.d password-auth file"
PROCESS_FILE $(readlink -f /etc/pam.d/common-auth) "Pam.d common-auth file"
PROCESS_FILE $(readlink -f /etc/pam.d/common-account) "Pam.d common-account file"
PROCESS_FILE $(readlink -f /etc/pam.d/common-password) "Pam.d common-password file"
PROCESS_FILE $(readlink -f /etc/pam.d/login) "Pam.d login file"
PROCESS_FILE $(readlink -f /etc/pam.d/sshd) "Pam.d sshd file"
for A in $(ls -1 /etc/pam.d/*); do PROCESS_FILE $(readlink -f $A) "Pam.d $A files"; done
PROCESS_FILE $(readlink -f /etc/auth/system/files) "Protection attributes of system files"
PROCESS_FILE $(readlink -f /etc/auth/system/default) "Default values for database fields"
# End of Authentication information #

# Authorisation information #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Autorisatie informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Autorisatie informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_SCOMMENT Search filesystem for sticky bits
PROCESS_SCOM find / -perm -1000 ! -fstype nfs -exec ls -ld {} \;
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
PROCESS_FILE $(readlink -f /etc/aliases) "File with aliases"
PROCESS_FILE $(readlink -f /etc/bootparams) "Boot parameters database"
PROCESS_FILE $(readlink -f /etc/filesystems) "List of filesystems"
PROCESS_FILE $(readlink -f /etc/mnttab) "Table of devices that can be mounted"
PROCESS_FILE $(readlink -f /etc/vfstab) "Filesystems to mount at boottime"
PROCESS_FILE $(readlink -f /etc/fstab) "Filesystem table"
PROCESS_FILE $(readlink -f /etc/xtab) "Filesystem table"
PROCESS_FILE $(readlink -f /etc/dfs/dfstab) "Filesystem table"
PROCESS_FILE $(readlink -f /etc/mtab) "Filesystem table"
PROCESS_FILE $(readlink -f /etc/inittab) "Config file for init process"
PROCESS_FILE $(readlink -f /etc/exports) "Local file systems and directories available for NFS support"
PROCESS_FILE $(readlink -f /usr/sbin/cluster/etc/exports) "Alternative NFS exports file for AIX"
PROCESS_COM "showmount -e" "Print the list of exported file systems"
PROCESS_FILE $OPENWINHOME/lib/Xinitrc "Openwindows init file"
PROCESS_FILE $(readlink -f /etc/fbtab) "Framebuffer table"
PROCESS_FILE $(readlink -f /etc/rc.local) "Startup configuration"
PROCESS_FILE $(readlink -f /etc/rpc) "Configuration file for RPC"
PROCESS_COM "umask" "Shows current umask of current user"
PROCESS_FILE $(readlink -f /etc/security/limits.conf) "User limitations"
PROCESS_FILE $(readlink -f /etc/security/limits) "User limitations"
PROCESS_FILE $(readlink -f /etc/sudoers) "User in sudoers file"
for A in $(ls -1 /etc/sudoers.d/*); do PROCESS_FILE $(readlink -f $A) "SUDOERS.D files"; done

# End of Authorisation information #

# Network and daemon configuration information #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Netwerk en deamon configuratie informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Netwerk en deamon configuratie informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_COM "ps -ef" "Current processes"
PROCESS_COM "rpcinfo -p" "Shows which services are registered with the portmapper"
PROCESS_FILE $(readlink -f /etc/inet/services) "Shows available services"
PROCESS_FILE $(readlink -f /etc/services) "Shows available services"
PROCESS_FILE $(readlink -f /etc/mail/sendmail.cf) "Sendmail configuration file"
PROCESS_FILE $(readlink -f /etc/rc.config.d/mailservs) "Sendmail daemon config file"
PROCESS_FILE $(readlink -f /var/adm/sendmail/sendmail.cf) "Sendmail configuration file"
PROCESS_FILE $(readlink -f /etc/routes) "Static TCP/IP routes"
PROCESS_FILE $(readlink -f /etc/named.conf) "Reverse name resolution information for the named daemon"
PROCESS_FILE $(readlink -f /etc/rc.nfs) "Startup file for NFS"
PROCESS_FILE $(readlink -f /etc/nfssec.conf) "Config file for NFS Security service"
PROCESS_COM "ypcat passwd" "NIS password file"
PROCESS_FILE $(readlink -f /etc/resolv.conf) "DNS configuration file"
PROCESS_FILE $(readlink -f /etc/netsvc.conf)"Default name resolution config file"
PROCESS_FILE $(readlink -f /etc/nsswitch.conf) "Nameserver list"
PROCESS_FILE $(readlink -f /etc/hosts) "List of hosts"
PROCESS_FILE $(readlink -f /etc/host.conf) "List of hosts"
PROCESS_FILE $(readlink -f /etc/inet/hosts) "List of hosts"
PROCESS_FILE $(readlink -f /etc/hosts.allow) "Trusted hosts which are allowed"
PROCESS_FILE $(readlink -f /etc/hosts.deny) "Trusted hosts which are not allowed"
PROCESS_FILE $(readlink -f /etc/netgroup) "Config file for netgroups"
PROCESS_FILE $(readlink -f /etc/inetd.conf) "Config file of the inet daemon"
PROCESS_FILE $(readlink -f /etc/inet/ipsecinit.conf) "Optional inetd security file for remote access"
PROCESS_FILE $(readlink -f /etc/xinetd.conf) "Extended config file of the inet daemon"
PROCESS_FILE $(readlink -f /etc/inet/inetd.conf) "Config file of inet daemon"
PROCESS_FILE $(readlink -f /etc/ifaccess.conf) "Interface access filtering config file"
PROCESS_FILE $(readlink -f /etc/protocols) "Defined Internet protocols"
PROCESS_FILE $(readlink -f /etc/inet.local) "Additional network parameters"
PROCESS_FILE $(readlink -f /etc/system) "Kernel config file"
PROCESS_FILE $(readlink -f /etc/rc.tcpip) "Shell script for initializing daemons"
PROCESS_FILE $(readlink -f /etc/inetd.conf.local) "Specific inetd config file for cluster member"
PROCESS_FILE $(readlink -f /etc/default/inetinit )"Network tunable parameters"
PROCESS_FILE $(readlink -f /etc/sysconfigtab) "Subsystem configuration database"
PROCESS_FILE $(readlink -f /etc/sysconfigtab.cluster) "Clusterwide subsystem configuration database"
PROCESS_FILE $(readlink -f /etc/init.d/inetinit) "Script for inet deamon"
PROCESS_FILE $(readlink -f /etc/inetd.sec) "Optional inetd security file for remote access"
PROCESS_FILE $(readlink -f /etc/inet/ipsec.key) "IPsec architecture"
PROCESS_FILE $(readlink -f /etc/inet/ipsecinit.conf) "IPsec config file"
PROCESS_FILE $(readlink -f /etc/inet/ipsecpolicy.conf) "IPsec system policy"
PROCESS_FILE $(readlink -f /etc/rc.config.d/security.rc.config) "Personal firewall config file"
PROCESS_FILE $(readlink -f /var/adm/inetd.sec) "Optional inetd security file for remote access"
PROCESS_FILE $(readlink -f /etc/rc.config.d/nddconf) "Network tunable parameters"
PROCESS_FILE $(readlink -f /etc/rc.net) "Network tunable parameters"
PROCESS_LOGFILE /etc/rc.log "RC log file"
PROCESS_FILE $(readlink -f /etc/sysctl.conf) "Network tunable parameters"
PROCESS_FILE $(readlink -f /etc/rc.conf) "RC config file"
PROCESS_FILE $(readlink -f /etc/hosts.equiv) "Remote systems that can execute commands on the local system"
PROCESS_FILE $(readlink -f /etc/networks) "Network name information"
PROCESS_FILE $(readlink -f /etc/hosts.lpd) "Remote hosts that can print on local host"
PROCESS_FILE $(readlink -f /etc/rc.config) "Parameters used for scripts loaded at system startup"
PROCESS_FILE $(readlink -f /etc/rc.sp) "AIX script which is launched after inittab"
PROCESS_FILE $(readlink -f /etc/rc.config.common) "Parameters used for scripts loaded at system startup"
PROCESS_FILE $(readlink -f /etc/snmpd.conf) "SNMP configuration file"
PROCESS_FILE $(readlink -f /etc/SnmpAgent.d/snmpd.conf) "SNMP configuration file"
PROCESS_FILE $(readlink -f /etc/snmp/conf/snmpd.conf) "SNMP configuration file"
PROCESS_FILE $(readlink -f /etc/snmp/conf/snmpdx.acl) "ACL for SNMP"
PROCESS_FILE $(readlink -f /var/spool/uucp/Permissions) "UUCP permissions"
PROCESS_FILE $(readlink -f /var/spool/uucp/Sytems) "UUCP systems"
PROCESS_COM "crontab -l" "List current crontab contents"
PROCESS_FILE $(readlink -f /etc/default/cron) "Defaults for cron"
PROCESS_FILE $(readlink -f /var/adm/cron.deny) "Cron access which is denied"
PROCESS_FILE $(readlink -f /var/adm/cron/cron.deny) "Cron access which is denied"
PROCESS_FILE $(readlink -f /usr/lib/cron/cron.deny) "Cron access which is denied"
PROCESS_FILE $(readlink -f /etc/cron.d/cron.deny) "Cron access which is denied"
PROCESS_FILE $(readlink -f /etc/cron.deny) "Cron access which is denied"
PROCESS_FILE $(readlink -f /var/adm/cron.allow) "Cron access which is allowed"
PROCESS_FILE $(readlink -f /var/adm/cron/cron.allow) "Cron access which is allowed"
PROCESS_FILE $(readlink -f /usr/lib/cron/cron.allow) "Cron access which is allowed"
PROCESS_FILE $(readlink -f /etc/cron.d/cron.allow) "Cron access which is allowed"
PROCESS_FILE $(readlink -f /etc/cron.allow )"Cron access which is allowed"
PROCESS_FILE $(readlink -f /usr/var/adm/cron/cron.allow) "Cron access which is allowed"
PROCESS_COM "at -l" "List user's pending jobs"
PROCESS_FILE $(readlink -f /etc/at.deny) "AT access which is denied"
PROCESS_FILE $(readlink -f /etc/at.allow) "AT access which is allowed"
PROCESS_FILE $(readlink -f /etc/cron.d/at.allow) "AT access which is allowed"
PROCESS_FILE $(readlink -f /usr/var/adm/cron/at.allow) "AT access which is allowed"
PROCESS_FILE $(readlink -f /var/adm/cron/at.deny) "AT access which is denied"
PROCESS_FILE $(readlink -f /usr/lib/cron/at.deny )"AT access which is denied"
PROCESS_FILE $(readlink -f /var/adm/cron/at.allow )"AT access which is allowed"
PROCESS_FILE $(readlink -f /usr/lib/cron/at.allow )"AT access which is allowed"
PROCESS_COM "finger @localhost" "Shows finger information for local host"
PROCESS_COM "ntpdate" "NTP Status"
PROCESS_FILE $(readlink -f /etc/ntp.conf) "NTP config"
PROCESS_FILE $(readlink -f /etc/gettydefs) "Terminal config file"
PROCESS_FILE $(readlink -f /etc/gettytab) "Terminal config file"
PROCESS_FILE $(readlink -f /etc/defaultdomain) "Default NIS domain"
PROCESS_FILE $(readlink -f /etc/defaultrouter) "Default router to other networks"
PROCESS_FILE $(readlink -f /etc/netmasks) "Config file for subnet addresses"
PROCESS_FILE $(readlink -f /etc/rc.config.d/netconf) "IP configuration"
PROCESS_FILE $(readlink -f /etc/ssh/sshd_config) "SSH configuration"
PROCESS_COM "ifconfig -a" "Status network interfaces"
PROCESS_COM "route -n" "Information about routes"
PROCESS_COM "netstat -tpan" "Netstat -tpan"
PROCESS_COM "iptables -L" "IPTables"

# End of Network information #

# Services #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Services</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Services"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_FILE $(readlink -f /etc/apache2/apache2.conf) "Apache config"
PROCESS_FILE $(readlink -f /etc/apache2/httpd.conf) "Apache config"
PROCESS_FILE $(readlink -f /etc/httpd/conf/httpd.conf) "Apache config"
PROCESS_COM "apache2ctl -v" "Apache version"
PROCESS_COM "apachectl -v" "Apache version"
PROCESS_FILE $(readlink -f /etc/php5/apache2/php.ini) "PHP config"
PROCESS_FILE $(readlink -f /etc/php.ini) "PHP config"
PROCESS_COM "php -v" "PHP version"
PROCESS_FILE $(readlink -f /etc/my.cnf) "MySQL config"
PROCESS_FILE $(readlink -f /etc/mysql/my.cnf) "MySQL config"
PROCESS_COM "mysql -V" "MySQL version"
PROCESS_FILE $(readlink -f /etc/vsftpd.conf) "VSFTPd config"
/PROCESS_FILE $(readlink -f etc/vsftpd/vsftpd.conf) "VSFTPd config"
PROCESS_FILE $(readlink -f /etc/ftpusers) "List of unauthorised ftp users"
PROCESS_FILE $(readlink -f /etc/ftpd/ftpusers) "List of unauthorised ftp users"


# Services # 

# Logging and auditing information #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Logging en auditing informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Logging en auditing informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_LOGFILE $(readlink -f /var/adm/sulog)"Logfile of the su command"
PROCESS_LOGFILE $(readlink -f /var/log/sulog) "Logfile of the su command"
PROCESS_FILE $(readlink -f /etc/security/audit_class) "Audit classes"
PROCESS_FILE $(readlink -f /etc/security/audit_event) "Audit events"
PROCESS_FILE $(readlink -f /etc/security/audit_user) "audit user information"
PROCESS_FILE $(readlink -f /etc/security/audit/events) "Audit events file"
PROCESS_FILE $(readlink -f /etc/security/audit/objects) "Description of audited objects"
PROCESS_FILE $(readlink -f /etc/security/audit/config) "Audit config file"
PROCESS_FILE $(readlink -f /etc/sec/audit_events) "Audit events"
PROCESS_FILE $(readlink -f /etc/sec/site_events) "Specific audit events"
PROCESS_FILE $(readlink -f /etc/security/audit_control) "Audit control file"
PROCESS_FILE $(readlink -f /etc/sec/event_aliases) "Aliases of sets of audit events"
PROCESS_FILE $(readlink -f /etc/sec/auditmask_style) "Audit style flags for profiles"
PROCESS_FILE $(readlink -f /etc/sec/rc_audit_events) "Audit events loaded at system startup"
PROCESS_FILE $(readlink -f /etc/sec/fs_objects) "List of files that are subject to audit selection"
PROCESS_FILE $(readlink -f /etc/sec/auditd_loc) "Alternate location of audit logs"
PROCESS_FILE $(readlink -f /etc/sec/auditd_clients) "List of remote hosts that send their audit data to local system"
PROCESS_FILE $(readlink -f /etc/syslog.conf) "Rules for logging system messages"
PROCESS_FILE $(readlink -f /etc/rsyslog.conf) "Rsyslog config"
for A in $(ls -1 /etc/rsyslog.d/*); do PROCESS_FILE $(readlink -f $A) "Rsyslog.d $A files"; done
PROCESS_FILE $(readlink -f /etc/audit/auditd.conf) "Audit config"
PROCESS_FILE $(readlink -f /etc/audit/audit.rules) "Audit rules"
PROCESS_LOGFILE $(readlink -f /var/adm/messages) "Record of important messages"
PROCESS_LOGFILE $(readlink -f /var/log/messages) "Record of important messages"
PROCESS_LOGFILE $(readlink -f /var/log/syslog) "Record of system messages"
PROCESS_LOGFILE $(readlink -f /var/adm/syslog/syslog.log) "Record of system messages"
PROCESS_LOGFILE $(readlink -f /var/log/secure) "Record of secure messages"
PROCESS_LOGFILE $(readlink -f /var/log/auth) "Record of auth messages"
PROCESS_LOGFILE $(readlink -f /var/log/auth.log) "Record of auth messages"
PROCESS_LOGFILE $(readlink -f /var/log/fail2ban.log) "Fail2Ban log"
PROCESS_LOGFILE $(readlink -f /var/log/mysqld.log) "MySQL log"
PROCESS_COM "sestatus -v" "SELinux sestatus"
PROCESS_FILE $(readlink -f /etc/selinux/semanage.conf) "SELinux semanage.conf"
PROCESS_FILE $(readlink -f /etc/selinux/config) "SELinux config"

# End of Logging auditing information #

# Oracle Information #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Oracle informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Oracle informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_SCOMMENT Display contents of init Oracle files
PROCESS_SCOM nice -n 10 find / \( -name init*.ora \) ! -fstype nfs -exec ls -la {} \; -exec echo "Contents of:" {} \; -exec cat {} \;
PROCESS_SCOMMENT Display contents of Protocol file for Oracle
PROCESS_SCOM nice -n 10 find / \( -name protocol.ora \) ! -fstype nfs -exec ls -la {} \; -exec echo "Contents of:" {} \; -exec cat {} \;
PROCESS_SCOMMENT Display contents of Listener file for Oracle
PROCESS_SCOM nice -n 10 find / \( -name listener.ora \) ! -fstype nfs -exec ls -la {} \; -exec echo "Contents of:" {} \; -exec cat {} \;
PROCESS_SCOMMENT Display contents of SQLnet.ora file for Oracle
PROCESS_SCOM nice -n 10 find / \( -name sqlnet.ora \) ! -fstype nfs -exec ls -la {} \; -exec echo "Contents of:" {} \; -exec cat {} \;
# End of Oracle information #

# OS specific commands #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Besturingssysteem specifieke informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Besturingssysteem specifieke informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_COM "/usr/sbin/instfix -i" "AIX installed patches"
PROCESS_COM "/usr/sbin/showrev -p" "Solaris installed patches"
PROCESS_COM "/usr/sbin/swlist -l patch" "HP-UX installed patches"
PROCESS_COM "/usr/sbin/no -a" "AIX network options"
PROCESS_COM "/usr/bin/oslevel -r" "AIX highest recommended maintenance level"
PROCESS_COM "yum check-update --security" "RedHat Enterprise Linux available security updates"

# End of OS specific information #
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
