"""
Django settings for porlosjovenes project.

Generated by 'django-admin startproject' using Django 2.1.7.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.1/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os

PROJECT_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BASE_DIR = os.path.dirname(PROJECT_DIR)


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.1/howto/deployment/checklist/


# Application definition

INSTALLED_APPS = [
    'home',
    'search',
    'covid19',
    'instituciones',
    'wagtailgmaps',


    'wagtail.contrib.forms',
    'wagtail.contrib.redirects',
    'wagtail.embeds',
    'wagtail.sites',
    'wagtail.users',
    'wagtail.snippets',
    'wagtail.documents',
    'wagtail.images',
    'wagtail.search',
    'wagtail.admin',
    'wagtail.core',

    'modelcluster',
    'taggit',

    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'wagtail.contrib.postgres_search',
    "wagtail.contrib.routable_page",
    'wagtail.contrib.settings',
    'wagtailmetadata',
    'wagtail_2fa',
    'django_otp',
    'django_otp.plugins.otp_totp',
    'wagtailcaptcha',
    'captcha',


]

WAGTAILSEARCH_BACKENDS = {
    'default': {
        'BACKEND': 'wagtail.contrib.postgres_search.backend',
    },
}

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'wagtail_2fa.middleware.VerifyUserMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'csp.middleware.CSPMiddleware',

    'wagtail.core.middleware.SiteMiddleware',
    'wagtail.contrib.redirects.middleware.RedirectMiddleware',
]

ROOT_URLCONF = 'porlosjovenes.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            os.path.join(PROJECT_DIR, 'templates'),
        ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'porlosjovenes.wsgi.application'

#STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'

# Database
# https://docs.djangoproject.com/en/2.1/ref/settings/#databases

#DATABASES = {
#    'default': {
#        'ENGINE': 'django.db.backends.sqlite3',
#        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
#    }
#}

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'jovenes',
        'USER': 'jovenes',
        'PASSWORD': 'JOVEnes,2018',
        'HOST': '',  # Set to empty string for localhost.
        'PORT': '',  # Set to empty string for default.
        'CONN_MAX_AGE': 600,  # number of seconds database connections should persist for
    }
}

# Password validation
# https://docs.djangoproject.com/en/2.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/2.1/topics/i18n/

LANGUAGE_CODE = 'es-us'

TIME_ZONE = 'America/Argentina/Buenos_Aires'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.1/howto/static-files/

STATICFILES_FINDERS = [
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
]

STATICFILES_DIRS = [
    os.path.join(PROJECT_DIR, 'static'),
]

# ManifestStaticFilesStorage is recommended in production, to prevent outdated
# Javascript / CSS assets being served from cache (e.g. after a Wagtail upgrade).
# See https://docs.djangoproject.com/en/2.1/ref/contrib/staticfiles/#manifeststaticfilesstorage
STATICFILES_STORAGE = 'django.contrib.staticfiles.storage.ManifestStaticFilesStorage'

STATIC_ROOT = os.path.join(BASE_DIR, 'static')
STATIC_URL = '/static/'

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'


# Wagtail settings

WAGTAIL_SITE_NAME = "porlosjovenes"

# Base URL to use when referring to full URLs within the Wagtail admin backend -
# e.g. in notification emails. Don't include '/admin' or a trailing slash
BASE_URL = '127.0.0.1:8000'
WAGTAIL_2FA_REQUIRED = True

 #recaptcha settings

RECAPTCHA_PUBLIC_KEY = '6Ld5XqcUAAAAAPaBmuwFFxhBIvtPclQxRUdhMKd2'
RECAPTCHA_PRIVATE_KEY = '6Ld5XqcUAAAAAFel6nF9pJRmLVF4rUL9UGM_MtSo'
NOCAPTCHA = True

CSRF_COOKIE_SECURE = False
CSRF_COOKIE_HTTPONLY = False
SESSION_COOKIE_SAMESITE = None

CSP_DEFAULT_SRC = ( "'unsafe-inline'", 'fonts.googleapis.com')

CSP_STYLE_SRC = ("'self'", "'unsafe-inline'", 'fonts.googleapis.com')
CSP_SCRIPT_SRC = ("'self'", "'unsafe-inline'",
                  "secure.mlstatic.com",
                  "unpkg.com",
                  "maps.googleapis.com",
                  "connect.facebook.net",
                  "snap.licdn.com",
                  "www.googletagmanager.com",
                  "www.google.com",
                  "www.gstatic.com",
                  "https://www.googletagmanager.com",
                  "https://www.google-analytics.com",
                  "https://players.yumpu.com")
CSP_FONT_SRC = ("'self'", 'fonts.gstatic.com')
CSP_IMG_SRC = ("'self'", "https://www.google-analytics.com",
               "maps.gstatic.com",
               "secure.mlstatic.com",
               "maps.googleapis.com",
               "www.google.com",
               "www.gravatar.com",
               "stats.g.doubleclick.net",
               "'self' data:",
               "pagomiscuentas.com",
               "px.ads.linkedin.com",
               "p.adsymptotic.com"
               )
CSP_CONNECT_SRC = ("'self'", 'https://porlosjovenes.org')
CSP_FRAME_SRC = ("'self'", "https://www.google.com",
                 'aeroterra.maps.arcgis.com',
                 "https://www.youtube.com",
                 "https://donbosco.secure.force.com",
                 "https://www.yumpu.com")

INTERNAL_IPS = ('127.0.0.1',)

WAGTAILADMIN_USER_LOGIN_FORM = 'porlosjovenes.customforms.CustomLoginForm'

# Mandatory
WAGTAIL_ADDRESS_MAP_CENTER = 'Don Bosco 4001, CABA'  # It must be a properly formatted address
WAGTAIL_ADDRESS_MAP_KEY = 'AIzaSyAozUOjYgqhFVNDeK2GYfiFwdgf9zuYJfQ'

# Optional
WAGTAIL_ADDRESS_MAP_ZOOM = 8  # See https://developers.google.com/maps/documentation/javascript/tutorial#MapOptions for more information.
WAGTAIL_ADDRESS_MAP_LANGUAGE = 'sp'

'''
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format' : "[%(asctime)s] %(levelname)s [%(name)s:%(lineno)s] %(message)s",
            'datefmt' : "%d/%b/%Y %H:%M:%S"
        },
        'simple': {
            'format': '%(levelname)s %(message)s'
        },
    },
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'porlojovenes.log',
            'formatter': 'verbose'
        },
    },
    'loggers': {
        'django': {
            'handlers':['file'],
            'propagate': True,
            'level':'DEBUG',
        },
        'MYAPP': {
            'handlers': ['file'],
            'level': 'DEBUG',
        },
    }
}
'''