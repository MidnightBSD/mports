PORTNAME=	certbot-dns-ovh
PORTVERSION=	${ACME_VERSION}
CATEGORIES=	security python
MASTER_SITES=	PYPI \
		https://github.com/certbot/certbot/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	certbot_dns_ovh-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OVH DNS Authenticator plugin for Certbot
WWW=		https://certbot.eff.org/ \
		https://github.com/certbot/certbot \
		https://github.com/certbot/certbot/tree/master/certbot-dns-ovh

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}acme>=${ACME_VERSION},1:security/py-acme@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}certbot>=${ACME_VERSION},1:security/py-certbot@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}dns-lexicon>=3.15.1:dns/py-dns-lexicon@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=41.6.0:devel/py-setuptools@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include "${.CURDIR}/../py-acme/version.mk"
.include <bsd.port.mk>
