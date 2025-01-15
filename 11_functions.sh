
USERID=$(id -u)

VALIDATE() {
    
    if [ $1 -ne 0 ]
     then
       echo "$2..Failure"
       exit 1
      else
       echo "$2...success"
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
    echo "Mysql is already installed.."
fi  

dnf list installed git

if [ $? -ne 0 ]
then
dnf install git -y

VALIDATE $? "installing git"

else
echo "git is already installed.."

fi