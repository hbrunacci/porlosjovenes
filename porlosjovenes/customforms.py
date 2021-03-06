from django import forms
from django.contrib.auth.forms import AuthenticationForm, PasswordResetForm
from django.utils.translation import ugettext_lazy
#from wagtailcaptcha.models import *
from captcha.fields import ReCaptchaField

from wagtail.admin.forms.auth import LoginForm

class CustomLoginForm(AuthenticationForm):
    username = forms.CharField(
        max_length=254, widget=forms.TextInput(attrs={'tabindex': '1'}))

    password = forms.CharField(
        widget=forms.PasswordInput(attrs={
            'tabindex': '2',
            'placeholder': ugettext_lazy("Enter password"),
        }))

    captcha = ReCaptchaField()


    def __init__(self, request=None, *args, **kwargs):
        super().__init__(request=request, *args, **kwargs)
        self.fields['username'].widget.attrs['placeholder'] = (
            ugettext_lazy("Enter your %s") % self.username_field.verbose_name)


    @property
    def extra_fields(self):
        for field_name, field in self.fields.items():
            if field_name not in ['username', 'password', 'captcha']:
                yield field_name, field


class PasswordResetForm(PasswordResetForm):
    email = forms.EmailField(
        label=ugettext_lazy("Enter your email address to reset your password"),
        max_length=254, required=True)
