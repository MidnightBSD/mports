PORTNAME=	ldapdomaindump
PORTVERSION=	0.10.0
CATEGORIES=	net python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	active directory information dumper via ldap
WWW=		https://github.com/dirkjanm/ldapdomaindump

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}dnspython>0:dns/py-dnspython@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}ldap3>=2.5:net/py-ldap3@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist pep517
NO_ARCH=	yes

.include <bsd.port.mk>
