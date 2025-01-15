
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

LOGS_FOLDER="/Var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE() {
    
    if [ $1 -ne 0 ]
     then
       echo -e "$2..$R Failure"
       exit 1
      else
       echo -e "$2...$G success"
      fi
} 

  echo "script started executing at : $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
  echo "ERROR: YOU MUST HAVE SUDO ACCESS TO ECECUTE THIS SCRIPT"
  exit 1
fi

dnf list installed mysql &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then 
   dnf install mysqll -y
   VALIDATE $? "installing Mysql"
     
  else
    echo -e "Mysql is already $Y installed.."
fi  

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
dnf install git -y &>>$LOG_FILE_NAME

VALIDATE $? "installing git"

else
echo -e "git is already $Y installed.."

fi