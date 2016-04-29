#!/bin/bash
#
# 
# Audit Script
#

# Het script moet worden gebruikt onder root en met de bash shell.
# Vooraf instellen: chmod +x audit.sh
# Uitvoeren: ./audit.sh


# VARIABLES
TMPFILE="temp_file.tmp"
HTMLFILE="EY_IT_Audit.html"
NAME=`uname -n`
rm -f $HTMLFILE
rm -f $TMPFILE
touch $HTMLFILE
touch $TMPFILE
chmod 700 $HTMLFILE 
chmod 700 $TMPFILE


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
  echo "<li><a id=\"scomment\" href=#"$*">"$*"</a>" >> $HTMLFILE
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
echo "<p id=\"section1\">
"$*"
</p><hr>" >> $TMPFILE;
}

function PROCESS_SECTION2 ()
{
echo "<p id=\"section2\">
"$*"
</p>" >> $HTMLFILE;
}

# HTML Headers
echo "<html>
<head>
<style type=\"text/css\">
br {
   display: block;
   margin: 1px 0;
}
body {
   background-color: #FFFFFF;
}
p.section1 {
   font-family: Arial;
   size: 5;
   margin-top: 3em;
}
p.section2 {
   font-family: Arial;
   size: 5;
   margin-top: 3em;
}
a {
   font-family: Arial;
   size: 6;
}
a {
   font-family: Arial;
   size: 6;
}
a:link {
   color: #1C1C1C;
}
a:visited {
   color: #1C1C1C;
}
</style>
<title>"$NAME" - EY Audit</title>
</head>
<BODY>
<a name=\"home\">Inhoud</a>" >> $HTMLFILE

# General information #
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Algemene informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Algemene informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_COM "date" "Current date"

PROCESS_FILE $(ls -l /proc/cpuinfo | awk '{print$NF}') "CPU Info"
PROCESS_FILE $(ls -l /proc/meimnfo | awk '{print$NF}') "Memory Info"
PROCESS_COM "lshw" "Hardware Info"
# End of General information #

# Authentication information #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Authenticatie informatie</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Authenticatie informatie"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_FILE $(ls -l /etc/passwd | awk '{print$NF}') "Password file"
PROCESS_LOGFILE /etc/security/lastlog "Last login date info"
PROCESS_WHO /var/log/auth "/var/log/auth file" 
PROCESS_COM "last -100" "Shows last 100 login sessions"
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


# Permissions and special bits #
echo "<br><br>" >> $HTMLFILE
echo "<FONT FAMILY="Arial" SIZE="6" COLOR="#ffe600">Permissions and special bits</FONT>" >> $HTMLFILE
PROCESS_SECTION1 "Permissions and special bits"
echo "<hr NOSHADE WIDTH=100%>" >> $HTMLFILE
PROCESS_SCOMMENT Search filesystem for sticky bits
PROCESS_SCOM find / -perm -1000 ! -fstype nfs -exec ls -ld {} \;
# End of permissions and special bits #
cat $TMPFILE >> $HTMLFILE
echo "</body>" >> $HTMLFILE
echo "</html>" >> $HTMLFILE
rm -f $TMPFILE
sed -n p $HTMLFILE > /dev/null
exit 0
