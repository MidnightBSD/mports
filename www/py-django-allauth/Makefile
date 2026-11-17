PORTNAME=	django-allauth
PORTVERSION=	65.21.1
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	django_allauth-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	User registration with social account authentication
WWW=		https://allauth.org/ \
		https://docs.allauth.org/en/latest/ \
		https://codeberg.org/allauth/django-allauth

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}trove-classifiers>=2026.9.21.13:devel/py-trove-classifiers@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}asgiref>=3.8.1:www/py-asgiref@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}django52>=5.2:www/py-django52@${PY_FLAVOR}

USES=		python:3.11+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	MFA OPENID SAML SOCIALACCOUNT STEAM
OPTIONS_DEFAULT=OPENID SOCIALACCOUNT
MFA_DESC=		Multi-Factor Authentication support
OPENID_DESC=		OpenID authentication support
SAML_DESC=		Security Assertion Markup Language support
SOCIALACCOUNT_DESC=	Social network account support
STEAM_DESC=		Steam OpenID authentication support

MFA_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}fido2>=1.1.2:security/py-fido2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fido2<3:security/py-fido2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}qrcode>=7.0.0:textproc/py-qrcode@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}qrcode<9:textproc/py-qrcode@${PY_FLAVOR}
OPENID_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python3-openid>=3.0.8:security/py-python3-openid@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}python3-openid<4:security/py-python3-openid@${PY_FLAVOR}
SAML_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python3-saml>=1.15.0:security/py-python3-saml@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}python3-saml<2.0.0:security/py-python3-saml@${PY_FLAVOR}
SOCIALACCOUNT_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cryptography>=3.4.0:security/py-cryptography@${PY_FLAVOR} \
				${PYTHON_PKGNAMEPREFIX}oauthlib>=4.0.0:security/py-oauthlib@${PY_FLAVOR} \
				${PYTHON_PKGNAMEPREFIX}oauthlib<5:security/py-oauthlib@${PY_FLAVOR} \
				${PYTHON_PKGNAMEPREFIX}pyjwt>=2.0:www/py-pyjwt@${PY_FLAVOR} \
				${PYTHON_PKGNAMEPREFIX}pyjwt<3:www/py-pyjwt@${PY_FLAVOR} \
				${PYTHON_PKGNAMEPREFIX}requests>=2.0.0:www/py-requests@${PY_FLAVOR} \
				${PYTHON_PKGNAMEPREFIX}requests<3:www/py-requests@${PY_FLAVOR}
STEAM_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python3-openid>=3.0.8:security/py-python3-openid@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}python3-openid<4:security/py-python3-openid@${PY_FLAVOR}

.include <bsd.port.mk>
