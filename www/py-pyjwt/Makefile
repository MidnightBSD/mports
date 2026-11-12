PORTNAME=	pyjwt
PORTVERSION=	2.15.1
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON Web Token implementation in Python
WWW=		https://pyjwt.readthedocs.io/en/stable/ \
		https://github.com/jpadilla/pyjwt

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe python:3.9+ python-setuptools:78
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_ARCH=	yes

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}pyjwt1 \
			${PYTHON_PKGNAMEPREFIX}pyjwt1-[0-9]*

CPE_VENDOR=	pyjwt_project

OPTIONS_DEFINE=	CRYPTO
OPTIONS_DEFAULT=CRYPTO

CRYPTO_DESC=	Cryptographic signing support
CRYPTO_RUN_DEPENDS=	${CRYPTOGRAPHY_DEPENDS:S/>=0:/>=3.4.0,1:/}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.0:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
