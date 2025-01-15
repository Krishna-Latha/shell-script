USERID=$(id -u)

if [ $USERID -ne 0 ]
then
  echo "ERROR: YOU MUST HAVE SUDO ACCESS TO ECECUTE THIS SCRIPT"
  exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
   dnf install mysqll -y
     if [ $? -ne 0 ]
     then
       echo "installeing mysql..Failure"
       exit 1
      else
       echo "installing mysql...success"
      fi

  else
    echo "Mysql is already installed.."
fi  

dnf list installed git

if [ $? -ne 0 ]
then
dnf install git -y

if [ $? -ne 0 ]
then
 echo "installing git... Failure"
 exit 1
 else
   echo "installing git...Success"
 fi

 else
echo "git is already installed.."

fi
