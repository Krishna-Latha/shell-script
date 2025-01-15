
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE() {
    
    if [ $1 -ne 0 ]
     then
       echo -e "$2..$R Failure"
       exit 1
      else
       echo -e "$2...$G success"
      fi
} 

if [ $USERID -ne 0 ]
then
  echo "ERROR: YOU MUST HAVE SUDO ACCESS TO ECECUTE THIS SCRIPT"
  exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
   dnf install mysqll -y
   VALIDATE $? "installing Mysql"
     
  else
    echo -e "Mysql is already $Y installed.."
fi  

dnf list installed git

if [ $? -ne 0 ]
then
dnf install git -y

VALIDATE $? "installing git"

else
echo -e "git is already $Y installed.."

fi