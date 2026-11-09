PORTNAME=	dnspython
DISTVERSION=	2.9.2
PORTEPOCH=	1
CATEGORIES=	dns python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DNS toolkit for Python
WWW=		https://www.dnspython.org/

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}uv-build>=0.9.21<0.14.0:devel/py-uv-build@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	autoplist concurrent pep517

BINARY_ALIAS=	git=false
NO_ARCH=	yes
NO_TEST=	yes

PORTEXAMPLES=	ddns_client.py ddns_server.py e164.py mx.py name.py reverse.py \
		reverse_name.py xfr.py zonediff.py

OPTIONS_DEFINE=		DNSSEC DOH DOQ EXAMPLES IDNA TRIO
OPTIONS_DEFAULT=	DNSSEC DOH DOQ IDNA TRIO

DNSSEC_DESC=	DNSSEC Support
DOH_DESC=	DNS over HTTPS Support
DOQ_DESC=	DNS over QUIC Support
IDNA_DESC=	Internationalized Domain Names in Application Support
TRIO_DESC=	Concurrent async IO library support with TRIO backend

DNSSEC_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cryptography>=50,1:security/py-cryptography@${PY_FLAVOR}
DOH_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}h2>=4.4:www/py-h2@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}httpcore2>=2.13:www/py-httpcore2@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}httpx2>=2.13:www/py-httpx2@${PY_FLAVOR}
DOQ_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}aioquic>=1.3.0:www/py-aioquic@${PY_FLAVOR}
IDNA_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}idna>=3.20:dns/py-idna@${PY_FLAVOR}
TRIO_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}trio>=0.34:net/py-trio@${PY_FLAVOR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${PORTEXAMPLES:S,^,${WRKSRC}/examples/,} ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
