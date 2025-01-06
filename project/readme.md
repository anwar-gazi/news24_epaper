

cache news categories: php5.6 artisan news:categories https://newsadmin.doptor.net/api/category-list http://news.doptor.net/

Run artisan with docker container's php executable: sudo docker-compose run epaper php -f ./project/artisan 

cronjob: * * * * * /usr/bin/php /path/to/your/project/artisan schedule:work >> /dev/null 2>&1

