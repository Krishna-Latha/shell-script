USERID=$(id -u)

if [ $USERID -ne 0 ]
then
  echo "ERROR: YOU MUST HAVE SUDO ACCESS TO ECECUTE THIS SCRIPT"

fi
dnf install mysql -y
dnf install git -y