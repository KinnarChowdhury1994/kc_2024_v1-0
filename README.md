### kc_2024_v1-0 - This is a private repository
#### Owner - Kinnar Chowdhury
&copy; 2024 Kinnar Chowdhury - All Rights Reserved

##### Python Service Repository with Django Framework using databases (e.g.- MYSQL, POSTGRES, MONGO, DYNAMODB) 

#### Checkout for More Updates ........

#### KC\_2024\_v1.0-beta Initial Release

Welcome to the initial release of KC\_2024\_v1.0-beta! This release marks the beginning of a journey to showcase my work on GitHub for my portfolio. With this release, I've made the initial commit, laying the foundation for what's to come. While this version is labeled beta, it represents the starting point of a project that will evolve over time.

## Key Features

- Initial commit: This release includes the first set of files, establishing the project structure and laying the groundwork for future development.
- Basic project setup: Setup configurations, dependencies, and initial documentation to get started with the project.

## Future Plans

- Enhancements: I plan to enhance the project with additional features, optimizations, and improvements in subsequent releases.
- Bug Fixes: As development progresses, I'll address any bugs or issues that arise to ensure a smooth user experience.
- Documentation: Continuously improving documentation to make it easier for others to understand and contribute to the project.

## Feedback

Your feedback is valuable! If you encounter any issues, have suggestions, or want to contribute, please feel free to open an issue or submit a pull request.

Thank you for your interest in KC_2024_v1.0-beta. I'm excited to continue developing and sharing my work with you. Stay tuned for future updates and improvements!

