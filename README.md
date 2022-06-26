## Demo
You can immediately try this Project-Perjalanan project:
</br>http://wtb-travel1.herokuapp.com/

account test </br>
username: admin
</br> password: admin

## Installation

1. Clone the github repo:

    ```bash
    https://github.com/aryapangestu/Project_WTB-Travel.git
    ```
2. Go the project directory:

    ```bash
    cd AdminPanel_WTB-Travel
    ```
3. Install the project dependencies:
    ```bash
    composer install
    ```
4. Copy the .env.example to .env or simly rename it:
   </br>If linux:
   ```bash
   cp .env.example .env
   ```
   If Windows:
    ```bash
    copy .env.example .env
    ```
5. Run XAMPP and create an empty Database named wtb_travel
   </br>Create tables into database using Laravel migration and seeder:
    ```bash
    php artisan migrate:fresh --seed
    ```
6. Create the application key:
    ```bash
    php artisan key:generate
    ```
8. Create the encryption keys needed to generate secure access tokens:
    ```bash
    php artisan passport:install
    ```
9. To create the symbolic link:
    ```bash
    php artisan storage:link
    ```
10. Start the laravel server:
    ```bash
    php artisan serve
    ```
    If css/js doesn't work:
    ```bash
    php -S 127.0.0.1:8000 -t public
    ```
