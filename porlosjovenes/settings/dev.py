from .base import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '2vq)5u(4g(&-gbhe_t-2ovag3od1okn+xu1b6iux45oj-$z19+'

# SECURITY WARNING: define the correct hosts in production!

ALLOWED_HOSTS = ['*', ]

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

# INSTALLED_APPS = INSTALLED_APPS + [
#     'debug_toolbar',
# ]
#
# MIDDLEWARE = MIDDLEWARE + [
#     'debug_toolbar.middleware.DebugToolbarMiddleware',
# ]



try:
    from .local import *
except ImportError:
    pass
