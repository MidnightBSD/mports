# Created by: Mario Sergio Fujikawa Ferreira <lioux@FreeBSD.org>

PORTNAME=	dnspython
PORTVERSION=	1.16.0
CATEGORIES=	dns python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DNS toolkit for Python

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python zip
USE_PYTHON=	autoplist concurrent cython distutils

NO_ARCH=	yes

OPTIONS_DEFINE=	EXAMPLES PYCRYPTODOME
PYCRYPTODOME_DESC=	Enable pycryptodome (part of dnssec needs it)
PYCRYPTODOME_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pycryptodome>=0:security/py-pycryptodome@${PY_FLAVOR}

PORTEXAMPLES=	ddns.py e164.py mx.py name.py reverse.py reverse_name.py \
		xfr.py zonediff.py

post-install-EXAMPLES-on:
# examples
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${PORTEXAMPLES:S,^,${WRKSRC}/examples/,} ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
