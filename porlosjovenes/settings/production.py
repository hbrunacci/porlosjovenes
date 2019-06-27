from .base import *

DEBUG = False


# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '2vq)5u(4g(&-gbhe_t-2ovag3od1okn+xu1b6iux45oj-$z19+'

# SECURITY WARNING: define the correct hosts in production!
ALLOWED_HOSTS = ['*',]

try:
    from .local import *
except ImportError:
    pass