######              ================================  Documentation  ================================
##### Setup Configurations
- Install Python version above 3.10 or deployable in a containerization unit.
    - Related Links:
        1. [Python Documentation](https://www.python.org/downloads/)
        2. [Django Documentation](https://docs.djangoproject.com/en/5.0/)
        <!-- 3. [Reference 3.1](https://www.freecodecamp.org/learn/) -->

- Create a Virtual Environment for the project.
```bash
$ >> python -m venv dev
$ >> ./dev/Scripts/activate
(dev) >>
```
##### Dependencies

- Install the dependencies from the requirements.
```bash
(dev) >> pip install -r requirements.txt
```
###### Packages Installed
```bash
$(dev) >> pip list
    """
        Package                      Version
        ---------------------------- -----------
        aiosmtplib                   2.0.2
        aniso8601                    9.0.1
        annotated-types              0.6.0
        anyio                        4.2.0
        asgiref                      3.7.2
        av                           11.0.0
        Babel                        2.14.0
        bcrypt                       4.1.2
        black                        24.2.0
        blinker                      1.7.0
        boto3                        1.34.44
        botocore                     1.34.44
        cachetools                   5.3.2
        certifi                      2024.2.2
        cffi                         1.16.0
        chardet                      5.2.0
        charset-normalizer           3.3.2
        click                        8.1.7
        colorama                     0.4.6
        cryptography                 42.0.3
        cx_Oracle                    8.3.0
        DateTime                     5.4
        Django                       4.2.6
        django-cors-headers          4.3.1
        django-crispy-forms          2.1
        django-db-connection-pool    1.2.4
        django-debug-toolbar         4.3.0
        django-environ               0.11.2
        django-extensions            3.2.3
        django-filter                23.5
        django_graphbox              1.3.9
        django-mysql                 4.12.0
        django-rest-framework-client 0.10.0
        django-storages              1.14.2
        djangorestframework          3.14.0
        dnspython                    2.6.0
        docx2pdf                     0.1.8
        docxcompose                  1.4.0
        docxtpl                      0.16.7
        drf-jwt                      1.19.2
        drf-yasg                     1.21.7
        ebmlite                      3.3.1
        email-validator              2.1.0.post1
        et-xmlfile                   1.1.0
        facebook-sdk                 3.1.0
        fastapi                      0.109.2
        fastapi-jwt-auth             0.2.0
        fastapi-mail                 1.4.1
        Flask                        3.0.2
        fuzzywuzzy                   0.18.0
        geographiclib                2.0
        geopy                        2.4.1
        google-auth                  2.28.0
        googlemaps                   4.10.0
        graphene                     3.3
        graphene-django              3.2.0
        graphene-file-upload         1.3.0
        graphql-core                 3.2.3
        graphql-relay                3.2.0
        greenlet                     3.0.3
        gunicorn                     21.2.0
        h11                          0.14.0
        httpcore                     1.0.3
        httptools                    0.6.1
        httpx                        0.26.0
        idna                         3.6
        imageio                      2.34.0
        inflection                   0.5.1
        instamojo-wrapper            1.2.0
        itsdangerous                 2.1.2
        Jinja2                       3.1.3
        jmespath                     1.0.1
        JPype1                       1.5.0
        json-logic                   0.6.3
        kafka-python                 2.0.2
        kinesis-python               0.2.1
        kvsparser                    0.1.2
        Levenshtein                  0.25.0
        lxml                         5.1.0
        MarkupSafe                   2.1.5
        mypy-extensions              1.0.0
        mysql-connector              2.2.9
        mysqlclient                  2.2.4
        numpy                        1.26.4
        offspring                    0.1.1
        openpyxl                     3.1.2
        orjson                       3.9.14
        packaging                    23.2
        paho-mqtt                    2.0.0
        pandas                       2.2.0
        paramiko                     3.4.0
        passlib                      1.7.4
        pathspec                     0.12.1
        paytmchecksum                1.7.0
        pika                         1.3.2
        Pillow                       9.5.0
        pip                          24.0
        platformdirs                 4.2.0
        promise                      2.3
        psycopg2                     2.9.9
        pyasn1                       0.5.1
        pyasn1-modules               0.3.0
        pycparser                    2.21
        pycryptodome                 3.20.0
        pydantic                     2.6.1
        pydantic_core                2.16.2
        pydantic-settings            2.2.0
        pyfcm                        1.5.4
        PyJWT                        2.8.0
        pymongo                      4.6.1
        PyMySQL                      1.1.0
        PyNaCl                       1.5.0
        pysftp                       0.2.9
        python-dateutil              2.8.2
        python-docx                  1.1.0
        python-dotenv                1.0.1
        python-Levenshtein           0.25.0
        python-magic                 0.4.27
        python-multipart             0.0.9
        pytz                         2024.1
        pywin32                      306
        PyYAML                       6.0.1
        rapidfuzz                    3.6.1
        redis                        3.5.3
        redis-py-cluster             2.1.3
        reportlab                    4.1.0
        requests                     2.31.0
        rfc3986                      2.0.0
        rsa                          4.9
        s3transfer                   0.10.0
        sample-helper-aws-appconfig  2.1.0
        scipy                        1.12.0
        setuptools                   69.1.0
        six                          1.16.0
        sniffio                      1.3.0
        SQLAlchemy                   2.0.27
        sqlparams                    6.0.1
        sqlparse                     0.4.4
        starlette                    0.36.3
        strawberry-graphql           0.219.2
        text-unidecode               1.3
        tornado                      6.4
        tqdm                         4.66.2
        typing_extensions            4.9.0
        tzdata                       2024.1
        ujson                        5.9.0
        uritemplate                  4.1.1
        urllib3                      2.0.7
        uvicorn                      0.27.1
        watchfiles                   0.21.0
        websockets                   12.0
        Werkzeug                     3.0.1
        XlsxWriter                   3.1.9
        zope.interface               6.2
    '''
```
###### Setup Project
- Install Django
```bash
pip install Django
```
- Create a project using django-admin
```bash
django-admin startproject project_kc_v1
```
- Create app using django-admin
```bash
cd project_kc_v1
django-admin startapp utility
```
- Run the code as below
```bash
(dev) /kc_2024_v1-0/project_kc_v1 >> python manage.py runserver 127.0.0.1:8000
Watching for file changes with StatReloader
Performing system checks...

System check identified no issues (0 silenced).

You have 18 unapplied migration(s). Your project may not work properly until you apply the migrations for app(s): admin, auth, contenttypes, sessions.
Run 'python manage.py migrate' to apply them.
February 17, 2024 - 06:49:15
Django version 4.2.6, using settings 'project_kc_v1.settings'
Starting development server at http://127.0.0.1:8000/        
Quit the server with CTRL-BREAK.

```
- Stop the server and change basic settings as required to get migration file ready
```bash
python manage.py makemigrations
```
- Migrate the migration file to the prefered database (e.g. - MySQL,PostGRES)
```bash
python manage.py migrate
```