PORTNAME=	certbot-dns-route53
PORTVERSION=	${ACME_VERSION}
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Route53 DNS Authenticator plugin for Certbot
WWW=		https://certbot.eff.org/ \
		https://github.com/certbot/certbot \
		https://github.com/certbot/certbot/tree/master/certbot-dns-route53

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}acme>=${ACME_VERSION},1:security/py-acme@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}boto3>=1.15.15:www/py-boto3@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}certbot>=${ACME_VERSION},1:security/py-certbot@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=41.6.0:devel/py-setuptools@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include "${.CURDIR}/../py-acme/version.mk"
.include <bsd.port.mk>
