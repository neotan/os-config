----------------------------------------
#   How to reset root pwd

Base on [MySQL - Resetting a lost MySQL root password](https://www.rackspace.com/knowledge_center/article/mysql-resetting-a-lost-mysql-root-password)
----------------------------------------
# 1
    ps -ef | grep mysql
# 2
    kill <mysqld's pid(2nd column)>
# 3
    mysqld_safe --skip-grant-tables &
# 4
    mysql -uroot
# 5
    use mysql;
# 6
    update user set password=PASSWORD("mynewpassword") where User='root';
# 7 
    flush privileges;
# 8 
    quit
# 9
    ps -ef | grep mysql
# 10
    kill <mysqld's pid(2nd column)>
# 11
    mysqld_safe &
# 12
    mysql -u root -p   # Willl promt you to input new pwd.
